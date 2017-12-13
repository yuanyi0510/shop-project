package com.service;

import java.util.List;

import com.model.ProductClassify;
import com.model.ProductClassifySub;

public interface PcService {
	
    //搜索所有的商品类型
	public List<ProductClassify> selectAll(ProductClassify productClassify);
	
	//新增一个商品类型
	public boolean addProductClassify(ProductClassify productClassify);
	
	
	//修改
	public boolean updateProductClassify(ProductClassify productClassify);
	
	//删除
	public boolean del(ProductClassify productClassify);
}
