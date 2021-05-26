package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO memberDAO;
	
	@GetMapping("memberList")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView("memberList");
		List<MemberDTO> memberList = memberDAO.selectAll();
		
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	
	// hoem.jsp에서 적은 주소값과 이름이 같아야함
	// 그래야 찾아와서 함수실행시킴
	@GetMapping("memberList2")
	public  ModelAndView memberList2() {
		ModelAndView mav = new ModelAndView("memberList");
		// 모델 앤 뷰에 viewName을 써주면 고정적으로 가는 값
		// setviewName해주면 바꿔줄수있음~
		List<MemberDTO> memberList = memberDAO.selectAll2();
		
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	@GetMapping("insertMember")
	public void insertMember() {}
	
	@PostMapping("insertMember")
	public ModelAndView insertMember(MemberDTO user) {
		ModelAndView mav = new ModelAndView();
		
		int row = memberDAO.insertMember(user);
		
		// row == 1이면 회원목록페이지로, 아니면 다시 회원가입페이지
		mav.setViewName(row == 1 ? "redirect:/memberList2" : "redirect:/insertMember");
		
		
		return mav;
		
	}
	
	
	
	
	
	
}
