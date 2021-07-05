package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.phonebook.PhonebookDAO;
import com.itbank.phonebook.PhonebookDTO;

@Service
public class PhonebookService {

	@Autowired private PhonebookDAO dao;

	public List<PhonebookDTO> listAll() {
		return dao.selectAll();
	}

	public int insertPb(PhonebookDTO dto) {
		return dao.insertPb(dto);
	}
}
