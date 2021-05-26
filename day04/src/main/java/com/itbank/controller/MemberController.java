package com.itbank.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입
	@GetMapping("insertMember/")
	public void insertMember() {}

	@PostMapping("insertMember/") // 요청을 받아서 
	public ModelAndView insertMember(@RequestParam HashMap<String, String> param) {
		ModelAndView mav = new ModelAndView();
		
		int row = memberService.insertMember(param);
		
		// 회원가입 성공하면 최상위 , 아니면 msg.jsp로 이동
		mav.setViewName(row == 1 ? "redirect:/" : "msg");
		
		// row == -1 이면 msg담음
		if(row == -1){
			mav.addObject("msg","비밀번호가 일치하지 않습니다.");
		}
		
		return mav;		// 응답을 반환한다
		// addObject으로 view에 미리 값이 넘어가있음
		// mav를 서블릿에 넘겨줌  
		// 뷰에 가보니까 addOject로 넘겨준 값이 있음
	 }

	// 로그인
	@GetMapping("login/")
	public void loginMember() {}
	
	@PostMapping("login/")
	public String loginMember(MemberDTO dto, HttpSession session) {
		// ModelAndView의 mav.addObject(name,value)는 request.setattribute()와 같은데
		// 로그인 처리는 세션으로 할꺼라서, mav를 사용하지 않았다
		
		MemberDTO login = memberService.getMember(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	
	// 로그아웃
	@RequestMapping("logout/")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	// 로그인 한 계정 클릭 시, 해당 회원 정보 보여주기
	@GetMapping("infoMember/")
	public void infoMember() {}
	
	
	// 회원 정보 수정
	@GetMapping("modifyMember/")
	public void modifyMember() {}
	
	@PostMapping("modifyMember/")
	public ModelAndView modifyMember(@RequestParam HashMap<String, String> param, HttpSession session) {
		ModelAndView mav = new ModelAndView("msg");
		
		int row = memberService.updateMember(param);
		switch (row) {
		case 1:
			mav.addObject("msg", "정보수정이 완료되었습니다.");
			mav.addObject("page", "/infoMember/");
			session.setAttribute("login", 
					memberService.getMember(param.get("userid"),param.get("userpw3")));
			// userpw2를 해시처리했기때문에 userpw3을 넘겨준다
			break;
		case -1 :
			mav.addObject("msg", "신규 비밀번호가 일치하지 않습니따");
			break;
		case 0 :
			mav.addObject("msg", "수정 실패, 입력한 정보를 다시 확인해주세요");
			break;
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	

	// 컨트롤러 레벨에서 발생하는 예외를 종류별로 모아서 별도의 메서드로 처리하는 형태
	@ExceptionHandler(EmptyResultDataAccessException.class)
	public ModelAndView loginFail(EmptyResultDataAccessException e) {
		ModelAndView mav = new ModelAndView("msg");	// 예외가 발생하면 msg.jsp로 이동
		System.out.println(e);
		mav.addObject("msg", "일치하는 계정 혹은 패스워드를 찾을 수 없습니다");
		mav.addObject("page", "/login/");	// 로그인.jsp로 이동
		return mav;
	}
	
	
	
}
