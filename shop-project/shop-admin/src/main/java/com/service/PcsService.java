package com.service;

import java.util.List;

import com.model.ProductClassify;
import com.model.ProductClassifySub;

public interface PcsService {

	// 通过ProductClassify的id查找商品的子类
	public List<ProductClassifySub> selectPcsbyId(ProductClassify productClassify);

	// 通过ProductClassifySub查找所有商品
	public List<ProductClassifySub> selectAll(ProductClassifySub productClassifySub);
   //增添操作
	public boolean add(ProductClassifySub productClassifySub);
	//修改操作
	public boolean update(ProductClassifySub productClassifySub);
	//删除操作
	public boolean del(Integer id);
}
