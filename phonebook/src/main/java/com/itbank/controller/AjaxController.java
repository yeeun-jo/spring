package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.phonebook.PhonebookDTO;
import com.itbank.service.PhonebookService;

@RestController
public class AjaxController {

	@Autowired private PhonebookService ps;
	private ObjectMapper jsonMapper = new ObjectMapper();
	
	@GetMapping(value = "phonebook", produces = "application/json;charset=utf8")
	public String listAll() throws JsonProcessingException {
		List<PhonebookDTO> list = ps.listAll();
		
		String data = jsonMapper.writeValueAsString(list);
		return data;
	}
	
	@PostMapping(value = "phonebook", consumes = "application/json;charset=utf8")
	public int insertPhonebook(@RequestBody PhonebookDTO dto) {
		int row = ps.insertPb(dto);
		return row;
	}
}
