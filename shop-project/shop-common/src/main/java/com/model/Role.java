package com.model;

import java.util.List;

public class Role {
    private Integer id;

    private String roleName;

   
    
    private List<PowerRoleRelation> powerRoleRelation;

	

	public List<PowerRoleRelation> getPowerRoleRelation() {
		return powerRoleRelation;
	}

	public void setPowerRoleRelation(List<PowerRoleRelation> powerRoleRelation) {
		this.powerRoleRelation = powerRoleRelation;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", powerRoleRelation=" + powerRoleRelation + "]";
	}

	

	
    
}