package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.model.Express;
import com.service.ExpressService;

@Controller
@RequestMapping("/express")
public class ExpressController {

	@Autowired
	private ExpressService expressService;
	
	/**
	 * 跳转到所有快递页面
	 * @param map
	 * @param express
	 * @return
	 */
	@RequestMapping("/toexpress")
	public String toexpress(ModelMap map,Express express){
		map.addAttribute("list",expressService.select(express) );
		return "/express/list-express";
	}
	/**
	 * 跳转到修改快递页面，这里新增和修改使用一个页面，根据id判断是否回显数据
	 * @param map
	 * @param express
	 * @return
	 */
	@RequestMapping("/toupdate")
	public String toupdate(ModelMap map,Express express){
		System.out.println(express);
		if (express.getId()!=null) {
			//如果id不为空，按照id查出指定的快递信息，select方法返回的是一个list，所以这里用get方法获取list中第一个值
			map.addAttribute("express", expressService.select(express).get(0));
		}
		return "/express/edit-express";
	}
	
	/**
	 * 修改或者新增数据
	 * @param express
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/updateExpress")
	public String updateExpress(Express express,
			@RequestParam(name="file")MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException{
		//接收前台传递文件，并将图片路径存到express对象中
		if (file!=null&&file.getOriginalFilename()!=null) {
			String fileName=file.getOriginalFilename();
			fileName=UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
			String realPath=request.getServletContext().getRealPath("/upload");
			String filePath=realPath+File.separator+fileName;
			File uploadfile=new File(filePath);
			file.transferTo(uploadfile);
			String imgpath=request.getContextPath()+"/upload/"+fileName;
			express.setExpressImg(imgpath);
			express.setExpressImgReal(filePath);
		}
		//根据express中是否有id值判断执行更新还是插入操作
		String mess="fail";
		if (express.getId()!=null) {
			if (expressService.updateExpress(express)) {
				mess= "success";
			}
		}else{
			if (expressService.insertExpress(express)) {
				mess= "success";
			}
		}
		request.setAttribute("mess", mess);
		return "/express/edit-express";
	}
	/**
	 * 删除数据
	 * @param express
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delExpress")
	public String delExpress(Express express){
		if (expressService.delExpress(express)) {
			return "success";
		}
		return "fail";
	}
}
