package com.spring.ex.dto;

public class BoardDTO {

	// 작성자
	private String mName;
	// 게시글 번호
	private String bNum;
	// 게시글 메인제목
	private String bTitle;
	// 게시글 내용
	private String bNote;
	// 게시글 날짜
	private String bDate;
	// 게시글 카테고리
	private String bCate;
	// 게시글 답변내용
	private String bReply;
	
	private String bUrl;
	private String bImg;
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getbNum() {
		return bNum;
	}
	public void setbNum(String bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbNote() {
		return bNote;
	}
	public void setbNote(String bNote) {
		this.bNote = bNote;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getbCate() {
		return bCate;
	}
	public void setbCate(String bCate) {
		this.bCate = bCate;
	}
	public String getbReply() {
		return bReply;
	}
	public void setbReply(String bReply) {
		this.bReply = bReply;
	}
	
	public String getbUrl() {
		return bUrl;
	}
	public void setbUrl(String bUrl) {
		this.bUrl = bUrl;
	}
	public String getbImg() {
		return bImg;
	}
	public void setbImg(String bImg) {
		this.bImg = bImg;
	}
	@Override
	public String toString() {
		return "BoardDTO [mName=" + mName + ",bNum=" + bNum + ", bTitle=" + bTitle + ", bCate=" + bCate + ", bNote=" + bNote + ", bDate=" + bDate + ", bReply=" + bReply + 
				", bUrl=" + bUrl + ", bImg=" + bImg + "]";
	}
}
