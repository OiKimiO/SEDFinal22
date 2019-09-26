package com.pkfinal.result.service;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.result.vo.ResultVo;

public interface ResultService {

	List<ResultVo> getList(HashMap<String, Object> map);

	List<ResultVo> geteng(HashMap<String, Object> map);

	List<ResultVo> getdate(HashMap<String, Object> map);

	List<ResultVo> getcli(HashMap<String, Object> map);

	List<ResultVo> checkArray(HashMap<String, Object> map);

}
