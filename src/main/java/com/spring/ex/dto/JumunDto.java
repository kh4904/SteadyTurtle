package com.spring.ex.dto;

public class JumunDto {
	// 번호
	private String jNum;
	// 주문상품이름
	private String jName;
	// 주문상품 카테고리
	private String jCate;
	// 주문상품 배송비
	private String jShipPrice;
	// 주문상품에 사용한 마일리지
	private String jMile;
	// 주문상품총액 가격
	private String jPrice;
	// 주문상품 개수
	private String jCount;
	// 상품 구매자
	private String jCustomer;
	// 상품 구매자 아이디
	private String jId;
	// 상품 구매자 이메일
	private String jEmail;
	// 받는사람 주소
	private String jAddr;
	// 받는사람 우편번호
	private String jMailNum;
	// 받는사람 이름
	private String jCatchName;
	// 받는사람 전화번호
	private String jPhone;
	// 상품 이미지 저장경로
	private String jUrl;	
	// 상품 배송여부
	private String jShip;
	// 주문상품 주문일
	private String jJumunDate;
	// 주문상품 배송완료일
	private String jFinishDate;
	// 주문 승인여부
	private String jState;
	// 주문시 메모
	private String jMemo;
	
	
	public String getjNum() {
		return jNum;
	}
	public void setjNum(String jNum) {
		this.jNum = jNum;
	}
	public String getjName() {
		return jName;
	}
	public void setjName(String jName) {
		this.jName = jName;
	}
	public String getjCate() {
		return jCate;
	}
	public void setjCate(String jCate) {
		this.jCate = jCate;
	}
	public String getjShipPrice() {
		return jShipPrice;
	}
	public void setjShipPrice(String jShipPrice) {
		this.jShipPrice = jShipPrice;
	}
	public String getjMile() {
		return jMile;
	}
	public void setjMile(String jMile) {
		this.jMile = jMile;
	}
	public String getjPrice() {
		return jPrice;
	}
	public void setjPrice(String jPrice) {
		this.jPrice = jPrice;
	}
	public String getjCount() {
		return jCount;
	}
	public void setjCount(String jCount) {
		this.jCount = jCount;
	}
	public String getjCustomer() {
		return jCustomer;
	}
	public void setjCustomer(String jCustomer) {
		this.jCustomer = jCustomer;
	}
	public String getjId() {
		return jId;
	}
	public void setjId(String jId) {
		this.jId = jId;
	}
	public String getjEmail() {
		return jEmail;
	}
	public void setjEmail(String jEmail) {
		this.jEmail = jEmail;
	}
	public String getjAddr() {
		return jAddr;
	}
	public void setjAddr(String jAddr) {
		this.jAddr = jAddr;
	}
	public String getjMailNum() {
		return jMailNum;
	}
	public void setjMailNum(String jMailNum) {
		this.jMailNum = jMailNum;
	}
	public String getjCatchName() {
		return jCatchName;
	}
	public void setjCatchName(String jCatchName) {
		this.jCatchName = jCatchName;
	}
	public String getjPhone() {
		return jPhone;
	}
	public void setjPhone(String jPhone) {
		this.jPhone = jPhone;
	}
	public String getjUrl() {
		return jUrl;
	}
	public void setjUrl(String jUrl) {
		this.jUrl = jUrl;
	}
	public String getjShip() {
		return jShip;
	}
	public void setjShip(String jShip) {
		this.jShip = jShip;
	}
	public String getjJumunDate() {
		return jJumunDate;
	}
	public void setjJumunDate(String jJumunDate) {
		this.jJumunDate = jJumunDate;
	}
	public String getjFinishDate() {
		return jFinishDate;
	}
	public void setjFinishDate(String jFinishDate) {
		this.jFinishDate = jFinishDate;
	}
	public String getjState() {
		return jState;
	}
	public void setjState(String jState) {
		this.jState = jState;
	}
	public String getjMemo() {
		return jMemo;
	}
	public void setjMemo(String jMemo) {
		this.jMemo = jMemo;
	}

	@Override
	public String toString() {
		return "JumunDto[ jNum=" + jNum + ", jName=" + jName + ", jPrice=" + jPrice + ", jCount=" + jCount + 
				", jCustomer=" + jCustomer + ", jId=" + jId + ", jUrl=" + jUrl + 
				", jShip=" + jShip + ", jJumunDate=" + jJumunDate + ", jFinishDate=" + jFinishDate + ", jState=" + jState + 
				", jMemo=" + jMemo +", jCate=" + jCate + ", jEmail=" + jEmail + ", jAddr=" + jAddr + ", jMailNum= " + jMailNum + 
				", jCatchName=" + jCatchName + ", jPhone=" + jPhone + " ]";
	}

	public String jumunLogin() {
		return "jumDto[jPhone=" + jPhone + "]";
	}
}
