package com.itbank.phonebook;

import java.util.List;

public interface PhonebookDAO {

	List<PhonebookDTO> selectAll();

	int insertPb(PhonebookDTO dto);


}
