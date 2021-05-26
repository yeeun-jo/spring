package com.itbank.board;

import java.util.HashMap;
import java.util.List;

public interface BoardDAO {

	List<BoardDTO> selectList(HashMap<String, Object> map);

	int boardCount(HashMap<String, Object> map);

	int insertBoard(BoardDTO dto);

	BoardDTO selectOne(int idx);

	int deleteOne(int idx);

	int updateOne(BoardDTO board);

	int selectMaxIdx();

	int viewPlus(int idx);
}
