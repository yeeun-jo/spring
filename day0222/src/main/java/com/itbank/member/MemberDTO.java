package com.itbank.member;

public class MemberDTO {
//	IDX      NOT NULL VARCHAR2(20) 
//	USERID            VARCHAR2(20) 
//	USERNAME          VARCHAR2(20) 
//	USERPW            VARCHAR2(20) 

	private int idx;
	private String userid, username,userpw;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	
	
	
}
