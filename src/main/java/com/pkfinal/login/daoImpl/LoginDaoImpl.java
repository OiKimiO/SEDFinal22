package com.pkfinal.login.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.login.dao.LoginDao;
import com.pkfinal.main.members.vo.MembersVo;

@Repository
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MembersVo loginAction(HashMap<String, Object> map) {
		MembersVo membersVo = sqlSession.selectOne("Login.LoginAction", map);
		return membersVo;
	}
	
	//아이디 찾기
	@Override
	public MembersVo findId(HashMap<String, Object> map) {
		sqlSession.selectList("Login.findid",map);
		MembersVo vo = null;
		
		try {
			List<MembersVo>list = (List<MembersVo>) map.get("result");
			vo = list.get(0);
		} catch (Exception e) {}
		return vo;
	}
	
	//비번 찾기
	@Override
	public MembersVo findPwd(HashMap<String, Object> map) {
		sqlSession.selectList("Login.findPwd",map);
		MembersVo vo = null;
		try {
			List<MembersVo>list = (List<MembersVo>) map.get("result");
			vo = list.get(0);
		} catch (Exception e) {}
		return vo;
	}
	
	/*
	 * //패스워드 찾기 후 패스워드 변경
	 * 
	 * @Override public void changePwd(HashMap<String, Object> map) {
	 * sqlSession.update("Login.changepwd",map); }
	 */
	

	//회원 정보를 뽑아낼 떄 사용
		@Override
		public List<MembersVo> empDetail(HashMap<String, Object> map) {
			sqlSession.selectList("Login.MemDetail", map);
			List<MembersVo> list = (List<MembersVo>) map.get("result");
			return list;
		}
	
}
