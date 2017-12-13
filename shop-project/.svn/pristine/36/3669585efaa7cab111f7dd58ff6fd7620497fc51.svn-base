package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.ProductClassify;
import com.service.PcService;

//商品分类  ProductClassify表
@RequestMapping("/Pc")
@Controller
public class PcController {
	@Autowired
	private PcService pcService;

	// 查询
	@RequestMapping("/selectAll")
	public String selectAll(ModelMap modelMap, ProductClassify productClassify) {

		modelMap.addAttribute("pcList", pcService.selectAll(productClassify));
		return "/classify/list-classify";
	}

	// 进入新增页面
	@RequestMapping("/toAdd")
	public String toAdd(ProductClassify productClassify,ModelMap modelMap) {
		if(productClassify.getId()!=null){
			modelMap.addAttribute("pc", pcService.selectAll(productClassify).get(0));
		}
		return "/classify/edit-classify";
	}
	//新增操作
    @RequestMapping("/addPc")
    public String addPc(ProductClassify productClassify){
    	if(productClassify.getId()!=null){
    		pcService.updateProductClassify(productClassify);
    	}else{
    	pcService.addProductClassify(productClassify);
    	}
    		return "redirect:/Pc/selectAll";
    	
    }
    //删除操作
	@ResponseBody
	@RequestMapping("/del")
	public String del(ProductClassify productClassify){
		if(pcService.del(productClassify)){
			System.out.println("success");
			return "success";
		}
		System.out.println("fail");
		return "fail";
	}
    
}
