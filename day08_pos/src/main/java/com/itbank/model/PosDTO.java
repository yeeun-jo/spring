package com.itbank.model;

public class PosDTO {
//	IDX     NOT NULL NUMBER       
//	PRODUCT NOT NULL VARCHAR2(20) 
//	PRICE   NOT NULL VARCHAR2(20) 
//	COUNT   NOT NULL NUMBER   
	
	private int idx, count;
	private String product, price;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
