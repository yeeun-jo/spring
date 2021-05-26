package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Hash;
import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

@Service
public class ModelService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 로그인
	public MemberDTO selectLogin(MemberDTO dto) {
		dto.setUserpw(Hash.getHash(dto.getUserpw()));
		return memberDAO.selectLogin(dto);
	}

}
