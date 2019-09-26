package com.pkfinal.mng.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.eng.service.impl.EngineerPaging;
import com.pkfinal.eng.vo.EngVo;
import com.pkfinal.mng.dao.MNGDao;
import com.pkfinal.mng.service.MNGService;
import com.pkfinal.mng.vo.DateVo;
import com.pkfinal.mng.vo.MNGVo;
 
@Service("MNGService")
public class MNGServiceImpl implements MNGService {

	@Autowired
	private MNGDao mngDao;
	@Override
	public List<MNGVo> selectManagement(HashMap<String, Object> map) {
		
		int pagetotalcount = 10; // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		int pagecount 	   = 5; // 한 페이지에 보여줄 라인 수

		
		map.put("pagecount", pagecount); // db에 전달하기 위해 보관
		// db 조회
		System.out.println("serviceimpl map : " + map );
		List<MNGVo> selectManagement = mngDao.selectManagement(map); // mybatis에서 받은 값은 처음 출발했던 데이터에 보태서 들고 있다
		
		
		
		
		System.out.println(map);
		// map : 기존 map + Mybatis에서 넘겨준 (out)정보 
		// 조회된 이후 처리
		int nowpage    = Integer.parseInt(String.valueOf(map.get("nowpage")));		    // 기존 request된 데이터
		int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum")));       // 기존 request된 데이터	
		int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));	// Mybatis에서 넘겨준 (out)정보
		
		// BoardPaging : paging.jspf 에 필요한 값을 계산해준다 -> PdsVo 타입으로 담아준다
//		(int totalCount, int nowPage, int pageCount, int pageTotalCount, int pageGrpNum)
		MNGPaging bp = new MNGPaging(totalcount,nowpage, pagecount,  pagetotalcount, pagegrpnum);
		
		//paging.jspf 에 필요한 값을 가져온다
		EngVo vo = bp.getMngPagingInfo(); 
		System.out.println("serviceimpl : " + vo);
		map.put("pagePdsVo", vo );		
		return selectManagement;
	}

	@Override
	public List<MNGVo> detailSelectManagement(HashMap<String, Object> map) {
		List<MNGVo> detailSelectManagement = mngDao.detailSelectManagement(map);
		return detailSelectManagement; 
	}

	@Override
	public List<MNGVo> selectManagementId(HashMap<String, Object> map) {
		int pagetotalcount = 10; // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		int pagecount 	   = 5; // 한 페이지에 보여줄 라인 수

		
		map.put("pagecount", pagecount); // db에 전달하기 위해 보관
		// db 조회
		System.out.println("serviceimpl map : " + map );
		List<MNGVo> selectManagementId = mngDao.selectManagementId(map); // mybatis에서 받은 값은 처음 출발했던 데이터에 보태서 들고 있다
		
		System.out.println(map);
		// map : 기존 map + Mybatis에서 넘겨준 (out)정보 
		// 조회된 이후 처리
		int nowpage    = Integer.parseInt(String.valueOf(map.get("nowpage")));		    // 기존 request된 데이터
		int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum")));       // 기존 request된 데이터	
		int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));	// Mybatis에서 넘겨준 (out)정보
		
		// BoardPaging : paging.jspf 에 필요한 값을 계산해준다 -> PdsVo 타입으로 담아준다
//		(int totalCount, int nowPage, int pageCount, int pageTotalCount, int pageGrpNum)
		MNGPaging bp = new MNGPaging(totalcount,nowpage, pagecount,  pagetotalcount, pagegrpnum);
		
		//paging.jspf 에 필요한 값을 가져온다
		EngVo vo = bp.getMngPagingInfo(); 
		System.out.println("serviceimpl : " + vo);
		map.put("pagePdsVo", vo );		
		return selectManagementId;
	}

	@Override
	public void cancelManagement(HashMap<String, Object> map) {
		mngDao.cancelManagement(map);
	}

	@Override
	public List<MNGVo> RidSelect(HashMap<String, Object> map) {
		List<MNGVo> RidSelect = mngDao.RidSelect(map);
		return RidSelect;
	}

	@Override
	public List<DateVo> MonthFind(HashMap<String, Object> map) {
		List<DateVo> MonthFind = mngDao.MonthFind(map);
		return MonthFind; 
	}

	@Override
	public List DayFind(HashMap<String, Object> map) {
		List<DateVo> DayFind = mngDao.DayFind(map);
		List<DateVo> prDay   = new ArrayList();
		HashMap<String,Object> mapper = new HashMap();
		List storeMapper = new ArrayList();
		for (int i = 0; i < DayFind.size(); i++) {
			DateVo Datevo = DayFind.get(i);
			mapper.put("current_date", Datevo.getDay());
			mapper.put("r_id", map.get("r_id"));
			List<DateVo> ProcessedDayFind = mngDao.ProcessedDayFind(mapper);
			if(ProcessedDayFind.size() == 0) {	
				}else {
					storeMapper.add(DayFind.get(i));		
				}//else1 end
				
			}
		return storeMapper;
	}

	@Override
	public List ProcessedDayFind(HashMap<String, Object> map) {
		List ProcessedDayFind = mngDao.ProcessedDayFind(map);
		return ProcessedDayFind;
	}

	@Override
	public List<MNGVo> EnginSearch(HashMap<String, Object> map) {
		List<MNGVo> EnginSearch = mngDao.EnginSearch(map);
		return EnginSearch;
	}

	@Override
	public void insertManagement(HashMap<String, Object> map) {
		mngDao.insertManagement(map);
		System.out.println("추가성공");
		
	} 
	
	@Override
	public void updateManagement(HashMap<String, Object> map) {
		mngDao.updateManagement(map);
		System.out.println("업데이트성공");
		
	}

	@Override
	public List<MNGVo> MaxRSid(HashMap<String, Object> map) {
		List<MNGVo> MaxRSid = mngDao.MaxRSid(map);
		return MaxRSid;
	}

	@Override
	public List<MNGVo> checkMng(HashMap<String, Object> map) {
		List<MNGVo> checkMng = mngDao.checkMng(map);
		return checkMng;
	} 
}
