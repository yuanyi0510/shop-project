package com.service;

import java.util.List;

import com.model.Power;
import com.model.Role;

public interface RoleService {

	List<Role> selectRole(Role role);

	List<Power> selectPowers(Power power);

	boolean updateRole(Role role, List<Integer> list);

	boolean insertRole(Role role, List<Integer> list);

	boolean delRole(Role role);

}
