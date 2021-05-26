package com.itbank.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MainController {

	@Autowired
	private MemberService ms;
	
	@RequestMapping("")
	public String index() {
		return "index";
	}

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String login(MemberDTO dto, HttpSession session, String uri) {
		MemberDTO login = ms.getUser(dto);
		session.setAttribute("login", login);
		uri = (uri == null) ? "/" : uri;
		return "redirect:" + uri ;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "index";
	}
	
	@GetMapping("board")
	public void board() {}
	
	@GetMapping("gallery")
	public void gallery() {}
	
	@GetMapping("qna")
	public void qna() {}
	
	@GetMapping("msg")
	public void msg() {}
	
	@ExceptionHandler(ServletException.class)
	public String error() {
		return "error";
	}
	
	
}
