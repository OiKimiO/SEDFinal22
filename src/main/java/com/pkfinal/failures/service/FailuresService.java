package com.pkfinal.failures.service;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.failures.vo.FailuresVo;

public interface FailuresService {


	public List<FailuresVo> getfLList(HashMap<String, Object> map);

	public List<FailuresVo> getfSList(HashMap<String, Object> map);
	


}
