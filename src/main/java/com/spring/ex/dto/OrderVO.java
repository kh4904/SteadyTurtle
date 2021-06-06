package com.spring.ex.dto;

import java.sql.Date;

public class OrderVO {
	private String orderId;
	private String mId;
	private String jCatchName;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String jPhone;
	private int total_sum;
	private Date orderDate;
	private String jMemo;
	private int pNum;
	private int jSumPrice;
	private int cartNum;
	
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
	public String getjCatchName() {
		return jCatchName;
	}
	public void setjCatchName(String jCatchName) {
		this.jCatchName = jCatchName;
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
	public String getjPhone() {
		return jPhone;
	}
	public void setjPhone(String jPhone) {
		this.jPhone = jPhone;
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
	public String getjMemo() {
		return jMemo;
	}
	public void setjMemo(String jMemo) {
		this.jMemo = jMemo;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getjSumPrice() {
		return jSumPrice;
	}
	public void setjSumPrice(int jSumPrice) {
		this.jSumPrice = jSumPrice;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	
	

}
