package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.phoneBook.PnumDTO;
import com.itbank.service.PnumService;

@RestController
public class MemberAjaxController {

	@Autowired private PnumService ps;
	private ObjectMapper jsonMapper = new ObjectMapper();
	
	// 회원가입
	@PostMapping(value = "pnum", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String join(@RequestBody PnumDTO dto) {
		int row = ps.insertPnum(dto);
		return row == 1 ? "회원가입 성공" : "회원가입 실패";
	}

	
	// 회원 조회
	

	
	
	

}
