package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.Repeat;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Power;
import com.model.PowerRoleRelation;
import com.model.Role;
import com.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	@RequestMapping("/torole")
	public String torole(Role role,ModelMap modelMap){
		modelMap.addAttribute("list", roleService.selectRole(role));
		return "/role/list-role";
	}
	@RequestMapping("/toupdate")
	public String toupdate(Role role,ModelMap modelMap){
		if (role.getId()!=null) {
			modelMap.addAttribute("role",roleService.selectRole(role).get(0) );			
		}
		modelMap.addAttribute("powers", roleService.selectPowers(new Power()));
		return "/role/edit-role";
	}
	@ResponseBody
	@RequestMapping("/update")
	public String update(Role role,ModelMap modelMap,
			@RequestParam(name="powerId") List<Integer> list){
		for (Integer integer : list) {
			System.out.println(integer);
		}
		if (role.getId()!=null) {
			if (roleService.updateRole(role,list)) {
				return "success";
			}
		} else {
			if (roleService.insertRole(role,list)) {
				return "success";
			}
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("/delRole")
	public String delRole(Role role){
		if (roleService.delRole(role)) {
			return "success";
		}
		return "fail";
	}
	
}
