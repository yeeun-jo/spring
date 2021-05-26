package com.itbank.board;

import java.util.Date;

public class BoardDTO {
//	TABLE : BOARD2
//	IDX          NOT NULL NUMBER         
//	TITLE        NOT NULL VARCHAR2(200)  
//	WRITER       NOT NULL NUMBER         
//	CONTEXT      NOT NULL VARCHAR2(2000) 
//	CREATIONDATE NOT NULL DATE           
//	VIEWCOUNT    NOT NULL NUMBER         
//	IPADDR       NOT NULL VARCHAR2(20)   
//	UPLOADFILE   NOT NULL VARCHAR2(200)  
//	DELETED      NOT NULL NUMBER
	
//	USERID		 from MEMBER2
//	USERNAME	 from MEMBER2
	
	private int idx, writer, viewCount, deleted;
	private String title, context, ipaddr, uploadFile, userid, username;
	private Date creationDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
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
	
	
	
}
