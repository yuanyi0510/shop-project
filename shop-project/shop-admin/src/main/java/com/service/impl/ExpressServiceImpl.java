package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ExpressMapper;
import com.model.Express;
import com.service.ExpressService;

@Service
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressMapper expressMapper;

	@Override
	public List<Express> select(Express express) {
		// TODO Auto-generated method stub
		return expressMapper.select(express);
	}

	@Override
	public boolean delExpress(Express express) {
		// TODO Auto-generated method stub
		if (expressMapper.deleteByPrimaryKey(express.getId())>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateExpress(Express express) {
		// TODO Auto-generated method stub
		if (expressMapper.updateByPrimaryKeySelective(express)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertExpress(Express express) {
		// TODO Auto-generated method stub
		if (expressMapper.insertSelective(express)>0) {
			return true;
		}
		return false;
	}
	
}
