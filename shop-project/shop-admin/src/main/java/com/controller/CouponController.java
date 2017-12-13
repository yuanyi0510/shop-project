package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Coupon;
import com.service.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/tocoupon")
	public String toCoupon(ModelMap map,Coupon coupon){
		List<Coupon> list=couponService.selectAllCoupon(coupon);
		map.addAttribute("list", list);
	
		return "/coupon/list-coupon";
	}
	
	@RequestMapping("/toupdate")
	public String toupdate(Coupon coupon,ModelMap map){
		if (coupon.getId()!=null) {
			map.addAttribute("coupon", couponService.selectById(coupon));
		}
		return "/coupon/edit-coupon";
	}
	
	@ResponseBody
	@RequestMapping("/updateCoupon")
	public String updateCoupon(Coupon coupon){
		if (coupon.getId()!=null) {
			if (couponService.updateCoupon(coupon)) {
				return "success";
			}
		}else{
			if (couponService.insertCoupon(coupon)) {
				return "success";
			}
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("/delCoupon")
	public String delCoupon(Coupon coupon){
		if (couponService.delCoupon(coupon)) {
			return "success";
		}
		return "fail";
	}
	
	
}
