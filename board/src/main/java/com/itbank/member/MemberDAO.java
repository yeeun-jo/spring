package com.itbank.member;

public interface MemberDAO {

	MemberDTO selectOne(MemberDTO dto);

	String selectId(String userid);

	int join(MemberDTO user);
	
}
