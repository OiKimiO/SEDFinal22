package com.pkfinal.eng.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pkfinal.eng.vo.EngVo;


public interface EngService {

	void insertEngineer(HashMap<String, Object> map, HttpServletRequest request);

	List<EngVo> selectEngineer(HashMap<String, Object> map);

	void UpdateEngineer(HashMap<String, Object> map, HttpServletRequest request);

	void deleteEngineer(HashMap<String, Object> map);

	List<EngVo> detailselectEngineer(HashMap<String, Object> map);

	List<EngVo> idSelectEngineer(HashMap<String, Object> map);

	List<EngVo> selectCenter();

	List<EngVo> selectCate();


	
}
