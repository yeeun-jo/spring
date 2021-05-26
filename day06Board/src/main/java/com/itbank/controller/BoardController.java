package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BoardDTO;
import com.itbank.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;
	
	// 게시글 전체보기(페이징처리 해주기)
	@GetMapping("board/{page}")
	public ModelAndView selectBoard(@PathVariable int page, String type, String word) {
		ModelAndView mav = new ModelAndView("board");
		HashMap<String, Object> map = bs.selectBoard(page, type, word);

		mav.addObject("map", map);
		return mav;
	}
	
	// 선택한 글 보기
	@GetMapping("view")
	public ModelAndView selectOne(BoardDTO board) {
		ModelAndView mav = new ModelAndView("view");
		
		BoardDTO dto = bs.selectOne(board);
		mav.addObject("dto", dto);
		return mav;
		
		
	}
	
	
}
