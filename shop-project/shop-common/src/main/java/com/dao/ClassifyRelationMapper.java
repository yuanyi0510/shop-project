package com.dao;

import java.util.List;

import com.model.ClassifyRelation;

public interface ClassifyRelationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ClassifyRelation record);

    int insertSelective(ClassifyRelation record);

    ClassifyRelation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ClassifyRelation record);

    int updateByPrimaryKey(ClassifyRelation record);
    
    List<ClassifyRelation> selectAll(ClassifyRelation classifyRelation);
}