package com.spring.ex.dto;

public class BoardDTO {

	private String mName;
	private String bTitle;
	private String bCate;
	private String bNote;
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbCate() {
		return bCate;
	}
	public void setbCate(String bCate) {
		this.bCate = bCate;
	}
	public String getbNote() {
		return bNote;
	}
	public void setbNote(String bNote) {
		this.bNote = bNote;
	}
	
	
	@Override
	public String toString() {
		return "BoardDTO [mName=" + mName + ", bTitle=" + bTitle + ", bCate=" + bCate + ", bNote=" + bNote + "]";
	}
}
