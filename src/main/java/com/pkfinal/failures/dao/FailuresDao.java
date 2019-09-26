package com.pkfinal.failures.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.failures.vo.FailuresVo;

public interface FailuresDao {


	public List<FailuresVo> getfLList(HashMap<String, Object> map);

	public List<FailuresVo> getfSList(HashMap<String, Object> map);

	

	

}
