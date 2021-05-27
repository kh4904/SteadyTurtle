package com.spring.ex.dto;

public class BasketDto {
	// 장바구니에 담은 고객분 아이디
	private String mId;
	// 장바구니에 담긴 상품이름
	private String pName;
	// 장바구니에 담긴 상품개수
	private String pCountsSell;
	// 장바구니에 담긴 상품가격
	private String pPrice;
	// 장바구니에 담긴 상품 이미지 url
	private String pUrl;
	//장바구니에 담긴 상품 총 가격
	private String pPriceSell;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpCountsSell() {
		return pCountsSell;
	}
	public void setpCountsSell(String pCountsSell) {
		this.pCountsSell = pCountsSell;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public String getpPriceSell() {
		return pPriceSell;
	}
	public void setpPriceSell(String pPriceSell) {
		this.pPriceSell = pPriceSell;
	}
	
	@Override
	public String toString() {
		return "BasketInsertDto [ mId =" + mId + ", pName=" + pName + ", pCountsSell=" +
				pCountsSell + ", pPrice=" + pPrice + ", pUrl=" + pUrl + "]";
	}
	
}