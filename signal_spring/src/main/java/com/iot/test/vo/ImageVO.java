package com.iot.test.vo;

public class ImageVO {

	private Integer imgNo;
	private String imgName;
	private char imgProtect;
	private Integer bNo;
	public Integer getImgNo() {
		return imgNo;
	}
	public void setImgNo(Integer imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public char getImgProtect() {
		return imgProtect;
	}
	public void setImgProtect(char imgProtect) {
		this.imgProtect = imgProtect;
	}
	public Integer getbNo() {
		return bNo;
	}
	public void setbNo(Integer bNo) {
		this.bNo = bNo;
	}
	@Override
	public String toString() {
		return "ImageVO [imgNo=" + imgNo + ", imgName=" + imgName + ", imgProtect=" + imgProtect + ", bNo=" + bNo + "]";
	}
	
}
