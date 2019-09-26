package com.pkfinal.reservation.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.reservation.vo.AppResultVo;
import com.spring.appoint.vo.AppointVo;

public interface ReservationDao {

	public void write(HashMap<String, Object> map);

	public List<AppointVo> empMypage(HashMap<String, Object> map);
	
	public List<AppResultVo> empAppResultpage(HashMap<String, Object> map);
	//예약완료인 상태에서 ->예약 취소를 누를 경우  
	public void AppDetailCancel(HashMap<String, Object> map);
	//예약확인 ->제품명으로 검색했을 떄 화면 
	public List<AppointVo> mypagePname(HashMap<String, Object> map);	
	//예약확인->예약 번호로 검색했을 떄 화면
	public List<AppointVo> mypageRid(HashMap<String, Object> map);
	//예약확인->카테고리로 검색했을 때 화면
	public List<AppointVo> mypageCateName(HashMap<String, Object> map);
}
