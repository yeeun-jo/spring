package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.Hash;
import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;

	public MemberDTO getMember(MemberDTO user) {
		user.setUserpw(Hash.getHash(user.getUserpw()));
		return dao.selectMember(user);
	}
}
