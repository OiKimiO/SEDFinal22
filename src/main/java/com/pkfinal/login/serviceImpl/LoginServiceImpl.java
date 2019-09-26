package com.pkfinal.login.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pkfinal.login.dao.LoginDao;
import com.pkfinal.login.service.LoginService;
import com.pkfinal.main.members.vo.MembersVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;
	
	@Override
	public MembersVo loginAction(HashMap<String, Object> map) {
		return loginDao.loginAction(map);
	}




	@Override
	public boolean findId(HashMap<String, Object> map) {
		boolean findIdCheck;
				
		MembersVo vo=loginDao.findId(map);
		
		if(vo==null) {
			findIdCheck=false;
		}else {
			findIdCheck=true;
		}		
		return findIdCheck;
	}
		
	
	

	// 패스워드 찾기
		@Override
		public boolean findpwd(HashMap<String, Object> map) {
			boolean findPwdCheck;
			
			MembersVo vo = loginDao.findPwd(map);

			if(vo!=null) {
				findPwdCheck=true;
			}else {
				findPwdCheck=false;
			}		
			return findPwdCheck;
		}

	/*
	 * // 패스워드 찾기 후 패스워드 변경
	 * 
	 * @Override public boolean changePwd(HashMap<String, Object> map) { boolean
	 * changeCheck = false; loginDao.changePwd(map); System.out.println(map);
	 * if(map.get("pat_id") != null) { changeCheck = true; } return changeCheck; }
	 */

	
	
	
	
	//회원 상세 정보 뽑아낼 떄 사용
		@Override
		public List<MembersVo> empDetail(HashMap<String, Object> map) {
			List<MembersVo>list=loginDao.empDetail(map);
			return list;
		}



}
