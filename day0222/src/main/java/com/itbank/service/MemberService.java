package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.Hash;
import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public MemberDTO getMember(MemberDTO dto) {
		dto.setUserpw(Hash.getHash(dto.getUserpw()));
		return memberDAO.selectOne(dto);
	}

	public boolean checkId(String userid) {
		String dbId = memberDAO.selectId(userid);
		return dbId != null;
	}

	public int joinMember(MemberDTO user) {
		user.setUserpw(Hash.getHash(user.getUserpw()));
		return memberDAO.join(user);
	}
}
