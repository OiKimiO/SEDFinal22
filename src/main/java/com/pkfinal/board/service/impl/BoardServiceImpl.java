package com.pkfinal.board.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.board.dao.BoardDao;
import com.pkfinal.board.service.BoardService;
import com.pkfinal.board.vo.BoardVo;
import com.pkfinal.eng.service.impl.EngineerPaging;
import com.pkfinal.eng.vo.EngVo;


@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> getList(HashMap<String, Object> map) {
		
		
		int pagecount	   = 1;		// 한페이지에 보여줄 리스트수
		
		
		// db조회	
		map.put("pagecount", pagecount); // 한페이지에 보여줄 리스트수		
		
		
		// map에 현재까지 nowpage = 1,  pagecount = 5 , pagegrpnum은 데이터베이스의 select에서는 아직까지 쓰이지 않는다.
		System.out.println("serviceimpl map : " + map );
		List<BoardVo> boardList = boardDao.getList(map);  // mybatis에서 받은 값은 처음 출발했던 데이터에 보태서 들고 있다
		System.out.println("selectEngineer serviceimpl : " + boardList );
		
		//BoardVo boardVo = boardList.get(0);
		
		
		System.out.println(map);	// nowpage, pageprnum, pagecount, totalcount

		int pagetotalcount = 4;		// 현재 페이지 하단에 최대로 보여주고 싶은 페이지 번호의 갯수
		
		// map : 기존 map + Mybatis에서 넘겨준 (out)정보 
		// 조회된 이후 처리
		int nowpage    = Integer.parseInt(String.valueOf(map.get("nowpage")));		    // 기존 request된 데이터
		int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum")));       // 기존 request된 데이터	
		int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));		// Mybatis에서 넘겨준 (out)정보
		
		// BoardPaging : paging.jspf 에 필요한 값을 계산해준다 -> PdsVo 타입으로 담아준다
//		(int totalCount, int nowPage, int pageCount, int pageTotalCount, int pageGrpNum)
		BoardPaging bp = new BoardPaging(totalcount,nowpage, pagecount,  pagetotalcount, pagegrpnum);
		
		//paging.jspf 에 필요한 값을 가져온다
		BoardVo vo = bp.getBoardPagingInfo(); 
		System.out.println("serviceimpl : " + vo);
		map.put("pagePdsVo", vo );
	
		

		return boardList;
	}

	@Override
	public void setWrite(HashMap<String, Object> map, HttpServletRequest request) {
		boardDao.setWrite( map );
		
	}

	@Override
	public BoardVo getContent(HashMap<String, Object> map) {
		BoardVo boardVo = boardDao.getContent(map);
		return boardVo;
	}

	@Override
	public void setUpdate(HashMap<String, Object> map, HttpServletRequest request) {
		
		
		// dn 에 정보 저장 1, 3
		boardDao.setUpdate(map);
		
		
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		int check_count =  Integer.parseInt((String) map.get("check_count"));
		List<String> strArray = new ArrayList<String>();
		String idx =  (String) map.get("idx");
		
		if(check_count == 1) {
			map.put("idx",idx);
			boardDao.setDelete(map);
				
		}
		
		if(check_count > 1) {
		String[] GetE_id = idx.split(",");
			for (int i = 0; i < check_count; i++) {
				
				System.out.println(GetE_id[i]);
				int idx1 = Integer.parseInt (GetE_id[i]);
				map.put("idx",idx1);
				System.out.println("delete map : " + map);
				boardDao.setDelete(map);
			}
		}
			
	}

}
