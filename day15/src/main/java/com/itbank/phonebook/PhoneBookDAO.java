package com.itbank.phonebook;

import java.util.List;

public interface PhoneBookDAO {

	List<PhoneBookDTO> selectList();

	int insertPB(PhoneBookDTO dto);

	int deletePB(int idx);

	int updatePB(PhoneBookDTO dto);

	List<PhoneBookDTO> searchList(String word);


}
