package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.ProductClassify;
import com.model.ProductClassifySub;
import com.service.PcService;
import com.service.PcsService;

////商品分类子表  ProductClassifySub表
@RequestMapping("/Pcs")
@Controller
public class PcsController {
	@Autowired
	private PcsService pcsService;
	@Autowired
	private PcService pcService;

	// 查询所有的商品ProductClassifySub
	@ResponseBody
	@RequestMapping("/selectPcsbyId")
	public List<ProductClassifySub> selectPcsbyId(ProductClassify productClassify) {
		List<ProductClassifySub> pcsList = pcsService.selectPcsbyId(productClassify);
		return pcsList;
	}

	// 查询
	@RequestMapping("/selectAll")
	public String selectAll(ProductClassifySub productClassifySub, ModelMap modelMap) {
		List<ProductClassifySub> pcsList = pcsService.selectAll(productClassifySub);
		modelMap.addAttribute("pcsList", pcsList);
		return "/classify/list-sub-classify";
	}
    //数据回显
	@RequestMapping("/toAdd")
	public String toAdd(ModelMap modelMap, ProductClassifySub productClassifySub) {
		if (productClassifySub.getId() != null) {
			modelMap.addAttribute("pcs", pcsService.selectAll(productClassifySub).get(0));
		}
		modelMap.addAttribute("pcNameList", pcService.selectAll(new ProductClassify()));
		return "/classify/edit-sub-classify";
	}
    //增加或者修改操作
	@RequestMapping("/add")
	public String add(ProductClassifySub productClassifySub) {
		if (productClassifySub.getId() != null) {
			pcsService.update(productClassifySub);
		} else {
			pcsService.add(productClassifySub);
		}
		return "redirect:/Pcs/selectAll";
	}
    //子分类的删除操作
	@ResponseBody
	@RequestMapping("/del")
	public String del(Integer id) {
		if (pcsService.del(id)) {
			return "success";
		} else {
			return "error";
		}
	}
}
