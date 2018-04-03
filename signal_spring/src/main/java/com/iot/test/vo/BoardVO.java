package com.iot.test.vo;

import javax.inject.Named;

@Named
public class BoardVO {
	private Integer bNo;
	private String bName;
	private String bContent;
	private String bRegDate;
	private String uiNickName;
	private Integer bHit; 
	private Integer bRecom; 
	public Integer getbNo() {
		return bNo;
	}
	public void setbNo(Integer bNo) {
		this.bNo = bNo;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbRegDate() {
		return bRegDate;
	}
	public void setbRegDate(String bRegDate) {
		this.bRegDate = bRegDate;
	}
	public String getUiNickName() {
		return uiNickName;
	}
	public void setUiNickName(String uiNickName) {
		this.uiNickName = uiNickName;
	}
	
	public Integer getbHit() {
		return bHit;
	}
	public void setbHit(Integer bHit) {
		this.bHit = bHit;
	}
	public Integer getbRecom() {
		return bRecom;
	}
	public void setbRecom(Integer bRecom) {
		this.bRecom = bRecom;
	}
	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", bName=" + bName + ", bContent=" + bContent + ", bRegDate=" + bRegDate
				+ ", uiNickName=" + uiNickName + ", bHit=" + bHit + ", bRecom=" + bRecom + "]";
	}
	

}
