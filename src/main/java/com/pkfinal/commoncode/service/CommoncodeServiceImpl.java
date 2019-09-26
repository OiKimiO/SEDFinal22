package com.pkfinal.commoncode.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.commoncode.dao.CommoncodeDao;
import com.pkfinal.commoncode.vo.CommoncodeVo;
import com.pkfinal.engineer.vo.EngineerVo;
@Service
public class CommoncodeServiceImpl implements CommoncodeService {
	
	@Autowired
	private CommoncodeDao commoncodeDao;
	
	@Override
	public List<CommoncodeVo> getDate(HashMap<String, Object> map) {
		List<CommoncodeVo> dateList = commoncodeDao.getDate(map);
		return dateList;
	}

	@Override
	public List<EngineerVo> getEngineer(HashMap<String, Object> map) {
		List<EngineerVo> eList = commoncodeDao.getEngineer(map);
		return eList;
	}

}
