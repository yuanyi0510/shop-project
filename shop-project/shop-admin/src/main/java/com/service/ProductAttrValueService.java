package com.service;

import java.util.List;

import com.model.ProductAttr;
import com.model.ProductAttrValue;

public interface ProductAttrValueService {
//插入数据
	public boolean insert(ProductAttrValue productAttrValue);
	//查询全部
	public List<ProductAttrValue> selectAll(ProductAttr productAttr);
	//插入一组数据
	public boolean insertList(ProductAttr productAttr);
	//更新                                                        
	public  boolean updateList(ProductAttr productAttr);
	//通过外键删除
	public boolean del(Integer id);
	//通过主键删除
	public boolean delete(Integer id);
	
}
