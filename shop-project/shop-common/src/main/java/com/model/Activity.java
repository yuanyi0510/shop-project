package com.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Activity {
    private Integer id;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date endTime;

    private String isCurrent;

    private String isStart;

    private List<AvtivityCouponRelation> aCouponRelations;
    
     
   
	public List<AvtivityCouponRelation> getaCouponRelations() {
		return aCouponRelations;
	}

	public void setaCouponRelations(List<AvtivityCouponRelation> aCouponRelations) {
		this.aCouponRelations = aCouponRelations;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getIsCurrent() {
        return isCurrent;
    }

    public void setIsCurrent(String isCurrent) {
        this.isCurrent = isCurrent == null ? null : isCurrent.trim();
    }

    public String getIsStart() {
        return isStart;
    }

    public void setIsStart(String isStart) {
        this.isStart = isStart == null ? null : isStart.trim();
    }

	@Override
	public String toString() {
		return "Activity [id=" + id + ", startTime=" + startTime + ", endTime=" + endTime + ", isCurrent=" + isCurrent
				+ ", isStart=" + isStart + "]";
	}
    
}