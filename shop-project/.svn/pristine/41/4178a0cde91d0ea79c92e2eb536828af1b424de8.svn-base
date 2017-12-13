package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.ClassifyRelation;
import com.model.ProductClassify;
import com.service.ClassifyRelationService;
import com.service.PcService;

@RequestMapping("/Cr")
@Controller
public class ClassifyRelationController {
	@Autowired
	private PcService pcService;
	@Autowired
	private ClassifyRelationService ClassifyRelationService;

	// 进入主界面 显示全部
	@RequestMapping("/selectAll")
	public String selectAll(ClassifyRelation classifyRelation, ModelMap modelMap) {
		modelMap.addAttribute("crsList", ClassifyRelationService.selectAll(classifyRelation));
		return "relation/list-relation";
	}

	// 数据回显
	@RequestMapping("/toAdd")
	public String toAdd(ModelMap modelMap, ClassifyRelation classifyRelation) {
		if (classifyRelation.getId() != null) {
			modelMap.addAttribute("cr", ClassifyRelationService.selectAll(classifyRelation).get(0));
		}
		modelMap.addAttribute("pcList", pcService.selectAll(new ProductClassify()));
		return "relation/edit-relation";
	}

	@RequestMapping("/add")
    public String add(ClassifyRelation classifyRelation){
		if(classifyRelation.getId()!=null)
		{
			ClassifyRelationService.update(classifyRelation);
		}
		else{
		ClassifyRelationService.add(classifyRelation);
		}	
      return "redirect:selectAll";		
	}
	@ResponseBody
	@RequestMapping("/del")
	public String del(Integer id){
		if(ClassifyRelationService.del(id)){
			return "success";
		}
		return "error";
	}
}
