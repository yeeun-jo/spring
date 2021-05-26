package com.itbank.sell;

import java.util.List;

public interface sellDAO {

	List<sellDTO> selectBasket();

	int insertBasket(sellDTO dto);


}
