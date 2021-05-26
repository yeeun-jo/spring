package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String login(MemberDTO user, HttpSession session) {
		MemberDTO login = ms.getMember(user);
		session.setAttribute("login", login);
		String viewName = login != null ? "redirect:/" : "redirect:javascript:histroy.go(-1)";
		return viewName;
	}
}
