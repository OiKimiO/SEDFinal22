package com.pknufinal.ework.service;

import java.util.HashMap;
import java.util.List;

import com.pknufinal.ework.vo.EDoingASVO;
import com.pknufinal.ework.vo.EScheduleContVO;
import com.pknufinal.ework.vo.EScheduleVO;
import com.pknufinal.ework.vo.EWorkVO;
import com.pknufinal.ework.vo.ProductFreeVO;

public interface EWorkService {

	String[] getDateList();


	List<EScheduleVO> getEScheduleList(HashMap<String, Object> map);


	List<EScheduleVO> changeEScheduleList(HashMap<String, Object> map);


	EScheduleContVO eScheduleView(HashMap<String, Object> map);


	EDoingASVO doingAS(HashMap<String, Object> map);


	ProductFreeVO freeOrNotCheck(HashMap<String, Object> map);


	List<String> getPartsList(HashMap<String, Object> map);


	void finishService(HashMap<String, Object> map);
	

	List<EWorkVO> SearchFreeOrNot(HashMap<String, Object> map);

	
}
