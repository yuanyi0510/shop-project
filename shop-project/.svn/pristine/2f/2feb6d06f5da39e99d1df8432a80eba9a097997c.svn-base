package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ClassifyRelationMapper;
import com.model.ClassifyRelation;
import com.service.ClassifyRelationService;

@Service
public class ClassifyRelationServiceImpl implements ClassifyRelationService {
	@Autowired
	private ClassifyRelationMapper classifyRelationMapper;

	@Override
	public List<ClassifyRelation> selectAll(ClassifyRelation classifyRelation) {

		return classifyRelationMapper.selectAll(classifyRelation);
	}

	@Override
	public boolean add(ClassifyRelation classifyRelation) {
		if (classifyRelationMapper.insertSelective(classifyRelation) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(ClassifyRelation classifyRelation) {
		if (classifyRelationMapper.updateByPrimaryKeySelective(classifyRelation) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean del(Integer id) {
		if(classifyRelationMapper.deleteByPrimaryKey(id)>0){
			return true;
		}
		return false;
	}

}
