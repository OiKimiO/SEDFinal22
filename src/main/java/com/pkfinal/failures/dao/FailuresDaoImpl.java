package com.pkfinal.failures.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.failures.vo.FailuresVo;
@Repository
public class FailuresDaoImpl implements FailuresDao {
	@Autowired
	private SqlSession sqlSession;



	@Override
	public List<FailuresVo> getfLList(HashMap<String, Object> map) {
		
		List<FailuresVo> failLList = sqlSession.selectList("Failures.LFailuresChoice", map);
		map.put("failLList", failLList);
		System.out.println("2:" + failLList);
		
		return failLList;
	}



	@Override
	public List<FailuresVo> getfSList(HashMap<String, Object> map) {
		List<FailuresVo> failSList = sqlSession.selectList("Failures.SFailuresChoice", map);
		map.put("failSList", failSList);
		System.out.println("3:" + failSList);
		return failSList;
	}
	
	

}
