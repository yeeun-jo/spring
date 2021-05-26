package com.itbank.phoneBook;

public class PnumDTO {
//	IDX    NOT NULL NUMBER       
//	NAME   NOT NULL VARCHAR2(20) 
//	PNUM   NOT NULL VARCHAR2(20) 
//	GENDER          VARCHAR2(20) 
	
	private int idx;
	private String name, pnum,gender,userid,userpw;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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

}
