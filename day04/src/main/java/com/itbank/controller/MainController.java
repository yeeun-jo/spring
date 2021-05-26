package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("")	// 이 주소를 요청받으면
	public String index() {return "index";} // 이 주소를 띄울것이다
	
}
