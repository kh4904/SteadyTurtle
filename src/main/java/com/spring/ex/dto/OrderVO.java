package com.spring.ex.dto;

import java.sql.Date;

public class OrderVO {
	
	private String orderId;
	private String mId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int total_sum;
	private Date orderDate;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	
	public int getTotal_sum() {
		return total_sum;
	}
	public void setTotal_sum(int total_sum) {
		this.total_sum = total_sum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
