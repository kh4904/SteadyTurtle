package com.spring.ex.dto;

public class CashDto {
	// 상품이름
	private String pName;
	// 상품개수
	private String pCountsSell;
	// 상품가격
	private String pPrice;
	// 상품배송상태
	private String pShip;
	// 상품 합계?
	private String pSumPrice;
	
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
	public String getpShip() {
		return pShip;
	}
	public void setpShip(String pShip) {
		this.pShip = pShip;
	}
	public String getpSumPrice() {
		return pSumPrice;
	}
	public void setpSumPrice(String pSumPrice) {
		this.pSumPrice = pSumPrice;
	}
	
	@Override
	public String toString() {
		return "CashDto[pName=" + pName + ", pCountsSell=" + pCountsSell + ", pPrice=" + pPrice +
				", pShip=" + pShip + ", pSumPrice=" + pSumPrice + "]";
	}
	
}