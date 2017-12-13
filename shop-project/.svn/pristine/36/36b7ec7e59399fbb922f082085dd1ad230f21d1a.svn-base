package com.dao;

import java.util.List;

import com.model.ProductClassify;
import com.model.ProductClassifySub;

public interface ProductClassifySubMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductClassifySub record);

    int insertSelective(ProductClassifySub record);

    ProductClassifySub selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductClassifySub record);

    int updateByPrimaryKey(ProductClassifySub record);
    //通过productClassify查找
    List<ProductClassifySub> selectPcsbyId(ProductClassify productClassify);
    //通过productClassifySub查找
    List<ProductClassifySub> selectAll(ProductClassifySub productClassifySub);
    
}