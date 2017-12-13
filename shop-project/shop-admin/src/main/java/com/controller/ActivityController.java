package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Activity;
import com.model.AvtivityCouponRelation;
import com.model.Coupon;
import com.service.ActivityService;

@Controller
@RequestMapping("/activity")
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;

	/**
	 * 跳转到活动页面
	 * @param activity
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/toactivity")
	public String toactivity(Activity activity,ModelMap modelMap){
		modelMap.addAttribute("list", activityService.selectActivity(activity));		
		return "/activity/list-activity";
		
	}
	/**
	 * 查出全部的优惠券，用于jsp页面添加
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selectCoupon")
	public List<Coupon> selectCoupon(){
		List<Coupon> list=activityService.selectCoupon();
		return list;
	}
	
	/**
	 * 判断当前是否有正在进行的活动
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/isCurrent")
	public String isCurrent(){

		if (activityService.isCurrent()) {		
			return "success";
		}
		return "fail";
	}
	
	/**
	 * 跳转到详情页面
	 * @param activity
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/toupdate")
	public String toupdate(Activity activity,ModelMap modelMap){
		
		if (activity.getId()!=null) {			
			modelMap.addAttribute("activity", activityService.selectActivity(activity).get(0));			
		}
		return "/activity/edit-activity";		
	}
	
	
	/**
	 * 添加优惠券
	 * @param activity
	 * @param cid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addCoupon")
	public String addCoupon(Activity activity,@RequestParam( name="cid")Integer cid){
		
		if (activityService.addCoupon(activity, cid)) {		
			return "success";
		}
		return "fail";
	}
	
	/**
	 * 修改活动
	 * @param activity
	 * @param modelMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public String update(Activity activity,ModelMap modelMap){
		if (activity.getId()!=null) {
			if(activityService.updateActivity(activity))
			return "success";		
		}else{
			if(activityService.insertActivity(activity))
				return "success";	
		}
		
		return "fail";		
	}
	
	/**
	 * 删除优惠券，在点击减少按钮时，如果是0张则删除此类优惠券
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteCouponById")
	public String deleteCouponById(Integer id){
		
		if (activityService.deleteCouponById(id)) {
			return "success";
		}
		return "fail";
	}
	
	/**
	 * 级联删除活动
	 * @param activity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delActivity")
	public String delActivity(Activity activity){
		
		if (activityService.delActivity(activity)) {
			return "success";
		}
		return "fail";
	}
	
	
}
