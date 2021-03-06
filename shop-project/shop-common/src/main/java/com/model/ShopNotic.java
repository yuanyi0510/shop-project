package com.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ShopNotic {
    private Integer id;

    private String noticTitle;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createTime;

    private Integer createUser;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updateTime;

    private String noticContent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNoticTitle() {
        return noticTitle;
    }

    public void setNoticTitle(String noticTitle) {
        this.noticTitle = noticTitle == null ? null : noticTitle.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getNoticContent() {
        return noticContent;
    }

    public void setNoticContent(String noticContent) {
        this.noticContent = noticContent == null ? null : noticContent.trim();
    }

	
	
    
}