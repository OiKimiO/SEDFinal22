package com.pkfinal.result.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.result.dao.ResultDao;
import com.pkfinal.result.vo.ResultVo;

@Service("resultDao")
public class ResultDaoImpl implements ResultDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ResultVo> getList(HashMap<String, Object> map) {
		sqlSession.selectList("Result.ResultList", map);
		
		List<ResultVo> resultList = (List<ResultVo>) map.get("result");
		System.out.println("여기는 다오오 : " + resultList);
		return resultList;
	}

	@Override
	public List<ResultVo> getEng(HashMap<String, Object> map) {
		sqlSession.selectList("Result.ResultEng", map);
		
		List<ResultVo> resultList = (List<ResultVo>) map.get("result");
		return resultList;
	}

	@Override
	public List<ResultVo> getDate(HashMap<String, Object> map) {
		sqlSession.selectList("Result.ResultDate", map);
		
		List<ResultVo> resultList = (List<ResultVo>) map.get("result");
		return resultList;
	}

	@Override
	public List<ResultVo> getCli(HashMap<String, Object> map) {
		sqlSession.selectList("Result.ResultCli", map);
		
		List<ResultVo> resultList = (List<ResultVo>) map.get("result");
		return resultList;
	}

	@Override
	public List<ResultVo> checkArray(HashMap<String, Object> map) {
		sqlSession.selectList("Result.checkArray", map);
		List<ResultVo> checkArray = (List<ResultVo>) map.get("result");
		return checkArray;
	}

}
