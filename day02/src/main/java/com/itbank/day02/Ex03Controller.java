package com.itbank.day02;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Ex03Controller {
	
	@GetMapping("ex03")
	public String ex03() {
		return "ex03"; 
	}
	
	@PostMapping("ex03")
	public ModelAndView ex03(Ex03ParamBeans param) {
		// 파라미터 입력값을 객체 형식으로 입력받을 수 있다
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("ex03Result");
		
		mav.addObject("user", param);
		
		return mav;
	}
}
