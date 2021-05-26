package com.itbank.model;

import java.util.List;

public interface TestDAO {
	// 인터페이스는 추상클래스다
	// 인터페이스는 추상메서드만 정의할 수 있다
	// 인터페이스는 메서드 몸체를 작성할 수 없다
	// 인터페이스의 메서드는 자동으로 public abstract 속성을 가진다
	
	List<String> selectTest();
	List<MemberDTO> selectMemberList();
	MemberDTO selectMember(MemberDTO user);
	int insertMember(MemberDTO dto);
	
	// 메서드의 이름이 mapper.xml 의 id와 일치해야 한다
}
