package com.spring.ex.dto;

public class BasketDto {
	// 장바구니에 담은 고객분 아이디
	private String bsId;
	// 장바구니에 담긴 상품이름
	private String bsName;
	// 장바구니에 담긴 상품개수
	private String bsCount;
	// 장바구니에 담긴 상품가격
	private String bsPrice;
	// 장바구니에 담긴 상품 이미지 url
	private String bsUrl;
	
	public String getBsId() {
		return bsId;
	}
	public void setBsId(String bsId) {
		this.bsId = bsId;
	}
	public String getBsName() {
		return bsName;
	}
	public void setBsName(String bsName) {
		this.bsName = bsName;
	}
	public String getBsCount() {
		return bsCount;
	}
	public void setBsCount(String bsCount) {
		this.bsCount = bsCount;
	}
	public String getBsPrice() {
		return bsPrice;
	}
	public void setBsPrice(String bsPrice) {
		this.bsPrice = bsPrice;
	}
	public String getBsUrl() {
		return bsUrl;
	}
	public void setBsUrl(String bsUrl) {
		this.bsUrl = bsUrl;
	}
	
}
