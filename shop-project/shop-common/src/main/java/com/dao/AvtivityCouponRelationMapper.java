package com.dao;

import java.util.List;

import com.model.Activity;
import com.model.AvtivityCouponRelation;

public interface AvtivityCouponRelationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AvtivityCouponRelation record);

    int insertSelective(AvtivityCouponRelation record);

    AvtivityCouponRelation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AvtivityCouponRelation record);

    int updateByPrimaryKey(AvtivityCouponRelation record);

	int deleteCouponById(Integer id);

	int updateByCouponIdAndActivityId(AvtivityCouponRelation acr);
    
	int deleteByActivityId(Integer id);
   

	
}