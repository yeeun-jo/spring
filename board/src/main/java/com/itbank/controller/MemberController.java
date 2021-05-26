package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@RequestMapping("")
	public String index() { return "index";}
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		MemberDTO login = ms.getMember(dto);
		session.setAttribute("login", login);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(login != null ? "redirect:/" : "msg");
		if(login == null) {
			mav.addObject("msg", "일치하는 정보가 없습니다");
		}
		return mav;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	@GetMapping("join")
	public void join() {}
	
	@PostMapping(value="checkId", produces = "application/text;charset=utf8")
	@ResponseBody
	public String checkId(String userid) {
		boolean alreadyExist = ms.checkId(userid);
		return alreadyExist ? "이미 사용중인 ID입니다" : "사용가능한 ID입니다";
	}
	
	@PostMapping("join")
	public String join(MemberDTO user) {
		int row = ms.joinMember(user);
		return (row == 1 ? "redirect:/" : "redirect:/join");
	}
}
