package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductClassifySubMapper;
import com.model.ProductClassify;
import com.model.ProductClassifySub;
import com.service.PcsService;
@Service
public class PcsServiceImpl implements PcsService{
	@Autowired
	private ProductClassifySubMapper productClassifySubMapper;
	
	@Override
	public List<ProductClassifySub> selectPcsbyId(ProductClassify productClassify) {
		List<ProductClassifySub> list=productClassifySubMapper.selectPcsbyId(productClassify);
		return list;
	}

	@Override
	public List<ProductClassifySub> selectAll(ProductClassifySub productClassifySub) {
		List<ProductClassifySub> list=productClassifySubMapper.selectAll(productClassifySub);
		return list;
	}

	@Override
	public boolean add(ProductClassifySub productClassifySub) {
		if(productClassifySubMapper.insert(productClassifySub)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean update(ProductClassifySub productClassifySub) {
		if(productClassifySubMapper.updateByPrimaryKey(productClassifySub)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean del(Integer id) {
		if(productClassifySubMapper.deleteByPrimaryKey(id)>0){
			return true;
		}
		return false;
	}
}
