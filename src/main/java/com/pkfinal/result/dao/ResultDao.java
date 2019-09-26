package com.pkfinal.result.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.result.vo.ResultVo;

public interface ResultDao {

	List<ResultVo> getList(HashMap<String, Object> map);

	List<ResultVo> getEng(HashMap<String, Object> map);

	List<ResultVo> getDate(HashMap<String, Object> map);

	List<ResultVo> getCli(HashMap<String, Object> map);

	List<ResultVo> checkArray(HashMap<String, Object> map);

}
