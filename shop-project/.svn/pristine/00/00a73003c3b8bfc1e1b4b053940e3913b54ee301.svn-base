package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminUserMapper;
import com.dao.RoleMapper;
import com.model.AdminUser;
import com.model.Role;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired 
	private AdminUserMapper adminUserMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<AdminUser> selectUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		return adminUserMapper.select(adminUser);
	}

	@Override
	public List<Role> selectRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.selectRole(role);
	}

	@Override
	public boolean updateUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		if (adminUserMapper.updateByPrimaryKeySelective(adminUser)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		if (adminUserMapper.insertSelective(adminUser)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delUser(AdminUser adminUser) {
		// TODO Auto-generated method stub
		if (adminUserMapper.deleteByPrimaryKey(adminUser.getId())>0) {
			return true;
		}
		return false;
	}

}
