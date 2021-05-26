package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.pos.PosDTO;
import com.itbank.service.PosService;

@Controller
public class PosController {

	@Autowired
	private PosService ps;
	
	// 새상품등록
	@GetMapping("add")
	public void add() {
	}

	@PostMapping("add")
	public String add(PosDTO dto) {
		int row = ps.addMenu(dto);
		return "redirect:/";
	}
	
	// 상품입고
	@GetMapping("update/{idx}")
	public ModelAndView update(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("update");
		PosDTO dto =ps.getOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("update/{idx}")
	public String update(@PathVariable int idx, PosDTO dto) {
		int row = ps.updatePos(dto);
		return "redirect:/";
	}
	
		
	
}
