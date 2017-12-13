package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductAttrValueMapper;
import com.model.ProductAttr;
import com.model.ProductAttrValue;
import com.service.ProductAttrValueService;

@Service
public class ProductAttrValueServiceImpl implements ProductAttrValueService {
	@Autowired
	private ProductAttrValueMapper productAttrValueMapper;

	@Override
	public boolean insert(ProductAttrValue productAttrValue) {
		if(productAttrValueMapper.insert(productAttrValue)>0){
			return true;
		}
		return false;
	}

	@Override
	public List<ProductAttrValue> selectAll(ProductAttr productAttr) {
		
		return productAttrValueMapper.selectAll(productAttr);
	}

	@Override
	public boolean insertList(ProductAttr productAttr) {
		
		return productAttrValueMapper.insertList(productAttr);
	}

	@Override
	public boolean updateList(ProductAttr productAttr) {
		List<ProductAttrValue> list=productAttr.getProductAttrValues();
		for (ProductAttrValue productAttrValue : list) {
			if(productAttrValue.getId()!=null){
				if(productAttrValueMapper.updateList(productAttrValue)==false)
				{
					return false;
				}
			}
		}
		return true;
	}

	@Override
	public boolean del(Integer id) {
		
		return productAttrValueMapper.del(id);
	}

	@Override
	public boolean delete(Integer id) {
		if(productAttrValueMapper.deleteByPrimaryKey(id)>0)
		return true;
		return false;
	}

}
