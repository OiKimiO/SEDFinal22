package com.pkfinal.eng.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pkfinal.eng.vo.EngVo;

public interface EngDao {

	void insertEngineer(HashMap<String, Object> map);

	List<EngVo> selectEngineer(HashMap<String, Object> map);

	void UpdateEngineer(HashMap<String, Object> map);

	void deleteEngineer(HashMap<String, Object> map);

	List<EngVo> detailselectEngineer(HashMap<String, Object> map);

	List<EngVo> idSelectEngineer(HashMap<String, Object> map);

	List<EngVo> selectCenter();
	
	List<EngVo> selectCate();

}
