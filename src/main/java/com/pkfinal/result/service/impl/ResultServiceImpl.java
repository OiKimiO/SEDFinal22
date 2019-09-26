package com.pkfinal.result.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pkfinal.result.dao.ResultDao;
import com.pkfinal.result.service.ResultService;
import com.pkfinal.result.vo.ResultVo;

@Service("ResultService")
public class ResultServiceImpl implements ResultService {

	
	@Autowired
	private ResultDao resultDao;
	
	

	@Override
	public List<ResultVo> getList(HashMap<String, Object> map) {
		  int pagetotalcount = 10; 		// 현재 페이지 하단에 보여줄 페이지 번호의 수
		  int pagecount = 5; 			// 한페이지에 보여줄 리스트수
		  
		  map.put("pagecount", pagecount);
		 
		// db조회
		List<ResultVo> resultList = resultDao.getList(map); 
		System.out.println("토탈카운트 실화? :"+ map);
		if(resultList.size()==0) {
			return resultList;
		}else{
			 int nowpage = Integer.parseInt(String.valueOf(map.get("nowpage"))); 
			 int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum"))); 
			 int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));
			 System.out.println("totalcount1 : "+ totalcount);
			 ResultPaging bp = new ResultPaging(totalcount,nowpage, pagecount, 
						pagetotalcount, pagegrpnum);
			 ResultVo vo = bp.getResultPagingInfo();
			 map.put("pageResultVo", vo);
		}
		 
		return resultList;
	}



	@Override
	public List<ResultVo> geteng(HashMap<String, Object> map) {
		  int pagetotalcount = 10; // 아래쪽에나오는거 개수 
		  int pagecount = 5; // 한페이지에 보여줄 줄수
		  
		  map.put("pagecount", pagecount);
		 
		// db조회
		List<ResultVo> resultList = resultDao.getEng(map); 
		
		
		  int nowpage = Integer.parseInt(String.valueOf(map.get("nowpage"))); 
		  int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum"))); 
		  int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));
		  
		  ResultPaging bp = new ResultPaging(totalcount,nowpage, pagecount, 
					pagetotalcount, pagegrpnum);
			ResultVo vo = bp.getResultPagingInfo();
			map.put("pageResultVo", vo);
		return resultList;

	}



	@Override
	public List<ResultVo> getdate(HashMap<String, Object> map) {
		 int pagetotalcount = 10; // 아래쪽에나오는거 개수 
		  int pagecount = 5; // 한페이지에 보여줄 줄수
		  
		  map.put("pagecount", pagecount);
		 
		// db조회
		List<ResultVo> resultList = resultDao.getDate(map); 
		
		
		  int nowpage = Integer.parseInt(String.valueOf(map.get("nowpage"))); 
		  int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum"))); 
		  int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));
		  
		  ResultPaging bp = new ResultPaging(totalcount,nowpage, pagecount, 
					pagetotalcount, pagegrpnum);
			ResultVo vo = bp.getResultPagingInfo();
			map.put("pageResultVo", vo);
		return resultList;
	}



	@Override
	public List<ResultVo> getcli(HashMap<String, Object> map) {
		 int pagetotalcount = 10; // 아래쪽에나오는거 개수 
		  int pagecount = 5; // 한페이지에 보여줄 줄수
		  
		  map.put("pagecount", pagecount);
		 
		// db조회
		List<ResultVo> resultList = resultDao.getCli(map); 
		
		
		  int nowpage = Integer.parseInt(String.valueOf(map.get("nowpage"))); 
		  int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum"))); 
		  int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));
		  
		  ResultPaging bp = new ResultPaging(totalcount,nowpage, pagecount, 
					pagetotalcount, pagegrpnum);
		  	ResultVo vo = bp.getResultPagingInfo();
			map.put("pageResultVo", vo);
		return resultList;
	}



	@Override
	public List<ResultVo> checkArray(HashMap<String, Object> map) {
		List<ResultVo> checkArray = resultDao.checkArray(map); 
		return checkArray;
	}
}
