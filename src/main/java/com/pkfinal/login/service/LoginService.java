package com.pkfinal.login.service;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.main.members.vo.MembersVo;

public interface LoginService {

	public MembersVo loginAction(HashMap<String, Object> map);

	//회원정보수정할 떄 사용
	public List<MembersVo> empDetail(HashMap<String, Object> map);

	public boolean findId(HashMap<String, Object> map);

	public boolean findpwd(HashMap<String, Object> map);

	/* public boolean changePwd(HashMap<String, Object> map); */

}
