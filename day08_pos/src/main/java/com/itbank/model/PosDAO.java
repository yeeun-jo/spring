package com.itbank.model;

import java.util.List;

public interface PosDAO {

	List<PosDTO> selectMenu();

	int insertMenu(PosDTO dto);

}
