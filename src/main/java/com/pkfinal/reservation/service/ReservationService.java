package com.pkfinal.reservation.service;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.reservation.vo.AppResultVo;
import com.spring.appoint.vo.AppointVo;

public interface ReservationService {
	// 예약 하기
	public void write(HashMap<String, Object> map);
	
	// 예약 확인
	public List<AppointVo> empMypage(HashMap<String, Object> map);
	
	//예약완료인 상태에서 ->예약 취소를 누를 경우
	public void AppDetailCancel(HashMap<String, Object> map);
	
	//예약확인 ->제품명으로 검색했을 떄 화면 
	public List<AppointVo> mypagePname(HashMap<String, Object> map);
			
	//예약확인->예약번호로 입력했을 때 화면
	public List<AppointVo> mypageRid(HashMap<String, Object> map);

	//예약확인->카테고리 이름으로 입력했을 때 화면 
	public List<AppointVo> mypageCateName(HashMap<String, Object> map);
	
	public List<AppResultVo> empAppResult(HashMap<String, Object> map);
	
	/*
	 * // 예약 취소 public AppResultVo getCancel(HashMap<String, Object> map);
	 */
}
