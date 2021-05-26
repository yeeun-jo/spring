package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.phoneBook.PnumDAO;
import com.itbank.phoneBook.PnumDTO;

@Service
public class PnumService {
	
	@Autowired
	private PnumDAO dao;

	public int insertPnum(PnumDTO dto) {
		return dao.insertPnum(dto);
	}

	public PnumDTO getPnum(String name) {
		return dao.selectOne(name);
	}

}
