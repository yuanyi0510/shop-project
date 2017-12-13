package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ShopNoticMapper;
import com.model.ShopNotic;
import com.service.ShopNoticService;

@Service
public class ShopNoticServiceImpl implements ShopNoticService {

	@Autowired
	private ShopNoticMapper shopNoticMapper;
	
	@Override
	public List<ShopNotic> select(ShopNotic shopNotic) {
		// TODO Auto-generated method stub
		return shopNoticMapper.select(shopNotic);
	}

	@Override
	public boolean delNotic(ShopNotic shopNotic) {
		// TODO Auto-generated method stub
		if (shopNoticMapper.deleteByPrimaryKey(shopNotic.getId())>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(ShopNotic shopNotic) {
		// TODO Auto-generated method stub
		if (shopNoticMapper.updateByPrimaryKeySelective(shopNotic)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insert(ShopNotic shopNotic) {
		// TODO Auto-generated method stub
		if (shopNoticMapper.insertSelective(shopNotic)>0) {
			return true;
		}
		return false;
	}

}
