package com.itbank.sell;

public class sellDTO {
//	IDX       NOT NULL NUMBER       
//	PRODUCT            VARCHAR2(20) 
//	SELLCOUNT          NUMBER       
//	TOTAL              NUMBER    
// 	selldate	
//	deleted
	
	private int idx, sellCount,total,deleted;
	private String product;
	private String selldate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getSelldate() {
		return selldate;
	}
	public void setSelldate(String selldate) {
		this.selldate = selldate;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

}
