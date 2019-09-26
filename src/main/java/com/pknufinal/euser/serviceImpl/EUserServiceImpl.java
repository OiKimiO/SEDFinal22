package com.pknufinal.euser.serviceImpl;

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

import com.pkfinal.eng.service.impl.CheckFileName;
import com.pknufinal.euser.dao.EUserDAO;
import com.pknufinal.euser.service.EUserService;
import com.pknufinal.euser.vo.EUserVO;

@Service("EUserService")
public class EUserServiceImpl implements EUserService {

	@Autowired 
	private EUserDAO euserdao; 
	
	@Override
	public EUserVO e_login(HashMap<String, Object> map) {
		List<EUserVO> result = euserdao.e_login(map); 
		EUserVO userInfo;
		if (result.isEmpty()) {
			userInfo = null;
			
		} else {
			userInfo = result.get(0);
		}
		
		return userInfo;
	}

	/*@Override
	public EUserVO e_viewMyPage(String e_id) {
		List<EUserVO> list = euserdao.e_viewMyPage(e_id);
		EUserVO userInfo;
		if (list.isEmpty()) {
			userInfo = null;
			
		} else {
			userInfo = list.get(0);
		}
		return userInfo;
	}*/
	
	@Override
	public EUserVO e_view(HashMap<String, Object> map) {
		EUserVO userInfo = euserdao.e_view(map); 
		return userInfo;
	}

	@Override
	public void e_update(HashMap<String, Object> map) {
		euserdao.e_update(map); 
		
	}

	@Override
	public String e_map(HashMap<String, Object> map) {
		//여기서 가공해서 가져가자~ 좌표들과 정보들을 map에 넣어서~
		return null;
	}

	@Override
	public void imgUpdate(HashMap<String, Object> map,HttpServletRequest request) {
		// 중복파일 처리
				CheckFileName checkFile = new CheckFileName();
				
				String filePath = "D:\\uploadFolder"; // 저장될 경로 지정
				
				// 업로드된 파일 처리
				MultipartHttpServletRequest multipartServletRequest
				= (MultipartHttpServletRequest) request;
				System.out.println("insert Request : " + request);
				
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
				euserdao.EUserImgUpdate(map);
		
	}


}
