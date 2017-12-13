package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CouponMapper;
import com.model.Coupon;
import com.service.CouponService;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponMapper couponMapper;

	@Override
	public List<Coupon> selectAllCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		List<Coupon> list=couponMapper.select(coupon);		
		return list;
	}

	@Override
	public Coupon selectById(Coupon coupon) {
		// TODO Auto-generated method stub
		return couponMapper.selectByPrimaryKey(coupon.getId());
	}

	@Override
	public boolean delCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		if (couponMapper.deleteByPrimaryKey(coupon.getId())>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		if (couponMapper.updateByPrimaryKeySelective(coupon)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		if (couponMapper.insertSelective(coupon)>0) {
			return true;
		}
		return false;
	}

}
