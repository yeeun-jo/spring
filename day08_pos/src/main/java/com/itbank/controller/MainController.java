package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.PosDTO;
import com.itbank.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService ms;
	
	@GetMapping("")
	public String index() {
		return "index";
	}
	
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = ms.getUser(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	// 상품입고
	@GetMapping("add")
	public void add() {}
	
	@PostMapping("add")
	public String add(PosDTO dto) {
		int row = ms.addMenu(dto);
		return "index"; 
	}
	
	// 상품 판매
	@GetMapping("sell")
	public void sell() {}
	
	
	
}
