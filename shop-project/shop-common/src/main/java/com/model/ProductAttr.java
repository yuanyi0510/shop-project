package com.model;

import java.util.List;

public class ProductAttr {
    private Integer id;

    private String attrName;
    
    private List<ProductAttrValue> productAttrValues;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName == null ? null : attrName.trim();
    }

	public List<ProductAttrValue> getProductAttrValues() {
		return productAttrValues;
	}

	public void setProductAttrValues(List<ProductAttrValue> productAttrValues) {
		this.productAttrValues = productAttrValues;
	}


    
}