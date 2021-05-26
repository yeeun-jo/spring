package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Hash;
import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public MemberDTO getUser(MemberDTO dto) {
		dto.setUserpw(Hash.getHash(dto.getUserpw()));
		return dao.selectOne(dto);
	}
	
}
