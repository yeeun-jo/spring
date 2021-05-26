package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.phonebook.PhoneBookDAO;
import com.itbank.phonebook.PhoneBookDTO;

@Service
public class PhoneBookService {
	
	@Autowired
	private PhoneBookDAO dao;

	public List<PhoneBookDTO> getPhoneBookList() {
		
		return dao.selectList();
	}

	public int insertPB(PhoneBookDTO dto) {
		return dao.insertPB(dto);
	}

	public int deletePB(int idx) {
		return dao.deletePB(idx);
	}

	public int updatePB(PhoneBookDTO dto) {
		return dao.updatePB(dto);
	}

	public List<PhoneBookDTO> searchList(String word) {
		return dao.searchList(word);
	}

	
}
