package com.spring.ex.dto;

public class CashlistDto {
	// 상품결제번호
	private String cNum;
	// 결제자 아이디
	private String mId;
	// 결제자 이름
	private String mName;
	// 결제 금액
	private String pPrice;
	// 결제 상품갯수 
	private String pCount;
	// 결제 상품 카테고리
	private String pCate;
	// 상품이름
	private String pName;
	// 배송지 주소
	private String mAddr;
	// 결제자 이메일
	private String mEmail;
	// 결제자 우편번호
	private String cMailNum;
	// 결제자 이름
	private String cName;
	// 결제자 휴대번호
	private String cPhone;
	
	public String getcNum() {
		return cNum;
	}
	public void setcNum(String cNum) {
		this.cNum = cNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getpCount() {
		return pCount;
	}
	public void setpCount(String pCount) {
		this.pCount = pCount;
	}
	public String getpCate() {
		return pCate;
	}
	public void setpCate(String pCate) {
		this.pCate = pCate;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}

	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getcMailNum() {
		return cMailNum;
	}
	public void setcMailNum(String cMailNum) {
		this.cMailNum = cMailNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	
	@Override
	public String toString() {
		return "CashlistDto[cNum=" + cNum + ", mId=" + mId + ", mName=" + mName +
				", pPrice=" + pPrice + ", pCount=" + pCount + ", pCate=" + pCate +
				", pName=" + pName + ", mAddr=" + mAddr + ", mEmail=" + mEmail + 
				", cMilNum=" + cMailNum + ", cName=" + cName + ", cPhone=" + cPhone + "]";
	}
	
}