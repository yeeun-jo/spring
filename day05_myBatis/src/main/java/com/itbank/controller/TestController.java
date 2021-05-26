package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService ts;
	
	@GetMapping("")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		List<String> list = ts.getTest();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("ex01")
	public ModelAndView ex01() {
		ModelAndView mav = new ModelAndView("ex01");
		List<MemberDTO> list = ts.getMemberList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("ex02")
	public void ex02() {}
	
	@PostMapping("ex02")
	public ModelAndView ex02(MemberDTO user) {
		ModelAndView mav = new ModelAndView("ex02");
		MemberDTO dto = ts.getMember(user);
		mav.addObject("dto", dto);
		return mav;
		
	}
	
	@GetMapping("login/")
	public void ex03() {}
	
	@PostMapping("login/")
	public String ex03(MemberDTO user , HttpSession session) {
		MemberDTO login = ts.getMemberOne(user);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@GetMapping("logout/")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	
	@GetMapping("join/")
	public void join() {}
	
	@PostMapping("join/")
	public ModelAndView join(@RequestParam HashMap<String, String> param) {
		ModelAndView mav = new ModelAndView();
		
		int row = ts.insertMember(param);
		mav.setViewName(row == 1 ? "redirect:/" : "msg");
		
		if(row == -1 ) {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다");
		}
		return mav;
	}
	
	
}
