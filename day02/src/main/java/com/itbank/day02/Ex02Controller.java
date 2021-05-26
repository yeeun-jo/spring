package com.itbank.day02;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Ex02Controller {
	
//	@RequestMapping(value="ex02",method=RequestMethod.GET )
	@GetMapping("ex02")
	public String ex02() {
		return "ex02"; 
	}
	
//	@RequestMapping(value="ex02", method = RequestMethod.POST)
	@PostMapping("ex02")
	public ModelAndView ex02(String name,int age) {

		// 1) 기본자료형의 파라미터는 어노테이션을 붙이지 않아도 받을 수 있다
		// 2) request나 model 객체는 똑같이 Attribute 를 전달하는 역할이다
		// 3) 컨트롤러의 메서드는 viewName을 반환해야한다
		// 4) 2번과 3번은 항상 작동하는 코드이므로, 하나로 합치면 더 수월하게 진행할 수 있다(파라미터 하나 덜받아도 됨)
		
		// model의 역할과 viewName반환을 동시에 처리하는 객체
		ModelAndView mav = new ModelAndView();
		
		// 기존의 String으로 반환하던 viewName을 그대로 넣어주기
		mav.setViewName("ex02Result");
		
		// 똑같이 attribute를 view에 전달하는 기능
		mav.addObject("name", name);
		mav.addObject("age", age);
			
		return mav;
	}
}
