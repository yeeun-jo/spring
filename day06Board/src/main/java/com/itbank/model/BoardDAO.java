package com.itbank.model;

import java.util.HashMap;
import java.util.List;

public interface BoardDAO {

	BoardDTO selectOne(BoardDTO dto);

	int selectCount(HashMap<String, Object> map);

	List<BoardDTO> selectList(HashMap<String, Object> map);



}
