package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.pos.PosDTO;
import com.itbank.sell.sellDAO;
import com.itbank.sell.sellDTO;

@Service
public class sellService {

	@Autowired
	private sellDAO dao;

	// 판매된 리스트 보여주기
	public List<sellDTO> getBasket() {
		return dao.selectBasket();
	}

	public int insertSell(sellDTO dto) {

		
		return dao.insertBasket(dto);
	}

}