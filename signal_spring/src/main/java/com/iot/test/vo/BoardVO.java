package com.iot.test.vo;

public class BoardVO {
	public Integer bNo;
	public String bName;
	public String bContent;
	public String bRegDate;
	public Integer uiNo;

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

	public Integer getUiNo() {
		return uiNo;
	}

	public void setUiNo(Integer uiNo) {
		this.uiNo = uiNo;
	}

	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", bName=" + bName + ", bContent=" + bContent + ", bRegDate=" + bRegDate
				+ ", uiNo=" + uiNo + "]";
	}

}
