package com.dao;

import java.util.List;

import com.model.ProductClassify;

public interface ProductClassifyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductClassify record);

    int insertSelective(ProductClassify record);

    ProductClassify selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductClassify record);

    int updateByPrimaryKey(ProductClassify record); 
    
    List<ProductClassify> selectAll(ProductClassify productClassify);
}