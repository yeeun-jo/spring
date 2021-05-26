package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.phonebook.PhoneBookDTO;
import com.itbank.service.PhoneBookService;

@RestController
public class PhoneBookController {
	
	@Autowired
	private PhoneBookService ps;
	
	private ObjectMapper mapper = new ObjectMapper();

	@GetMapping(value="phonebook", produces="application/json;charset=utf8")
	public String phoneBookList() throws JsonProcessingException {
		
		List<PhoneBookDTO> list = ps.getPhoneBookList();
		String data = mapper.writeValueAsString(list);
		return data;
	}
	
	@PostMapping(value = "phonebook", consumes = "application/json;charset=utf8")
	public int insertPhonebook(@RequestBody PhoneBookDTO dto	) {
		int row = ps.insertPB(dto);
		return row;
	}
	
	@DeleteMapping(value = "phonebook/{idx}")
	public int deletePhonebook(@PathVariable int idx) {
		int row = ps.deletePB(idx);
		return row;
	}
	
	@PutMapping(value = "phonebook", consumes = "application/json;charset=utf8")
	public int updatePhonebook(@RequestBody PhoneBookDTO dto) {
		int row = ps.updatePB(dto);
		return row;
	}
	
	@GetMapping(value ="phonebook/{word}", produces = "application/json;charset=utf8")
	public String searchPB (@PathVariable String word) throws JsonProcessingException {
		List<PhoneBookDTO> searchList = ps.searchList(word);
		String data = mapper.writeValueAsString(searchList);
		return data;
	}



}
