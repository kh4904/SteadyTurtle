package com.spring.ex.dto;

import java.sql.Date;

public class CartVO {
	
	private int cartNum;
	private String mId;
	private int pNum;
	private int cartStock;
	private Date addDate;
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
	@Override
	public String toString() {
		return "CartVO[ cartNum=" + cartNum + ", mId=" + mId + ", pNum=" + pNum + ", cartStock=" + cartStock + ", addDate=" + addDate + "]";
	}
}