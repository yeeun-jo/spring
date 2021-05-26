package com.itbank.phoneBook;

public interface PnumDAO {

	int insertPnum(PnumDTO dto);

	PnumDTO selectOne(String name);

}
