package com.itbank.day02;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller		// 스프링 빈으로 등록하고, MVC에서 Controller를 담당하는 객체이다
public class MyController {

	// 1) 컨트롤러의 메서드는 매개변수로  request를 받을 수 있다
	
	// 2) 요청 주소(value), 요청 방식(method - get, post)
	// 요청방식을 지정하지 않으면  get,post 둘다작용함
//	@RequestMapping("/")
//	@RequestMapping(value="/", method=RequestMethod.GET)
	@GetMapping("/")	
	public String myHome(HttpServletRequest request) {
		String name = "조예은";
		int age = 29;
		
		// forward하면 request가 유지된다
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		
		return "home";
	}
	
	
}
