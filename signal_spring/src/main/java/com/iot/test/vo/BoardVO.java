package com.iot.test.vo;

public class BoardVO {
	private Integer bNo;
	private String bName;
	private String bContent;
	private String bRegDate;
	private String uiId;
	private int bHit;
	private int bRecom;

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

	public String getUiId() {
		return uiId;
	}

	public void setUiId(String uiId) {
		this.uiId = uiId;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public int getbRecom() {
		return bRecom;
	}

	public void setbRecom(int bRecom) {
		this.bRecom = bRecom;
	}

	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", bName=" + bName + ", bContent=" + bContent + ", bRegDate=" + bRegDate
				+ ", uiId=" + uiId + ", bHit=" + bHit + ", bRecom=" + bRecom + "]";
	}

}
