package com.itbank.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
import com.itbank.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bs;

	@GetMapping("board/{page}")
	public ModelAndView board(@PathVariable int page, String type, String word) {
		ModelAndView mav = new ModelAndView("board");
		HashMap<String, Object> map = bs.getBoardList(page, type, word);
		mav.addObject("map", map);
		return mav;
	}
	
	@GetMapping("view/{idx}")
	public ModelAndView view(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("view");
		BoardDTO dto = bs.getBoard(idx);
		mav.addObject("dto", dto);	// view에 객체를 넘겨서 출력할 수 있도록 하는 것 (forward)
		return mav;
	}
	
	@GetMapping("write")
	public String write(HttpSession session ) {
		return session.getAttribute("login") == null ? "redirect:/login" : "write";
	}
	
	@PostMapping("write")
	public String write(BoardDTO user) {
		int idx = bs.writeBoard(user);
		return idx != 0 ? "redirect:view/" + idx : "";
	}
	
	
}









