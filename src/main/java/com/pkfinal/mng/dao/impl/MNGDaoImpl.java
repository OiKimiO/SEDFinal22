package com.pkfinal.mng.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.eng.vo.EngVo;
import com.pkfinal.mng.dao.MNGDao;
import com.pkfinal.mng.vo.DateVo;
import com.pkfinal.mng.vo.MNGVo;

@Repository("MNGDao")
public class MNGDaoImpl implements MNGDao {

	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public List<MNGVo> selectManagement(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.selectManagement",map);
		List<MNGVo> selectManagement = (List<MNGVo>) map.get("result");
		System.out.println("selectManagement의 결과값 : "+selectManagement);
		return selectManagement;
	}

	@Override
	public List<MNGVo> detailSelectManagement(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.detailSelectManagement",map);
		List<MNGVo> detailSelectManagement = (List<MNGVo>) map.get("result");
		System.out.println("detailSelectManagement daoimpl : " + detailSelectManagement);
		return detailSelectManagement;
	}

	@Override
	public List<MNGVo> selectManagementId(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.selectManagementId",map);
		List<MNGVo> selectManagementId = (List<MNGVo>) map.get("result");
		System.out.println("selectManagement의 결과값 : "+selectManagementId);
		return selectManagementId;
	}

	@Override
	public void cancelManagement(HashMap<String, Object> map) {
		sqlSession.insert("MNG.cancelManagement",map);
	}

	@Override
	public List<MNGVo> RidSelect(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.RidSelect",map);
		List<MNGVo> RidSelect = (List<MNGVo>) map.get("result");
		System.out.println("RidSelect daoimpl : " + RidSelect);
		return RidSelect;			
	}

	@Override
	public List<DateVo> MonthFind(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.MonthFind",map);
		List<DateVo> MonthFind = (List<DateVo>) map.get("result");
		System.out.println("MonthFind daoimpl : " + MonthFind);
		return MonthFind;	
	}

	@Override
	public List<DateVo> DayFind(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.DayFind",map);
		List<DateVo> DayFind = (List<DateVo>) map.get("result");
		System.out.println("DayFind daoimpl : " + DayFind);
		return DayFind;
	}

	@Override
	public List<DateVo> ProcessedDayFind(HashMap<String, Object> mapper) {
		System.out.println("daoImpl mapper : "+ mapper);
		sqlSession.selectList("MNG.ProcessedDayFind",mapper);
		List<DateVo> ProcessedDayFind = (List<DateVo>) mapper.get("result");
		return ProcessedDayFind;
	}

	@Override
	public List<MNGVo> EnginSearch(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.EnginSearch",map);
		List<MNGVo> EnginSearch = (List<MNGVo>) map.get("result");
		return EnginSearch;
	}

	@Override
	public void insertManagement(HashMap<String, Object> map) {
		System.out.println("insertManage : " + map);
		sqlSession.insert("MNG.insertManagement",map);	
	} 
	
	@Override
	public void updateManagement(HashMap<String, Object> map) {
		System.out.println("업데이트성공");
		sqlSession.update("MNG.updateManagement",map);	
	}

	@Override
	public List<MNGVo> MaxRSid(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.MaxRSid",map);
		List<MNGVo> MaxRSid = (List<MNGVo>) map.get("result");
		return MaxRSid;
	}

	@Override
	public List<MNGVo> checkMng(HashMap<String, Object> map) {
		sqlSession.selectList("MNG.checkMng",map);
		List<MNGVo> checkMng = (List<MNGVo>) map.get("result");
		return checkMng;
	} 
 
}
