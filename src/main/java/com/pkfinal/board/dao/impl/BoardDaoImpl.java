package com.pkfinal.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pkfinal.board.dao.BoardDao;
import com.pkfinal.board.vo.BoardVo;
 
@Repository("BoardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVo> getList(HashMap<String, Object> map) {
		sqlSession.selectList("Board.BoardList", map);	
		List<BoardVo> boardList = (List<BoardVo>) map.get("result");
		// 페이지 번호별 리스트의 값들을 리턴 받는 것
		return boardList;
	}

	@Override
	public void setWrite(HashMap<String, Object> map) {
		sqlSession.insert("Board.BoardInsert", map);
		
	}

	@Override
	public BoardVo getContent(HashMap<String, Object> map) {
		sqlSession.selectList("Board.BoardContent", map);
		
		List<BoardVo> list = (List<BoardVo>) map.get("result");
		BoardVo boardVo = list.get(0);
		return boardVo;
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {
		System.out.println("DaoImpl map : " + map);
		sqlSession.update("Board.BoardUpdate", map);
		
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {
		sqlSession.delete("Board.BoardDelete",map);
		
	}

}
