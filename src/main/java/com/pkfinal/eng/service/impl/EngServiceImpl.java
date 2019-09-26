package com.pkfinal.eng.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pkfinal.eng.dao.EngDao;
import com.pkfinal.eng.service.EngService;
import com.pkfinal.eng.vo.EngVo;


@Service("EngService")
public class EngServiceImpl implements EngService {
	
	@Autowired
	private EngDao engDao;
	
	@Override
	public void insertEngineer(HashMap<String, Object> map, HttpServletRequest request) {
		
		//-------------------------------------------------------
		// 1. 넘어온 문자들 처리
		// 	  DaoImpl이 처리 -> db저장
		//    writer, title, cont, menu_id, bnum, lvl, step, nref
		
		// 2. 넘어온 파일 저장  
		//    MultipartHttpServletRequest 객체가 담당
		
		// 3. 저장된 파일정보 db에 저장
		//-------------------------------------------------------
		
		// 중복파일 처리
		CheckFileName checkFile = new CheckFileName();
		
		String filePath = "D:\\uploadFolder"; // 저장될 경로 지정
		
		// 업로드된 파일 처리
		MultipartHttpServletRequest multipartServletRequest
		= (MultipartHttpServletRequest) request;
		System.out.println("insert Request : " + request);
		
		Iterator<String> iterator = multipartServletRequest.getFileNames(); // multifileServeletReqeust라는 객체를 iterator 객체로 변경시킨다.
		MultipartFile multipartFile = null;
		
		// 저장된 파일 목록 정보
		List<String> filenames = new ArrayList<String>();
		List<String> fileexts = new ArrayList<String>();
		List<String> sfilenames = new ArrayList<String>();
		
		String fileName = null;
		String orgFileName = null;
		String fileExt = null;
		String sFileName = null;
		
		int i = 0;
		while( iterator.hasNext() ){	// iterator에 있는 데이터가 있다면 true를 반환 혹은 false를 반환한다.
			multipartFile = multipartServletRequest.getFile(iterator.next());	
			// 서버상에 업로드된 getFile을 이용해 getFile내에 있는 iterator에 있는 파일객체 하나씩 리턴해 파일을 하나씩 비교한다.
			
			HashMap<String, String> HashMap = new HashMap<>();
			
			if( !multipartFile.isEmpty()) {
				fileName = multipartFile.getOriginalFilename();
				// getOriginFilename을 통해 upload된 파일명을 들고온다. 
				
				int dotIdx  = fileName.lastIndexOf('.');		// 파일의 .이 찍힌 인덱스 위치를 반환한다.
				orgFileName =  fileName.substring(0, dotIdx);	// 파일의 이름을 반환한다.
				fileExt     = fileName.substring( dotIdx ); 	// .위치 및 확장자 까지를 들고 온다.
				
				// 중복파일이 존재하면 번호 추가 후 실제 파일명 처리
				sFileName   = checkFile.getCheckFileName(
					filePath, orgFileName, fileExt	);
				
				filenames.add(fileName);
				fileexts.add(fileExt);
				sfilenames.add(sFileName);
				
				/*map.put("filenames", filenames);
				map.put("fileexts", fileexts);
				map.put("sfilenames", sfilenames);*/
				
				System.out.println("서비스 임플의 확인:" + map);
				System.out.println("fileName서비스 임플의 확인:" + fileName);
				System.out.println("sFileName서비스 임플의 확인:" + sFileName);
				String picture = sFileName;
				map.put("e_img", picture);
				//String picture = (String) map.get("e_img");
				// 저장
				File file = new File (filePath + "\\" +picture);				
				i += 1;
				try {
					multipartFile.transferTo( file );
					System.out.println(i+ "." + file + "저장됨");
				} catch(IllegalStateException e) {
					e.printStackTrace();
				} catch(IOException e) {
					System.out.println("오류 :" + e.getMessage());
					e.printStackTrace();
				}
			}
		} // file 저장 끝
		System.out.println(map.get("e_img"));
		engDao.insertEngineer(map);
		
	}

	@Override
	public List<EngVo> selectEngineer(HashMap<String, Object> map) {
			
		int pagetotalcount = 10; // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		int pagecount 	   = 5; // 한 페이지에 보여줄 라인 수

		
		map.put("pagecount", pagecount); // db에 전달하기 위해 보관
		// db 조회
		System.out.println("serviceimpl map : " + map );
		List<EngVo> selectEngineer = engDao.selectEngineer(map); // mybatis에서 받은 값은 처음 출발했던 데이터에 보태서 들고 있다
		System.out.println("selectEngineer serviceimpl : " + selectEngineer );
		
		EngVo engvo = selectEngineer.get(0);
		
		
		
		System.out.println(map);
		// map : 기존 map + Mybatis에서 넘겨준 (out)정보 
		// 조회된 이후 처리
		int nowpage    = Integer.parseInt(String.valueOf(map.get("nowpage")));		    // 기존 request된 데이터
		int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum")));       // 기존 request된 데이터	
		int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));	// Mybatis에서 넘겨준 (out)정보
		
		// BoardPaging : paging.jspf 에 필요한 값을 계산해준다 -> PdsVo 타입으로 담아준다
//		(int totalCount, int nowPage, int pageCount, int pageTotalCount, int pageGrpNum)
		EngineerPaging bp = new EngineerPaging(totalcount,nowpage, pagecount,  pagetotalcount, pagegrpnum);
		
		//paging.jspf 에 필요한 값을 가져온다
		EngVo vo = bp.getEngineerPaging(); 
		System.out.println("serviceimpl : " + vo);
		map.put("pagePdsVo", vo );
		return selectEngineer;
	
	}

	@Override
	public void UpdateEngineer(HashMap<String, Object> map, HttpServletRequest request) {
		
		//-------------------------------------------------------
				// 1. 넘어온 문자들 처리
				// 	  DaoImpl이 처리 -> db저장
				//    writer, title, cont, menu_id, bnum, lvl, step, nref
				
				// 2. 넘어온 파일 저장  
				//    MultipartHttpServletRequest 객체가 담당
				
				// 3. 저장된 파일정보 db에 저장
				//-------------------------------------------------------
				
				// 중복파일 처리
				CheckFileName checkFile = new CheckFileName();
			
				String filePath = "D:\\uploadFolder"; // 저장될 경로 지정
				
				// 업로드된 파일 처리
				MultipartHttpServletRequest multipartServletRequest
				= (MultipartHttpServletRequest) request;
				
				Iterator<String> iterator = multipartServletRequest.getFileNames();
				MultipartFile multipartFile = null;
				
					
				
				// 저장된 파일 목록 정보
				List<String> filenames = new ArrayList<String>();
				List<String> fileexts = new ArrayList<String>();
				List<String> sfilenames = new ArrayList<String>();
				
				String fileName = null;
				String orgFileName = null;
				String fileExt = null;
				String sFileName = null;
				System.out.println("service : " + iterator);
				int i = 0;
				while( iterator.hasNext() ){
					multipartFile = multipartServletRequest.getFile(iterator.next());
					
					HashMap<String, String> HashMap = new HashMap<>();
					
					if( !multipartFile.isEmpty()) {
						fileName = multipartFile.getOriginalFilename();
						// upload된 파일명
						
						int dotIdx  = fileName.lastIndexOf('.');
						orgFileName =  fileName.substring(0, dotIdx);
						fileExt     = fileName.substring( dotIdx ); // .위치를 들고간다
						
						// 중복파일이 존재하면 번호 추가 후 실제 파일명 처리
						sFileName   = checkFile.getCheckFileName(
							filePath, orgFileName, fileExt	);
						
						filenames.add(fileName);
						fileexts.add(fileExt);
						sfilenames.add(sFileName);
						
						/*map.put("filenames", filenames);
						map.put("fileexts", fileexts);
						map.put("sfilenames", sfilenames);*/
						
						System.out.println("서비스 임플의 확인:" + map);
						System.out.println("fileName서비스 임플의 확인:" + fileName);
						System.out.println("sFileName서비스 임플의 확인:" + sFileName);
						String picture = sFileName;
						map.put("e_img", picture);
						//String picture = (String) map.get("e_img");
						// 저장
						File file = new File (filePath + "\\" +picture);				
						i += 1;
						try {
							multipartFile.transferTo( file );
							System.out.println(i+ "." + file + "저장됨");
						} catch(IllegalStateException e) {
							e.printStackTrace();
						} catch(IOException e) {
							System.out.println("오류 :" + e.getMessage());
							e.printStackTrace();
						}
					}
				} // file 저장 끝
				System.out.println(map.get("e_img"));
	
		engDao.UpdateEngineer(map);
		
	}

	@Override
	public void deleteEngineer(HashMap<String, Object> map) {
		
		int check_count =  Integer.parseInt((String) map.get("check_count"));
		List<String> strArray = new ArrayList<String>();
		String e_id =  (String) map.get("e_id");
		
		if(check_count == 1) {
			e_id  = e_id.replace("[\"" , "" );
			e_id  = e_id.replace("\"]" , "" );
			map.put("e_id",e_id);
			engDao.deleteEngineer(map);
				
		}
		
		if(check_count > 1) {
		String[] GetE_id = e_id.split(",");
			for (int i = 0; i < check_count; i++) {
				GetE_id[i] = GetE_id[i].replace("[\"" , "" );
				GetE_id[i] = GetE_id[i].replace("\"]" , "" );
				System.out.println(GetE_id[i]);
				map.put("e_id",GetE_id[i]);
				System.out.println("delete map : " + map);
				engDao.deleteEngineer(map);
			}
		}

	}

	@Override
	public List<EngVo> detailselectEngineer(HashMap<String, Object> map) {
		
		int pagetotalcount = 10; // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		int pagecount 	   = 5; // 한 페이지에 보여줄 라인 수

		
		map.put("pagecount", pagecount); // db에 전달하기 위해 보관
		// db 조회
		System.out.println("serviceimpl map : " + map );
		List<EngVo> detailselectEngineer = engDao.detailselectEngineer(map); // mybatis에서 받은 값은 처음 출발했던 데이터에 보태서 들고 있다
		System.out.println("detailselectEngineer :" + detailselectEngineer );

		
		System.out.println(map);
		// map : 기존 map + Mybatis에서 넘겨준 (out)정보 
		// 조회된 이후 처리
		int nowpage    = Integer.parseInt(String.valueOf(map.get("nowpage")));		    // 기존 request된 데이터
		int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum")));       // 기존 request된 데이터	
		int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));	// Mybatis에서 넘겨준 (out)정보
		
		// BoardPaging : paging.jspf 에 필요한 값을 계산해준다 -> PdsVo 타입으로 담아준다
//		(int totalCount, int nowPage, int pageCount, int pageTotalCount, int pageGrpNum)
		EngineerPaging bp = new EngineerPaging(totalcount,nowpage, pagecount,  pagetotalcount, pagegrpnum);
		
		//paging.jspf 에 필요한 값을 가져온다
		EngVo vo = bp.getEngineerPaging(); 
		System.out.println("serviceimpl : " + vo);
		map.put("pagePdsVo", vo );
		return detailselectEngineer;
		
	} 

	@Override
	public List<EngVo> idSelectEngineer(HashMap<String, Object> map) {
		List<EngVo> idSelectEngineer = engDao.idSelectEngineer(map);
		return idSelectEngineer;
	}

	@Override
	public List<EngVo> selectCenter() {	
		List<EngVo> selectCenter = engDao.selectCenter();
		return selectCenter;
	}
	
	@Override 
	public List<EngVo> selectCate() {
		List<EngVo> selectCate = engDao.selectCate();
		return selectCate;
	}




	


	

}
