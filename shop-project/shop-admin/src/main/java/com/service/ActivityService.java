package com.service;

import java.util.List;

import com.model.Activity;
import com.model.Coupon;

public interface ActivityService {

	
	List<Activity> selectActivity(Activity activity);

	boolean updateActivity(Activity activity);

	boolean insertActivity(Activity activity);

	boolean deleteCouponById(Integer id);

	List<Coupon> selectCoupon();

	boolean addCoupon(Activity activity, Integer cid);

	boolean delActivity(Activity activity);

	boolean isCurrent();

}
