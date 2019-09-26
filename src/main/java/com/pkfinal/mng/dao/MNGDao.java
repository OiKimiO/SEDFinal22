package com.pkfinal.mng.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.mng.vo.DateVo;
import com.pkfinal.mng.vo.MNGVo;

public interface MNGDao {


	List<MNGVo> selectManagement(HashMap<String, Object> map);

	List<MNGVo> detailSelectManagement(HashMap<String, Object> map);

	List<MNGVo> selectManagementId(HashMap<String, Object> map);

	void cancelManagement(HashMap<String, Object> map);

	List<MNGVo> RidSelect(HashMap<String, Object> map);

	List<DateVo> MonthFind(HashMap<String, Object> map);

	List<DateVo> DayFind(HashMap<String, Object> map);

	List<DateVo> ProcessedDayFind(HashMap<String, Object> mapper);

	List<MNGVo> EnginSearch(HashMap<String, Object> map);

	void insertManagement(HashMap<String, Object> map);

	void updateManagement(HashMap<String, Object> map);

	List<MNGVo> MaxRSid(HashMap<String, Object> map);

	List<MNGVo> checkMng(HashMap<String, Object> map);

}
