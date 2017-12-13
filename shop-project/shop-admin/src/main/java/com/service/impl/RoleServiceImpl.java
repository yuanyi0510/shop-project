package com.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PowerMapper;
import com.dao.PowerRoleRelationMapper;
import com.dao.RoleMapper;
import com.model.Power;
import com.model.PowerRoleRelation;
import com.model.Role;
import com.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private PowerMapper powerMapper;
    @Autowired
    private PowerRoleRelationMapper prrMapper;
	@Override
	public List<Role> selectRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.selectRole(role);
	}

	@Override
	public List<Power> selectPowers(Power power) {
		// TODO Auto-generated method stub
		return powerMapper.selectPower(power);
	}

	@Transactional
	@Override
	public boolean updateRole(Role role, List<Integer> list) {
		// TODO Auto-generated method stub
		if (roleMapper.updateByPrimaryKey(role)>0) {
			if (prrMapper.deleteByRoleId(role)>0) {
				for (Integer powerId : list) {
					PowerRoleRelation prr=new PowerRoleRelation();
					prr.setPowerId(powerId);
					prr.setRoleId(role.getId());
					if (prrMapper.insertSelective(prr)<0) {
						return false;
					}
				}
			}
			
		}
		return true;
	}

	@Transactional
	@Override
	public boolean insertRole(Role role, List<Integer> list) {
		// TODO Auto-generated method stub
		if (roleMapper.insert(role)>0) {
			for (Integer powerId : list) {
				PowerRoleRelation prr=new PowerRoleRelation();
				prr.setPowerId(powerId);
				prr.setRoleId(role.getId());
				if (prrMapper.insertSelective(prr)<0) {
					return false;
				}
			}
		}
		return true;
	}

	@Transactional
	@Override
	public boolean delRole(Role role) {
		// TODO Auto-generated method stub
		if (roleMapper.deleteByPrimaryKey(role.getId())>0) {
			if (prrMapper.deleteByRoleId(role)>=0) {
				return true;
			}
		}
		return false;
	}
}
