package com.itbank.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;
import com.itbank.board.Paging;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;

	// 게시글 전체 목록보기
	public HashMap<String, Object> getBoard(int page, String type, String word) {

		type = "".equals(type) ? null : type;
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		// (검색결과에 따른) 게시글 총 개수 구하기
		map.put("type", type);
		map.put("word", word);

		int boardCount = dao.boardCount(map);

		Paging paging = new Paging(page, boardCount);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		map.put("paging", paging);

		// 게시판 목록은 list로 받기
		List<BoardDTO> list = dao.selectList(map);
		map.put("list", list);

		return map;
	}

	// 새 글 작성
	public int insertBoard(BoardDTO dto) {
		int row = dao.insertBoard(dto); 
		int idx = row == 1 ? dao.selectMaxIdx() : 0 ;
		return idx;
	}

	
	// 선택한 게시글 보기
	public BoardDTO selectOne(int idx) {
		dao.viewPlus(idx);	// 조회수 증가
		return dao.selectOne(idx);
	}

	// 선택한 게시글 삭제
	public int deleteBoard(int idx) {
		return dao.deleteOne(idx);
	}

	// 선택한 게시글 수정
	public int updateBoard(BoardDTO board) {
		return dao.updateOne(board);
	}

	
	
	

}
