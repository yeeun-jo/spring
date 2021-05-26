package com.itbank.member;

public interface MemberDAO {

	String selectId(String userid);
	// select userid from member2 where userid=#{userid}

}
