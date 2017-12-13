package com.service;

import java.util.List;

import com.model.AdminUser;
import com.model.Role;

public interface UserService {

	List<AdminUser> selectUser(AdminUser adminUser);

	List<Role> selectRole(Role role);

	boolean updateUser(AdminUser adminUser);

	boolean insertUser(AdminUser adminUser);

	boolean delUser(AdminUser adminUser);

}
