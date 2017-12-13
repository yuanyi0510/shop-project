package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductClassifyMapper;
import com.dao.ProductClassifySubMapper;
import com.model.ProductClassify;
import com.model.ProductClassifySub;
import com.service.PcService;

@Service
public class PcServiceImpl implements PcService {
	@Autowired
	private ProductClassifyMapper productClassifyMapper;
	@Autowired
	private ProductClassifySubMapper productClassifySubMapper;
    //实现商品的分类
	public List<ProductClassify> selectAll(ProductClassify productClassify) {
		List<ProductClassify> list= productClassifyMapper.selectAll(productClassify);
		return list;
	}
	
	
	@Override
	public boolean addProductClassify(ProductClassify productClassify) {
		int m=productClassifyMapper.insertSelective(productClassify);
		if(m>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean updateProductClassify(ProductClassify productClassify) {
		if(productClassifyMapper.updateByPrimaryKey(productClassify)>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean del(ProductClassify productClassify) {
		// TODO Auto-generated method stub
		if(productClassifySubMapper.selectPcsbyId(productClassify).isEmpty()){
		int m=productClassifyMapper.deleteByPrimaryKey(productClassify.getId());
		 if(m>0){
			 return true;
		 }
		 
		}
		return false;
	}






}
