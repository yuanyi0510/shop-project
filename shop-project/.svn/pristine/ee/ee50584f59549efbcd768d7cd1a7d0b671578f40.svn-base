package com.dao;

import java.util.List;

import com.model.ProductAttr;
import com.model.ProductAttrValue;

public interface ProductAttrValueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductAttrValue record);

    int insertSelective(ProductAttrValue record);

    ProductAttrValue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductAttrValue record);

    int updateByPrimaryKey(ProductAttrValue record);
    
    List<ProductAttrValue> selectAll(ProductAttr productAttr);
    
    boolean insertList(ProductAttr productAttr);
    
    boolean updateList(ProductAttrValue productAttrValue);
    
    boolean del(Integer id);
    
}