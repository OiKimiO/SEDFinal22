package com.pkfinal.commoncode.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.commoncode.vo.CommoncodeVo;
import com.pkfinal.engineer.vo.EngineerVo;

public interface CommoncodeDao {
	
	public List<CommoncodeVo> getDate(HashMap<String, Object> map);

	public List<EngineerVo> getEngineer(HashMap<String, Object> map);

}
