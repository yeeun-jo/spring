package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum, amount;
	private String type, keyword;
	
	
	// 생성자를 통해서 기본값을 1페이지, 10개로 지정
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {}: type.split("");
	}
	
	// 검색조건 유지
	public String getListLink() {
		// 여러개의 파라미터들을 연결해서 url의 형태로 만들어주는 기능
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("keyword", this.getKeyword())
				.queryParam("type", this.getType());
		
		return builder.toUriString();
	}

}
