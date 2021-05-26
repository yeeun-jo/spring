package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
import com.itbank.service.BoardService;
import com.itbank.service.FileService;

@Controller
public class BoardController {
	
	@Autowired private BoardService bs;
	@Autowired private FileService fs;
	
	// 전체 게시글 목록 보기
	@GetMapping("board/{page}")
	public ModelAndView board(@PathVariable int page, String type, String word) {
		ModelAndView mav = new ModelAndView("board");
		HashMap<String, Object> map = bs.getBoard(page, type, word);
		mav.addObject("map", map);
		return mav;
	}
	
	// 선택한 게시글 보기
	@GetMapping("view/{idx}")
	public ModelAndView view(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("view");
		
		BoardDTO dto = bs.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	// 새글 작성
	@GetMapping("write")
	public void write(){}
	
	@PostMapping("write")
	public String write(BoardDTO dto) {
		int idx = bs.insertBoard(dto);
		return "redirect:/view/" + idx;
	}
	
	// 선택한 게시글 삭제
	@GetMapping("view/delete/{idx}")
	public String delete(@PathVariable int idx) {
		int row = bs.deleteBoard(idx);
		return "redirect:/board/1" ;
	}

	// 선택한 게시글 수정
	@GetMapping("update/{idx}")
	public ModelAndView update(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("update");
		BoardDTO dto = bs.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("update/{idx}")
	public String update(@PathVariable int idx, BoardDTO board) {
		System.out.println(idx);
		int row = bs.updateBoard(board);
		return "redirect:/view/" + idx;
	}









}
