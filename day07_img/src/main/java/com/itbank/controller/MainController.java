package com.itbank.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService ms;
	
	@GetMapping("")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index");
		List<String> fileList = ms.getFileList();
		mav.addObject("list", fileList);
		return mav;
	}
	
	@PostMapping("")
	public ModelAndView index(MultipartRequest request) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("redirect:/");
		MultipartFile file = request.getFile("uploadFile");	// 요청에서 파일을 꺼내서
		boolean flag = ms.uploadFile(file);					// 서비스에게 전달하고 결과를 flag에 저장
		
		if(flag == false) {									// 업로드 실패면 msg.jsp로 이동
			mav.setViewName("msg");
			mav.addObject("msg", "이미지 파일이 아닙니다");
		}
		return mav;
	}
}
