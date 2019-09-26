package com.pkfinal.commoncode.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.commoncode.vo.CommoncodeVo;
import com.pkfinal.engineer.vo.EngineerVo;
@Repository
public class CommoncodeDaoImpl implements CommoncodeDao {
	
	@Autowired
	private SqlSession	sqlSession;
	
	@Override
	public List<CommoncodeVo> getDate(HashMap<String, Object> map) {
		List<CommoncodeVo> dateList = sqlSession.selectList("ReservationAjax.CommonCodeChoice", map);
		map.put("dateList", dateList);
		return dateList;
	}

	@Override
	public List<EngineerVo> getEngineer(HashMap<String, Object> map) {
		List<EngineerVo> eList = sqlSession.selectList("ReservationAjax.EngineerChoice", map);
		map.put("eList", eList);
		return eList;
	}

}
