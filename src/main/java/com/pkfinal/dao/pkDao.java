package com.pkfinal.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.vo.pkVo;

public interface pkDao {

	void insertMenuButton(HashMap<String, Object> map);

	List<pkVo> selectMenuButton(HashMap<String, Object> map);

	void deleteMenuButton(HashMap<String, Object> map);

	void updateMenuButton(HashMap<String, Object> map);


}
