package com.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ActivityMapper;
import com.dao.AvtivityCouponRelationMapper;
import com.dao.CouponMapper;
import com.model.Activity;
import com.model.AvtivityCouponRelation;
import com.model.Coupon;
import com.service.ActivityService;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityMapper activityMapper;
	@Autowired
	private AvtivityCouponRelationMapper  acrMapper;
	@Autowired
	private CouponMapper couponMapper;
	
	@Override
	public List<Activity> selectActivity(Activity activity) {
		// TODO Auto-generated method stub
		return activityMapper.selectAll(activity);
	}

	/**
	 * 级联更新
	 */
	@Transactional
	@Override
	public boolean updateActivity(Activity activity) {
		// TODO Auto-generated method stub
		
		if (activityMapper.updateByPrimaryKeySelective(activity)>0) {
			List<AvtivityCouponRelation> list=activity.getaCouponRelations();
			for (AvtivityCouponRelation acr : list) {
				if (acrMapper.updateByPrimaryKeySelective(acr)<0) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	@Transactional
	@Override
	public boolean insertActivity(Activity activity) {
		// TODO Auto-generated method stub
		if (activityMapper.insertSelective(activity)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteCouponById(Integer id) {
		// TODO Auto-generated method stub
		if (acrMapper.deleteCouponById(id)>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Coupon> selectCoupon() {
		// TODO Auto-generated method stub
		return couponMapper.select(new Coupon());
	}

	/**
	 * 如果当前的优惠券存在则数量加一，不存在则添加此类优惠券
	 */
	@Override
	public boolean addCoupon(Activity activity, Integer cid) {
		// TODO Auto-generated method stub
		AvtivityCouponRelation acr=new AvtivityCouponRelation();
		acr.setActivityId(activity.getId());
		acr.setCouponId(cid);
		if (acrMapper.updateByCouponIdAndActivityId(acr)>0) {
			return true;
		}else{
			if (acrMapper.insertSelective(acr)>0) {
				return true;
			}
		}
		return false;
	}

	@Transactional
	@Override
	public boolean delActivity(Activity activity) {
		// TODO Auto-generated method stub
		
		if (activityMapper.deleteByPrimaryKey(activity.getId())>0) {
			if (acrMapper.deleteByActivityId(activity.getId())>0) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean isCurrent() {
		// TODO Auto-generated method stub
		List<Activity> list=activityMapper.selectAll(new Activity());
		for (Activity activity : list) {
			if (activity.getIsCurrent().equals(1)) {
				return true;
			}
		}
		return false;
	}
}
