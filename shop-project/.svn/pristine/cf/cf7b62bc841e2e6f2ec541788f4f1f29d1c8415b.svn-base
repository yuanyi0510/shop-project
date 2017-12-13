package com.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.PowerMapper;
import com.model.Power;
import com.service.PowerService;

@Service
public class PowerServiceImpl implements PowerService {

	@Autowired
	private PowerMapper powerMapper;

	@Override
	public List<Power> select(Power power) {
		// TODO Auto-generated method stub
		return powerMapper.select(power);
	}

	@Override
	public boolean updatePower(Power power) {
		// TODO Auto-generated method stub
		if (powerMapper.updateByPrimaryKeySelective(power)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertPower(Power power) {
		// TODO Auto-generated method stub
		if (powerMapper.insertSelective(power)>0) {
			return true;
		}
		return false;
	}

	@Transactional
	@Override
	public boolean delPower(Power power) {
		// TODO Auto-generated method stub
		if (powerMapper.deleteByPrimaryKey(power.getId())>0) {
			if (power.getParentId()!=null) {
				if (powerMapper.deleteByParentId(power.getParentId())>0) {
					return true;
				}
			}
				return true;						
		}
		return false;
	}
	
	
}
