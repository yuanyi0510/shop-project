package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.model.ProductAd;
import com.service.ProductAdService;

@Controller
@RequestMapping("/productad")
public class ProductAdController {

	@Autowired
	private ProductAdService productAdService;
	@RequestMapping("/toproductad")
	public String toproductad(ProductAd productAd,ModelMap modelMap){
		modelMap.addAttribute("list", productAdService.select(productAd));
		return "/ad/list-ad";
	}
	@RequestMapping("/toupdate")
	public String toupdate(ProductAd productAd,ModelMap modelMap){
		modelMap.addAttribute("product", productAdService.selectProduct());
		if (productAd.getId()!=null) {
			modelMap.addAttribute("ad", productAdService.select(productAd).get(0));
		}
		return "/ad/edit-ad";
	}
	@RequestMapping("/update")
	public String update(ProductAd productAd,@RequestParam(name="file")MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException{
		if (file!=null&&file.getOriginalFilename()!=null&&file.getOriginalFilename().equals(' ')) {
			String fileName=file.getOriginalFilename();
			fileName=UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
			String realPath=request.getServletContext().getRealPath("/upload");
			String filePath=realPath+File.separator+fileName;
			File uploadfile=new File(filePath);
			file.transferTo(uploadfile);
			String imgpath=request.getContextPath()+"/upload/"+fileName;
			productAd.setAdPath(imgpath);
			productAd.setAdRealPath(filePath);						
		}
		String mess="操作失败！";
		if (productAd.getId()!=null) {
			if (productAdService.updateAD(productAd)) {
				mess="更新成功！";
			}
		} else {
			if (productAdService.insertAD(productAd)) {
				mess="插入成功！";
			}
		}
		request.setAttribute("mess", mess);
		return "/ad/edit-ad";
	}
	@ResponseBody
	@RequestMapping("/delAd")
	public String delAd(ProductAd productAd){
		if (productAdService.delAd(productAd)) {
			return "success";
		}
		return "fail";
	}
}
