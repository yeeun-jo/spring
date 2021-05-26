package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BoardDAO;
import com.itbank.model.BoardDTO;
import com.itbank.model.Paging;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	// 게시글 전체 목록
	public HashMap<String, Object> selectBoard(int page, String type, String word) {
		// type이 빈 문자열이면 null값으로 저장하기
		type = "".equals(type) ? null : type;
		
		// 총 게시글 개수 구해서 int에 저장하기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("word", word);
		
		int boardCount = boardDAO.selectCount(map);
		
		// 요청받은 페이지와 총 게시글 수를 이용하여 페이징 객체생성
		Paging paging = new Paging(page, boardCount);
		
		// 페이징클래스에서 만든 first,last를 가져와서 map에 담기
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		map.put("paging", paging);
		
		// 페이징된 게시글 내용은 page,type,word,first,last를 HashMap으로 묶어서 DAO에게 요청한다
		List<BoardDTO> list = boardDAO.selectList(map);
		map.put("list", list);
		
		return map;
	}

	// 선택한 게시글 보기
	public BoardDTO selectOne(BoardDTO board) {
		return boardDAO.selectOne(board);
	}



}
