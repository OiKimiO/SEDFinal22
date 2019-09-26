package com.pkfinal.main.members.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.main.members.vo.MembersVo;
@Repository
public class MembersDaoImpl implements MembersDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void join(HashMap<String, Object> map) {
		sqlSession.insert("Member.Join", map);
	}

	@Override
	public HashMap<String, Object> idDupCheck(HashMap<String, Object> map) {
		MembersVo membersVo = sqlSession.selectOne("Member.IdDupCheck", map);
		map.put("membersVo", membersVo);
		return map;
	}

	@Override
	public void mUpdate(HashMap<String, Object> map) {
		sqlSession.update("Member.MUpdate", map);
		
	}

}
