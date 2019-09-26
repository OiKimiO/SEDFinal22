package com.pknufinal.ework.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknufinal.ework.dao.EWorkDAO;
import com.pknufinal.ework.service.EWorkService;
import com.pknufinal.ework.vo.EDoingASVO;
import com.pknufinal.ework.vo.EScheduleContVO;
import com.pknufinal.ework.vo.EScheduleVO;
import com.pknufinal.ework.vo.EWorkVO;
import com.pknufinal.ework.vo.ProductFreeVO;

@Service("EWorkService")
public class EWorkServiceImpl implements EWorkService {

	@Autowired
	EWorkDAO eworkdao;
	
	@Override
	public String[] getDateList() {
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyyMMdd");
		Date[] arrayDates = new Date[7];
		arrayDates[0] = new Date ( );
		String[] arrayString = new String[7];
		arrayString[0] = sdf.format(arrayDates[0]);
		for(int i = 1; i<=6; i++) {
			arrayDates[i] = new Date ( arrayDates[0].getTime ( ) + (long) ( (i * 1000) * 60 * 60 * 24 ) );//다음날부터 계산
			arrayString[i] = sdf.format(arrayDates[i]); //20190000형식으로 바꿈
			
			//System.out.println(arrayDates[i]); // getDay 노필요 - 자바스크립트에서 일요일 빨간색 표시
			//System.out.println(arrayString[i]);
		}
		//여기까지 하면 20190819~7일간의 날짜를 배열로 만들 수 있음 - 그 배열이 arrayString
		return arrayString;
	}

	@Override
	public List<EScheduleVO> getEScheduleList(HashMap<String, Object> map) {
		List<EScheduleVO> eScheduleList = eworkdao.getEScheduleList(map);
		for(int i = 0; i < eScheduleList.size(); i++ ) {
			if (eScheduleList.get(i).getP_name() == null) {
				eScheduleList.get(i).setP_name("미기재");
			}
		}
		return eScheduleList;
	}

	@Override
	public List<EScheduleVO> changeEScheduleList(HashMap<String, Object> map) {
		List<EScheduleVO> changedEScheduleList = eworkdao.changeEScheduleList(map);
		for(int i = 0; i < changedEScheduleList.size(); i++ ) {
			if (changedEScheduleList.get(i).getP_name() == null) {
				changedEScheduleList.get(i).setP_name("미기재");
			}
		}
		return changedEScheduleList;
	}

	@Override
	public EScheduleContVO eScheduleView(HashMap<String, Object> map) {
		List<EScheduleContVO> result = eworkdao.eScheduleView(map);  
		EScheduleContVO eScheduleCont    = result.get(0);
		eScheduleCont.setR_date(eScheduleCont.getR_date().substring(0, 4) + "년 " + eScheduleCont.getR_date().substring(4, 6) + "월 " + eScheduleCont.getR_date().substring(6, 8) + "일 " + eScheduleCont.getR_date().substring(8, 10) + "시" + eScheduleCont.getR_date().substring(10, 12) + "분 "  );
		eScheduleCont.setF_date(eScheduleCont.getF_date().substring(0, 4) + "년 " + eScheduleCont.getF_date().substring(4, 6) + "월 " + eScheduleCont.getF_date().substring(6, 8) + "일 ");
		eScheduleCont.setF_time(eScheduleCont.getF_time().substring(0, 2) + "시");
		//System.out.println("eScheduleCont : " + eScheduleCont);
		return eScheduleCont;
	}

	@Override
	public EDoingASVO doingAS(HashMap<String, Object> map) {
		List<EDoingASVO> result = eworkdao.doingAS(map);
		EDoingASVO reservationInfo = result.get(0);
		reservationInfo.setF_date(reservationInfo.getF_date().substring(0, 4) + "년 " + reservationInfo.getF_date().substring(4, 6) + "월 " + reservationInfo.getF_date().substring(6, 8) + "일 ");
		//System.out.println("reservationInfo : " + reservationInfo);
		return reservationInfo;
	}

	@Override
	public ProductFreeVO freeOrNotCheck(HashMap<String, Object> map) {
		List<ProductFreeVO> result = eworkdao.freeOrNotCheck(map); 
		ProductFreeVO freeOrNot = null;
		//if(!(result.isEmpty())) {
			freeOrNot = result.get(0);
			if(Integer.parseInt(freeOrNot.getFreeornot()) == 0) {
				freeOrNot.setFreeornot("무상 출장");
			} else {
				freeOrNot.setFreeornot("유상 출장");
			}
		//} else {
			
		//}
//https://192.168.43.249/DoingQRAS?p_name=SC16Z-1D5E&s_num=SN00000002
		return freeOrNot; 
	}

	@Override
	public List<String> getPartsList(HashMap<String, Object> map) {
		List<ProductFreeVO> partsList = eworkdao.getPartsList(map);
		//System.out.println("partsList : " + partsList);
		List<String> result = new ArrayList();
		for(int i = 0; i<partsList.size(); i++) {
			result.add(partsList.get(i).getPa_name());
		}
		//System.out.println(result);
		return result;
	}

	@Override
	public void finishService(HashMap<String, Object> map) {
		System.out.println("피니시 서비스의 서비스 : " + map);
		eworkdao.finishService(map);
		
	}

	@Override
	public List<EWorkVO> SearchFreeOrNot(HashMap<String, Object> map) {
		List<EWorkVO> SearchFreeOrNot = eworkdao.SearchFreeOrNot(map); 
		return SearchFreeOrNot;
	}



}
