package com.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.AdminUser;
import com.model.Role;
import com.service.RoleService;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping("/tologin")
	public String tologin(){
		return "/adminuser/login";
	}
	
	@RequestMapping("/dologin")
	public String dologin(AdminUser adminUser,HttpSession session){
		AdminUser loginUser=userService.selectUser(adminUser).get(0);
		if (loginUser!=null) {
			session.setAttribute("loginUser", loginUser);
			Role role = new Role();
			role.setId(loginUser.getRoleId());
			Role r = roleService.selectRole(role).get(0);
			session.setAttribute("role", r);
			return "/index";
		}else {
			return "redirect:/user/tologin";
		}
		
	}
	
	@RequestMapping("/touserlist")
	public String touserlist(AdminUser adminUser,ModelMap map){
		map.addAttribute("rolelist", userService.selectRole(new Role()));
		map.addAttribute("list", userService.selectUser(adminUser));
		return "/adminuser/list-user";
	}
	
	@RequestMapping("/toupdate")
	public String toupdate(AdminUser adminUser,ModelMap map){
		map.addAttribute("rolelist", userService.selectRole(new Role()));
		if (adminUser.getId()!=null) {
			map.addAttribute("user", userService.selectUser(adminUser).get(0));
		}
		return "/adminuser/edit-user";
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public String update(AdminUser adminUser){
		if (adminUser.getId()!=null) {
			if (userService.updateUser(adminUser)) {
				return "success";
			}
		}else{
			if (userService.insertUser(adminUser)) {
				return "success";
			}
		}
		return "fail";
	}
	@RequestMapping("/toRegister")
	public String toRegister(){
		return "/adminuser/edit-user";
	}
	
	@ResponseBody
	@RequestMapping("/delUser")
	public String delUser(AdminUser adminUser){
		
			if (userService.delUser(adminUser)) {
				return "success";
			}
		
		return "fail";
	}
	@RequestMapping("/error")
	public String error(){
		return "/error/404";
	}
}
