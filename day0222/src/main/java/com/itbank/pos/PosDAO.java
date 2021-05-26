package com.itbank.pos;

import java.util.List;

public interface PosDAO {

	List<PosDTO> selectList();

	int insertMenu(PosDTO dto);

	int updatePos(PosDTO dto);

	PosDTO selectOne(int idx);


}
