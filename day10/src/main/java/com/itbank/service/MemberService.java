package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.Hash;
import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	public MemberDTO getMember(String userid) {
		return dao.selectMember(userid);
	}

	public int insertMember(MemberDTO dto) {
		dto.setUserpw(Hash.getHash(dto.getUserpw()));
		return dao.insertMember(dto);
	}

	public List<HashMap<String, Object>> getMemberList() {
		return dao.selectAll();
	}

	
}
