package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.pos.PosDAO;
import com.itbank.pos.PosDTO;

@Service
public class PosService {

	@Autowired
	private PosDAO posDAO;

	public List<PosDTO> getMenu() {
		return posDAO.selectList();
	}

	public int addMenu(PosDTO dto) {
		return posDAO.insertMenu(dto);
	}

	public int updatePos(PosDTO dto) {
		return posDAO.updatePos(dto);
	}

	
	public PosDTO getOne(int idx) {
		return posDAO.selectOne(idx);
	}


}
