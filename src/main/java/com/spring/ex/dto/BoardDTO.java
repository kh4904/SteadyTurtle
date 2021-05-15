package com.spring.ex.dto;

public class BoardDTO {

	private String bTitle;
	private String bCate;
	private String bNote;
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
		return "BoardDTO [bTitle=" + bTitle + ", bCate=" + bCate + ", bNote=" + bNote + "]";
	}
}
