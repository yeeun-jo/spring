package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Hash;
import com.itbank.model.MemberDTO;
import com.itbank.model.TestDAO;

@Service
public class TestService {

	@Autowired
	private TestDAO testDAO;

	public List<String> getTest() {
		return testDAO.selectTest();
	}

	public List<MemberDTO> getMemberList() {
		return testDAO.selectMemberList();
	}

	public MemberDTO getMember(MemberDTO user) {
		return testDAO.selectMember(user);
	}

	// 로그인 시, 비밀번호 해시처리
	public MemberDTO getMemberOne(MemberDTO user) {
		user.setUserpw(Hash.getHash(user.getUserpw()));
		MemberDTO login = testDAO.selectOne(user);
		return login;
	}

	// 회원 가입시 , 두개의 비밀번호가 일치하는지
	public int insertMember(HashMap<String, String> param) {
		String userpw = param.get("userpw");
		String userpw2 = param.get("userpw2");
		if(userpw.equals(userpw2)) {
			return testDAO.insertMember(param);
		}
		return -1;
	}
	
	


}
