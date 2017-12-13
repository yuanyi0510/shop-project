package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Power;
import com.service.PowerService;

@Controller
@RequestMapping("/power")
public class PowerController {
	@Autowired
	private PowerService powerService;

	@RequestMapping("/topower")
	public String topower(Power power,ModelMap modelMap){
		modelMap.addAttribute("list", powerService.select(power));
		return "/power/list-power";
	}
	@ResponseBody
	@RequestMapping("/selectSub")
	public List<Power> selectSub(Power power){
		return powerService.select(power);
	}
	@RequestMapping("/toupdate")
	public String toupdate(Power power,ModelMap modelMap){
		modelMap.addAttribute("parentname", powerService.select(new Power()));
		if (power.getId()!=null) {			
			modelMap.addAttribute("power", powerService.select(power).get(0));
		}
		return "/power/edit-power";
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public String update(Power power,ModelMap modelMap){
		if (power.getId()!=null) {
			if (powerService.updatePower(power)) {
				return "success";
			}
		}else{
			if (powerService.insertPower(power)) {
				return "success";
			}
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("/delPower")
	public String delPower(Power power){
		
			if (powerService.delPower(power)) {
				return "success";
			}
		
		return "fail";
	}
}
