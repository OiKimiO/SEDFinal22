package com.pkfinal.service;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.vo.pkVo;

public interface pkService {

	void insertMenuButton(HashMap<String, Object> map);

	List<pkVo> selectMenuButton(HashMap<String, Object> map);

	void deleteMenuButton(HashMap<String, Object> map);

	void updateMenuButton(HashMap<String, Object> map);


}
