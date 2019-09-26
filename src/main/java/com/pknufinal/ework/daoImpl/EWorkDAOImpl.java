package com.pknufinal.ework.daoImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknufinal.ework.dao.EWorkDAO;
import com.pknufinal.ework.vo.EDoingASVO;
import com.pknufinal.ework.vo.EScheduleContVO;
import com.pknufinal.ework.vo.EScheduleVO;
import com.pknufinal.ework.vo.EWorkVO;
import com.pknufinal.ework.vo.ProductFreeVO;

@Repository("EWorkDAO")
public class EWorkDAOImpl implements EWorkDAO {

	@Autowired
	SqlSession sqlsession;

	@Override
	public List<EScheduleVO> getEScheduleList(HashMap<String, Object> map) {
		sqlsession.selectList("EWork.eScheduleList", map);
		List<EScheduleVO> eScheduleList = (List<EScheduleVO>) map.get("result");
		//System.out.println(eScheduleList);
		return eScheduleList;
	}

	@Override
	public List<EScheduleVO> changeEScheduleList(HashMap<String, Object> map) {
		sqlsession.selectList("EWork.eScheduleList", map);
		List<EScheduleVO> eScheduleList = (List<EScheduleVO>) map.get("result");
		//System.out.println(eScheduleList);
		return eScheduleList;
	}

	@Override 
	public List<EScheduleContVO> eScheduleView(HashMap<String, Object> map) {
		sqlsession.selectList("EWork.eScheduleCont", map);
		List<EScheduleContVO> result = (List<EScheduleContVO>) map.get("result");
		//System.out.println("result : " + result);
		return result; 
	}

	@Override
	public List<EDoingASVO> doingAS(HashMap<String, Object> map) {
		//System.out.println("여기 map : " + map);
		sqlsession.selectList("EWork.doingAS",map);
		List<EDoingASVO> result = (List<EDoingASVO>) map.get("result");
		//System.out.println(result);
		return result;
	}

	@Override
	public List<ProductFreeVO> freeOrNotCheck(HashMap<String, Object> map) {
		sqlsession.selectList("EWork.freeOrNot",map);
		List<ProductFreeVO> result = (List<ProductFreeVO>) map.get("result");
		//System.out.println("here : " + result);
		return result;
	}

	@Override
	public List<ProductFreeVO> getPartsList(HashMap<String, Object> map) {
		sqlsession.selectList("EWork.getPartsList", map);
		List<ProductFreeVO> result = (List<ProductFreeVO>) map.get("result");
		//System.out.println("요기 : " + map);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public void finishService(HashMap<String, Object> map) {
		System.out.println("여기 : " + map);
		sqlsession.insert("EWork.finishService", map);		
	}

	@Override
	public List<EWorkVO> SearchFreeOrNot(HashMap<String, Object> map) {
		sqlsession.selectList("EWork.SearchFreeOrNot", map);
		List<EWorkVO> result = (List<EWorkVO>) map.get("result");
		//System.out.println("요기 : " + map);
		// TODO Auto-generated method stub
		return result;
	}


}
