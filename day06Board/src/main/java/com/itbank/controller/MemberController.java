package com.itbank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.ModelService;

@Controller
public class MemberController {
	
	@Autowired
	private ModelService ms;

	@GetMapping("")
	public String index() {return "index";}
	
	@GetMapping("login/")
	public void login() {}
	
	@PostMapping("login/")
	public ModelAndView login(MemberDTO dto, HttpServletRequest request, HttpSession session) {
		MemberDTO login = ms.selectLogin(dto);
		session.setAttribute("login", login);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(login != null ? "redirect:/" : "msg");
		if(login == null) {
			mav.addObject("msg", "아이디 혹은 비밀번호를 잘못입력하였습니다.");
		}
		return mav;
		
	}
	
	@GetMapping("logout/")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	
}
