package com.pkfinal.eng.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.eng.dao.EngDao;
import com.pkfinal.eng.vo.EngVo;

@Repository("EngDao")
public class EngDaoImpl implements EngDao {
	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public void insertEngineer(HashMap<String, Object> map) {
		sqlSession.insert("Eng.insertEngineer",map);
		
	}

	@Override
	public List<EngVo> selectEngineer(HashMap<String, Object> map) {
		sqlSession.selectList("Eng.selectEngineer",map);
		List<EngVo> selectEngineer = (List<EngVo>) map.get("result");
		System.out.println("selectEngineer의 결과값 : "+selectEngineer);
		
		return selectEngineer;
	}

	@Override
	public void UpdateEngineer(HashMap<String, Object> map) {
		sqlSession.update("Eng.UpdateEngineer",map);
		
	}

	@Override
	public void deleteEngineer(HashMap<String, Object> map) {
		sqlSession.delete("Eng.deleteEngineer",map);
		
	}

	@Override
	public List<EngVo> detailselectEngineer(HashMap<String, Object> map) {
		sqlSession.selectList("Eng.detailSelectEngineer",map);
		List<EngVo> detailSelectEngineer = (List<EngVo>) map.get("result");
		return detailSelectEngineer;
	}

	@Override
	public List<EngVo> idSelectEngineer(HashMap<String, Object> map) {
		sqlSession.selectList("Eng.idSelectEngineer",map);
		List<EngVo> idSelectEngineer = (List<EngVo>) map.get("result");
		return idSelectEngineer;
	}

	@Override
	public List<EngVo> selectCenter() {
		HashMap<String,Object> map = new HashMap();
		sqlSession.selectList("Eng.selectCenter",map);
		List<EngVo> selectCenter = (List<EngVo>) map.get("result");
		return selectCenter;
	}
	
	@Override
	public List<EngVo> selectCate() {
		HashMap<String,Object> map = new HashMap();
		sqlSession.selectList("Eng.selectCate",map);
		List<EngVo> selectCate = (List<EngVo>) map.get("result");
		return selectCate;
	}
	
}
