package com.pkfinal.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.reservation.vo.AppResultVo;
import com.spring.appoint.vo.AppointVo;
@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 예약하기
	@Override
	public void write(HashMap<String, Object> map) {
		sqlSession.insert("Reservation.RWrite", map);
		sqlSession.insert("Reservation.RWriteResult", map);
	}
	
	// 예약확인
	@Override
	public List<AppointVo> empMypage(HashMap<String, Object> map) {
		System.out.println("daoimpl 페이징 확인 : " + map);
		sqlSession.selectList("AppointMent.AppointList", map);
		List<AppointVo>list=(List<AppointVo>) map.get("result");
		return list; 
	}
		
	@Override 
	public List<AppResultVo> empAppResultpage(HashMap<String, Object>	map) {
		sqlSession.selectList("AppointMent.appresult",map);
		System.out.println("제발확인하기"+map);
		List<AppResultVo>list=(List<AppResultVo>) map.get("result");
		
		return list; 
	}


	@Override
	public void AppDetailCancel(HashMap<String, Object> map) {
		sqlSession.insert("AppointMent.AppDetailCancel",map);
		
	}

	//예약확인 ->제품명으로 검색했을 떄 화면 
	@Override
	public List<AppointVo> mypagePname(HashMap<String, Object> map) {
		System.out.println(map);
		sqlSession.selectList("AppointMent.mypagePname", map);
		List<AppointVo>list=(List<AppointVo>) map.get("result");
		
		return list;
	}

	//예약확인->예약 번호로 검색했을 떄 화면
	@Override
	public List<AppointVo> mypageRid(HashMap<String, Object> map) {
		sqlSession.selectList("AppointMent.mypageRid", map);
		List<AppointVo>list=(List<AppointVo>) map.get("result");
		return list;
	}

	//예약확인->카테고리로 검색했을 때 화면 
	@Override
	public List<AppointVo> mypageCateName(HashMap<String, Object> map) {
		sqlSession.selectList("AppointMent.mypageCateName", map);
		List<AppointVo>list=(List<AppointVo>) map.get("result");
		return list;
	} 


}
