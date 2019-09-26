package com.pkfinal.board.dao;

import java.util.HashMap;
import java.util.List;

import com.pkfinal.board.vo.BoardVo;

public interface BoardDao {

	List<BoardVo> getList(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map);

	BoardVo getContent(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);

}
