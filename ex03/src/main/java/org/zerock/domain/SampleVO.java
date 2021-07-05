package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor	// 모든 속성을 사용하는 생성자를 위한 어노테이션 SampleVO(mno,fistName,lastName)
@NoArgsConstructor	// 비어 있는 생성자를 만들기 위한 어노테이션 SampleVO()
public class SampleVO {

	private Integer mno;
	private String firstName, lastName;
}
