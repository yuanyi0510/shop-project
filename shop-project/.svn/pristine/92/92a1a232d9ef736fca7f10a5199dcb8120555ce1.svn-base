package com.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.ShopNotic;
import com.mysql.fabric.xmlrpc.base.Data;
import com.service.ShopNoticService;

@Controller
@RequestMapping("/shopnotice")
public class ShopNoticController {

	@Autowired
	private ShopNoticService shopNoticService;
	
	/**
	 * 查询全部的公告并显示
	 * @param shopNotic
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/toshopNotice")
	public String toshopNotice(ShopNotic shopNotic,ModelMap modelMap){
		System.out.println(shopNotic);
		modelMap.addAttribute("list", shopNoticService.select(shopNotic));
		return "/notic/list-notic";
	}
	
	@RequestMapping("/toupdateNotic")
	public String toupdateNotic(ShopNotic shopNotic,ModelMap modelMap){
		if (shopNotic.getId()!=null) {
			modelMap.addAttribute("notice", shopNoticService.select(shopNotic).get(0));
		}
		return "/notic/edit-notic";
		
	}
	
	@ResponseBody
	@RequestMapping("/updateNotic")
	public String updateNotic(ShopNotic shopNotic){
		Date date=new Date();
		if (shopNotic.getId()!=null) {
			shopNotic.setUpdateTime(date);
			if (shopNoticService.update(shopNotic)) {
				return "success";
			}
		}else{
			shopNotic.setCreateTime(date);
			if (shopNoticService.insert(shopNotic)) {
				return "success";
			}
		}
		return "fail";
		
	}
	
	@ResponseBody
	@RequestMapping("/delNotic")
	public String delNotic(ShopNotic shopNotic){
		if (shopNoticService .delNotic(shopNotic)) {
			return "success";
		}
		return "fail";
	}
	 
}
