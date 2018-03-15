package com.iot.test.vo;

public class UserInfoVO {
	
	private int uiNo;
	private String uiId;
	private String uiNickName;
	private String uiPwd;
	public int getUiNo() {
		return uiNo;
	}
	public void setUiNo(int uiNo) {
		this.uiNo = uiNo;
	}
	public String getUiId() {
		return uiId;
	}
	public void setUiId(String uiId) {
		this.uiId = uiId;
	}
	public String getUiNickName() {
		return uiNickName;
	}
	public void setUiNickName(String uiNickName) {
		this.uiNickName = uiNickName;
	}
	public String getUiPwd() {
		return uiPwd;
	}
	public void setUiPwd(String uiPwd) {
		this.uiPwd = uiPwd;
	}
	@Override
	public String toString() {
		return "UserInfoVO [uiNo=" + uiNo + ", uiId=" + uiId + ", uiNickName=" + uiNickName + ", uiPwd=" + uiPwd + "]";
	}
	
}
