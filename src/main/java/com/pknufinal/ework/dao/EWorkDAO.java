package com.pknufinal.ework.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.pknufinal.ework.vo.EDoingASVO;
import com.pknufinal.ework.vo.EScheduleContVO;
import com.pknufinal.ework.vo.EScheduleVO;
import com.pknufinal.ework.vo.EWorkVO;
import com.pknufinal.ework.vo.ProductFreeVO;

public interface EWorkDAO {

	List<EScheduleVO> getEScheduleList(HashMap<String, Object> map);

	List<EScheduleVO> changeEScheduleList(HashMap<String, Object> map);

	List<EScheduleContVO> eScheduleView(HashMap<String, Object> map);

	List<EDoingASVO> doingAS(HashMap<String, Object> map);

	List<ProductFreeVO> freeOrNotCheck(HashMap<String, Object> map);

	List<ProductFreeVO> getPartsList(HashMap<String, Object> map);

	void finishService(HashMap<String, Object> map);

	List<EWorkVO> SearchFreeOrNot(HashMap<String, Object> map);


 

}
