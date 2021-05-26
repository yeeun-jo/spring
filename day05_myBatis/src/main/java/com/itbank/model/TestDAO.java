package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public List<String> selectTest() {
		return sst.selectList("selectTest");
		// selectList()에 인자로 전달되는 문자열 값이 mapper에서의 id이다
	}
	
	// 회원목록 전체 가져오기
	public List<MemberDTO> selectMemberList() {
		return sst.selectList("selectMemberList");
	}

	// id로 해당하는 계정찾기
	// mybatis로  sql을 실행할 때에 자바 메서드에서는 전달하는 매개변수가 1개 이하여야 한다
	// 그럼 2개 이상을 전달하려면 ? DTO or Map 이용
	public MemberDTO selectMember(MemberDTO user) {
		return sst.selectOne("selectMember", user);
	}

	// 로그인
	public MemberDTO selectOne(MemberDTO user) {
		return sst.selectOne("loginMember", user);
	}
	
	// 회원가입
	public int insertMember(HashMap<String, String> param) {
		return sst.insert("insertMember", param);
	}
	
	
}
