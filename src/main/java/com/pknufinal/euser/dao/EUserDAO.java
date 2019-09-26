package com.pknufinal.euser.dao;

import java.util.HashMap;
import java.util.List;

import com.pknufinal.euser.vo.EUserVO;

public interface EUserDAO {
	public List<EUserVO> e_login(HashMap<String, Object> map);

	//public List<EUserVO> e_viewMyPage(String e_id); 
	
	public EUserVO e_view(HashMap<String, Object> map);

	public void e_update(HashMap<String, Object> map);

	public void EUserImgUpdate(HashMap<String, Object> map);

}
