package com.dao;

import java.util.List;

import com.model.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Power record);

    int insertSelective(Power record);

    Power selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Power record);

    int updateByPrimaryKey(Power record);

    //角色中查询权限及子类使用的
	List<Power> selectPower(Power power);
	//权限管理自身使用的
	List<Power> select(Power power);

	int deleteByParentId(Integer parentId);
}