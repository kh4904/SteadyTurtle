package com.spring.ex.dto;

import java.sql.Date;

public class CartVO {
	
	private int cartNum;
	private String mId;
	private int pNum;
	private int cartStock;
	private Date addDate;
	private String pPrice;
	private String pName;
	private String pUrl;
	private String pCate;
	private String pShip;
	
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
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public String getpCate() {
		return pCate;
	}
	public void setpCate(String pCate) {
		this.pCate = pCate;
	}
	public String getpShip() {
		return pShip;
	}
	public void setpShip(String pShip) {
		this.pShip = pShip;
	}
	@Override
	public String toString() {
		return "CartVO[ cartNum=" + cartNum + ", mId=" + mId + ", pNum=" + pNum + 
				", cartStock=" + cartStock + ", addDate=" + addDate + ", pPrice=" + pPrice + 
				", pName=" + pName + ", pUrl=" + pUrl + ", pCate=" + pCate + ", pShip=" + pShip + "]";
	}
}