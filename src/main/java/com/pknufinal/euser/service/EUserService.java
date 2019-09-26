package com.pknufinal.euser.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.pknufinal.euser.vo.EUserVO;

public interface EUserService { 
	public EUserVO e_login(HashMap<String, Object> map);

	//public EUserVO e_viewMyPage(String e_id);
	
	public EUserVO e_view(HashMap<String, Object> map);

	public void e_update(HashMap<String, Object> map);

	public String e_map(HashMap<String, Object> map);

	public void imgUpdate(HashMap<String, Object> map,HttpServletRequest request);

}
