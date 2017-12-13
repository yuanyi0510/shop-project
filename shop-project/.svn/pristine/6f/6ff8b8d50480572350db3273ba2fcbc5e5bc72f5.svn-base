package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductAdMapper;
import com.dao.ProductMapper;
import com.model.Product;
import com.model.ProductAd;
import com.service.ProductAdService;

@Service
public class ProductAdServiceImpl implements ProductAdService {
	@Autowired
	private ProductAdMapper productAdMapper;
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<ProductAd> select(ProductAd productAd) {
		// TODO Auto-generated method stub
		return productAdMapper.select(productAd);
	}

	@Override
	public List<Product> selectProduct() {
		// TODO Auto-generated method stub
		return productMapper.select(new Product());
	}

	@Override
	public boolean delAd(ProductAd productAd) {
		// TODO Auto-generated method stub
		if (productAdMapper.deleteByPrimaryKey(productAd.getId())>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateAD(ProductAd productAd) {
		// TODO Auto-generated method stub
		if (productAdMapper.updateByPrimaryKeySelective(productAd)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertAD(ProductAd productAd) {
		// TODO Auto-generated method stub
		if (productAdMapper.insertSelective(productAd)>0) {
			return true;
		}
		return false;
	}

}
