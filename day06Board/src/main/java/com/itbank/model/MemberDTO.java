package com.itbank.model;

public class MemberDTO {

//	TABLE : MEMBER2
//	IDX      NOT NULL NUMBER		PRIMARY KEY        
//	USERID   NOT NULL VARCHAR2(20)  
//	USERPW   NOT NULL VARCHAR2(500) HASH 처리
//	USERNAME NOT NULL VARCHAR2(20)  
//	GENDER   NOT NULL VARCHAR2(20)  
//	EMAIL    NOT NULL VARCHAR2(100)
	
	private int idx;
	private String userid, userpw, username, gender, email;
	
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
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
