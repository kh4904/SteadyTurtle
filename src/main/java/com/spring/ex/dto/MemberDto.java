package com.spring.ex.dto;

public class MemberDto {
	// 아이디
	private String mId;
	// 비밀번호
	private String mPw;
	// 이름
	private String mName;
	// 성별
	private String mGender;
	// 휴대전화
	private String mPhone;
	// 생년월일
	private String mBirth;
	// 이메일
	private String mEmail;
	// 주소
	private String mAddr;
	// 회원등급
	private String mGrade;
	// 특이사항
	private String mNote;
	// 구매목록
	private String mList;
	// 마일리지
	private String mMile;
	// 누적마일리지
	private String mCumulmile;
	// 관리자권한
	private String mMaster;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmGrade() {
		return mGrade;
	}
	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}
	public String getmNote() {
		return mNote;
	}
	public void setmNote(String mNote) {
		this.mNote = mNote;
	}
	public String getmList() {
		return mList;
	}
	public void setmList(String mList) {
		this.mList = mList;
	}
	public String getmMile() {
		return mMile;
	}
	public void setmMile(String mMile) {
		this.mMile = mMile;
	}
	public String getmCumulmile() {
		return mCumulmile;
	}
	public void setmCumulmile(String mCumulmile) {
		this.mCumulmile = mCumulmile;
	}
	public String getmMaster() {
		return mMaster;
	}
	public void setmMaster(String mMaster) {
		this.mMaster = mMaster;
	}
	
	// 회원가입 dto
	@Override
	public String toString() {
		return "MemberDto [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mGender=" + mGender + ", mPhone=" + mPhone + ", mBirth=" + mBirth + ", mEmail="
				+ mEmail + ", mAddr=" + mAddr + "]";
	}
	
	public String login() {
		return "MemberDto[mId=" + mId + ", mPw=" + mPw + "]";
	}
	
}

