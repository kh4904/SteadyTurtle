package com.spring.ex.dto;

public class SellDto {
	// 판매된 상품명
	private String sProduct;
	// 상품을 구매한 고객아이디
	private String sId;
	// 판매상품 카테고리
	private String sCate;
	// 판매상품 가격
	private String sPrice;
	// 구매자가 산 상품 갯수
	private String sCount;
	// 구매자 이름
	private String sCustomer;
	// 구매자 성별
	private String sGender;
	// 판매일
	private String sDate;
	
	public String getsProduct() {
		return sProduct;
	}
	public void setsProduct(String sProduct) {
		this.sProduct = sProduct;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsCate() {
		return sCate;
	}
	public void setsCate(String sCate) {
		this.sCate = sCate;
	}
	public String getsPrice() {
		return sPrice;
	}
	public void setsPrice(String sPrice) {
		this.sPrice = sPrice;
	}
	public String getsCount() {
		return sCount;
	}
	public void setsCount(String sCount) {
		this.sCount = sCount;
	}
	public String getsCustomer() {
		return sCustomer;
	}
	public void setsCustomer(String sCustomer) {
		this.sCustomer = sCustomer;
	}
	public String getsGender() {
		return sGender;
	}
	public void setsGender(String sGender) {
		this.sGender = sGender;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	
	
}
