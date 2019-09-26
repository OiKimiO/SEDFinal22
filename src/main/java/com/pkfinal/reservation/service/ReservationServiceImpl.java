package com.pkfinal.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.reservation.dao.ReservationDao;
import com.pkfinal.reservation.vo.AppResultVo;
import com.pkfinal.reservation.vo.ReservePaging;
import com.spring.appoint.vo.AppointVo;
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao reservationDao;
	
	// 예약하기
	@Override
	public void write(HashMap<String, Object> map) {
		reservationDao.write(map);

	}
	
	// 예약확인
	@Override
	public List<AppointVo> empMypage(HashMap<String, Object> map) {
		int pagetotalcount = 10; 
		int pagecount      = 5;  // 페이지에서 보여줄 자료수
		map.put("pagecount", pagecount); 
		
		List<AppointVo>list=reservationDao.empMypage(map);
	
		int nowpage    = Integer.valueOf(String.valueOf(map.get("nowpage")));     
		int pagegrpnum = Integer.valueOf(String.valueOf(map.get("pagegrpnum")));  
		int totalcount = Integer.valueOf(String.valueOf(map.get("totalcount")));
		
		ReservePaging bp = new ReservePaging(nowpage, pagecount, totalcount,pagetotalcount, pagegrpnum );
		
		AppointVo     vo = bp.getPdsPagingInfo();
		
		vo.setM_id(String.valueOf(map.get("m_id")));
		
		
		map.put("pagePdsVo", vo);
		
		return list;
	}
	
	//예약완료인 상태에서 ->예약 취소를 누를 경우
		@Override
		public void AppDetailCancel(HashMap<String, Object> map) {
			reservationDao.AppDetailCancel(map);		
		}
		
		
		//예약확인 ->제품명으로 검색했을 떄 화면 
		@Override
		public List<AppointVo> mypagePname(HashMap<String, Object> map) {
			int pagetotalcount = 10; 
			int pagecount      = 5;  
			map.put("pagecount", pagecount); 
			List<AppointVo>list=reservationDao.mypagePname(map);
			int nowpage    = Integer.valueOf(String.valueOf(map.get("nowpage")));     
			int pagegrpnum = Integer.valueOf(String.valueOf(map.get("pagegrpnum")));  
			int totalcount = Integer.valueOf(String.valueOf(map.get("totalcount")));  
			ReservePaging bp = new ReservePaging(nowpage, pagecount, totalcount,pagetotalcount, pagegrpnum );
			AppointVo     vo = bp.getPdsPagingInfo();
			vo.setM_id(String.valueOf(map.get("m_id")));
			map.put("pagePdsVo", vo);		
			return list;
		}
		
		//예약확인->예약 번호로 검색했을 때 화면
		@Override
		public List<AppointVo> mypageRid(HashMap<String, Object> map) {
			int pagetotalcount = 10; 
			int pagecount      = 5;  
			map.put("pagecount", pagecount); 
			List<AppointVo>list=reservationDao.mypageRid(map);
			int nowpage    = Integer.valueOf(String.valueOf(map.get("nowpage")));     
			int pagegrpnum = Integer.valueOf(String.valueOf(map.get("pagegrpnum")));  
			int totalcount = Integer.valueOf(String.valueOf(map.get("totalcount")));  
			ReservePaging bp = new ReservePaging(nowpage, pagecount, totalcount,pagetotalcount, pagegrpnum );
			AppointVo     vo = bp.getPdsPagingInfo();
			vo.setM_id(String.valueOf(map.get("m_id")));
			map.put("pagePdsVo", vo);		
			return list;
		}
		
		
		//예약확인->카테고리로 검색했을 때 화면
			@Override
			public List<AppointVo> mypageCateName(HashMap<String, Object> map) {
				int pagetotalcount = 10; 
				int pagecount      = 5;  
				map.put("pagecount", pagecount); 
				List<AppointVo>list=reservationDao.mypageCateName(map);
				int nowpage    = Integer.valueOf(String.valueOf(map.get("nowpage")));     
				int pagegrpnum = Integer.valueOf(String.valueOf(map.get("pagegrpnum")));  
				int totalcount = Integer.valueOf(String.valueOf(map.get("totalcount")));  
				ReservePaging bp = new ReservePaging(nowpage, pagecount, totalcount,pagetotalcount, pagegrpnum );
				AppointVo     vo = bp.getPdsPagingInfo();
				vo.setM_id(String.valueOf(map.get("m_id")));
				map.put("pagePdsVo", vo);		
				return list;
			}
			
		//예약/결과 정보를 뽑아내기
		@Override
		public List<AppResultVo> empAppResult(HashMap<String, Object> map) {
			List<AppResultVo>list=reservationDao.empAppResultpage(map);	
			System.out.println("List 결과확인"+list);
			return list;
		}

	
	

}
