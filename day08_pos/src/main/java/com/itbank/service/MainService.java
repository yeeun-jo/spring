package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;
import com.itbank.model.PosDAO;
import com.itbank.model.PosDTO;

@Service
public class MainService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private PosDAO posDAO;

	// 로그인
	public MemberDTO getUser(MemberDTO dto) {
		return memberDAO.selectOne(dto);
	}

	public List<PosDTO> getMenu() {
		return posDAO.selectMenu();
	}

	public int addMenu(PosDTO dto) {
		return posDAO.insertMenu(dto);
	}
}
