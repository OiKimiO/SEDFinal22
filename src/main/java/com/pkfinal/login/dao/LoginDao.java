package com.pkfinal.login.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.main.members.vo.MembersVo;

public interface LoginDao {

	public MembersVo loginAction(HashMap<String, Object> map);

	public List<MembersVo> empDetail(HashMap<String, Object> map);

	public MembersVo findId(HashMap<String, Object> map);

	public MembersVo findPwd(HashMap<String, Object> map);

	/* public void changePwd(HashMap<String, Object> map); */

}
