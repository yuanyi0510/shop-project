package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Product;
import com.service.ProductAdService;
import com.service.ProductService;

@Controller
@RequestMapping("/pro")
public class ProductController {
	@Autowired
	private ProductService productService;

	@ResponseBody
	@RequestMapping("/selectByName")
	public List<Product> selectByName(Product product){
		List<Product> list=productService.select(product);
		return list;
	}
	
	@RequestMapping("/topro")
	public String topro(Product product,ModelMap modelmap){
		return "/product/list-product";
	}
	
	@RequestMapping("/toupdate")
	public String toupdate(Product product,ModelMap modelmap){
		return "/product/edit-product";
	}
	
	@RequestMapping("/touploadpic")
	public String touploadpic(Product product,ModelMap modelmap){
		return "/product/upload-product";
	}
}
