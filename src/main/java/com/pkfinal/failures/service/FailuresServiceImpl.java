package com.pkfinal.failures.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.failures.dao.FailuresDao;
import com.pkfinal.failures.vo.FailuresVo;
@Service
public class FailuresServiceImpl implements FailuresService {
	
	@Autowired
	private FailuresDao failuresDao;


	@Override
	public List<FailuresVo> getfLList(HashMap<String, Object> map) {
		List<FailuresVo> failLList = failuresDao.getfLList(map);
		return failLList;
	}


	@Override
	public List<FailuresVo> getfSList(HashMap<String, Object> map) {
		List<FailuresVo> failSList = failuresDao.getfSList(map);
		return failSList;
	}
	
	

}
