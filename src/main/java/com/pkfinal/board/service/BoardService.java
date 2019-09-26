package com.pkfinal.board.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pkfinal.board.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getList(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	BoardVo getContent(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void setDelete(HashMap<String, Object> map);

}
