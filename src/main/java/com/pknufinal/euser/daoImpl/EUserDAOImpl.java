package com.pknufinal.euser.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pknufinal.euser.dao.EUserDAO;
import com.pknufinal.euser.vo.EUserVO;

@Repository("EUserDao") 
public class EUserDAOImpl implements EUserDAO {

	@Autowired
	SqlSession sqlsession;
	 
	@Override
	public List<EUserVO> e_login(HashMap<String, Object> map) {
		//sqlsession.selectOne("EUser.elogin", map);
		sqlsession.selectList("EUser.elogin", map);
		List<EUserVO> list = (List<EUserVO>) map.get("result");
		System.out.println("result : " + list); 
		return list;
	}

	/*@Override
	public List<EUserVO> e_viewMyPage(String e_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_id", e_id);
		//EUserVO result = sqlsession.selectOne("EUser.eviewMyPage", e_id);
		sqlsession.selectList("EUser.eviewMyPage", map);
		List<EUserVO> list = (List<EUserVO>) map.get("result");
		System.out.println("list : " + list);
		return list;
	}*/
	
	@Override
	public EUserVO e_view(HashMap<String, Object> map) {
		System.out.println("여기 : " + map);
		sqlsession.selectList("EUser.EUserView", map);
		
		List<EUserVO> euserList = (List<EUserVO>) map.get("result");
		EUserVO euserVo = euserList.get(0);
		return euserVo;
	}

	@Override
	public void e_update(HashMap<String, Object> map) {
		sqlsession.update("EUser.EUserUpdate", map);
		
	}

	@Override
	public void EUserImgUpdate(HashMap<String, Object> map) {
		sqlsession.update("EUser.EUserImgUpdate",map);
		
	}

	


}
