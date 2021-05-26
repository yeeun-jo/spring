package com.itbank.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.Hash;
import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	// 패스워드가 일치하는지 확인
	public int insertMember(HashMap<String, String> param) {
		String userpw = param.get("userpw");
		String userpw2 = param.get("userpw2");
		
		// 패스워드가 일치하면 memberDAO.insert(param) 여기로 이동
		if(userpw.equals(userpw2)) {
			return memberDAO.insert(param);
		}
		
		return -1;	// -1을 받으면 비밀번호가 서로 일치하지 않는다 라는 약속
	}

	// 로그인 시, 비밀번호 해시처리
	public MemberDTO getMember(MemberDTO dto) {
		dto.setUserpw(Hash.getHash(dto.getUserpw()));
		MemberDTO login = memberDAO.selectMember(dto);
		return login;
	}

	// 회원정보 수정 후 세션처리
	public MemberDTO getMember(String userid, String userpw) {
		MemberDTO dto = new MemberDTO();	// 빈 객체 생성하고
		dto.setUserid(userid);				// 전달받은 값을 객체에 넣어준 후
		dto.setUserpw(userpw);
		return getMember(dto);				// 기존에 만들어진 getMember메서드를 호출하여 작업한다
	}

	// 회원 정보 수정 - 기존비밀번호와 새로바꾸는 비번2개가 일치하는지확인, 해시처리
	public int updateMember(HashMap<String, String> param) {
		String userpw2 = param.get("userpw2");
		String userpw3 = param.get("userpw3");
		
		if(userpw2.equals(userpw3)) {
			param.put("userpw", Hash.getHash(param.get("userpw")));
			param.put("userpw2", Hash.getHash(param.get("userpw3")));
			return memberDAO.updateMember(param);
		}
		
		return -1;
	}

	
}
