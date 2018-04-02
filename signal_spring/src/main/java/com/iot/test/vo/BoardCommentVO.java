package com.iot.test.vo;

public class BoardCommentVO {
	private Integer bcNo;
	private String bcText;
	private String uiId;
	private Integer bNo;
	private String bcRegDate;
	public Integer getBcNo() {
		return bcNo;
	}
	public void setBcNo(Integer bcNo) {
		this.bcNo = bcNo;
	}
	public String getBcText() {
		return bcText;
	}
	public void setBcText(String bcText) {
		this.bcText = bcText;
	}
	public String getUiId() {
		return uiId;
	}
	public void setUiId(String uiId) {
		this.uiId = uiId;
	}
	public Integer getbNo() {
		return bNo;
	}
	public void setbNo(Integer bNo) {
		this.bNo = bNo;
	}
	public String getBcRegDate() {
		return bcRegDate;
	}
	public void setBcRegDate(String bcRegDate) {
		this.bcRegDate = bcRegDate;
	}
	@Override
	public String toString() {
		return "BoardCommentVO [bcNo=" + bcNo + ", bcText=" + bcText + ", uiId=" + uiId + ", bNo=" + bNo
				+ ", bcRegDate=" + bcRegDate + "]";
	}
}
