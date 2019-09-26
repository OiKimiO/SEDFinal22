package com.pkfinal.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.board.service.BoardService;
import com.pkfinal.board.vo.BoardVo;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/Management/Board/List")
	public ModelAndView mboardList(@RequestParam HashMap<String, Object> map) {
		System.out.println("BoardList 초기값 받는 곳  : " + map);
		List<BoardVo> boardList = boardService.getList(map);	//QnA 조회
		BoardVo pagePdsVo = (BoardVo) map.get("pagePdsVo");
		System.out.println(pagePdsVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.addObject("boardList",   boardList);
		mv.addObject("pagePdsVo",   pagePdsVo);
		String page = "/Management/Board/List";
		mv.addObject("page", page);
		mv.addObject("pagePdsVo",   pagePdsVo);
 
		mv.setViewName("mboard/list");
		
		return mv;
	}
	
	@RequestMapping("/Management/Board/WriteForm")
	public ModelAndView mboardWriteForm(@RequestParam HashMap<String, Object> map) {
		
		//관리자 아이디 설정 : sky
		map.put("m_id", "sky");
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		System.out.println("/Board/WriteForm map : " + map);
		mv.setViewName("mboard/write");
		
		return mv;
	}
	
	@RequestMapping("/Management/Board/Write")
	public ModelAndView mboardWrite(@RequestParam HashMap<String, Object> map,
			HttpServletRequest request ) {
		// 넘어온 자료를 저장
		System.out.println("인설트된 값을 확인 : " + map);
		boardService.setWrite(map, request);

		ModelAndView mv = new ModelAndView();
		// 페이징 정보를 가지고 가야함
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.setViewName("redirect:/Management/Board/List");
		return mv;
	}
	
	@RequestMapping("/Management/Board/Content")
	public ModelAndView mqnaContent(@RequestParam HashMap<String, Object> map,HttpSession session) {
		
		BoardVo		  boardVo		= boardService.getContent(map);
		session.setAttribute("m_id", "admin");
		System.out.println("값을 받는곳" + boardVo);
		ModelAndView mv = new ModelAndView(); 
		
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.addObject("map",map);
		mv.addObject("boardVo",boardVo);
		
		mv.setViewName("mboard/content");
		return mv;
	}
	
	@RequestMapping("/Management/Board/UpdateForm")
	public ModelAndView mboardUpdateForm(@RequestParam HashMap<String, Object> map) {
		
		BoardVo			boardVo		= boardService.getContent(map);
		
		ModelAndView mv = new ModelAndView();
		
		
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.addObject("boardVo",boardVo);
		
		mv.setViewName("mboard/update");
		return mv;
	}
	
	@RequestMapping("/Management/Board/Update")
	public ModelAndView mboardUpdate(@RequestParam HashMap<String, Object> map,
			HttpServletRequest request ) {
		// 넘어온 자료를 저장
		boardService.setUpdate(map, request);
		//boardService.fileDelete(map, request);
		ModelAndView mv = new ModelAndView();
		// 페이징 정보를 가지고 가야함
		mv.addObject("nowpage",    map.get("nowpage")   );
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.setViewName("redirect:/Management/Board/List");
		return mv;
	}
	
	@RequestMapping("/Management/Board/Delete")
	public ModelAndView mboardDelete(@RequestParam HashMap<String, Object> map) {
		
		boardService.setDelete(map);
		
		ModelAndView mv = new ModelAndView();
		
		// 페이징 정보를 가지고 가야함

		List<BoardVo> boardList = boardService.getList(map);	//QnA 조회
		BoardVo pagePdsVo = (BoardVo) map.get("pagePdsVo");
		System.out.println(pagePdsVo);
		
		mv.addObject("boardList",   boardList);
		mv.addObject("pagePdsVo",   pagePdsVo);
		mv.addObject("nowpage",    map.get("nowpage")   );
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		String page = "/Management/Board/List";
		mv.addObject("page", page);
		mv.setViewName("mboard/list");
		return mv;
	}
	// head에서 공지사항을 눌렀을 때 가장 먼저 값을 받는 RequestMapping
	@RequestMapping("/Board/List")
	public ModelAndView boardList(@RequestParam HashMap<String, Object> map) {
		System.out.println("BoardList 초기값 받는 곳  : " + map);	// 처음에는 nowpage = 1 과 pagegrpnum = 1의 값을 받는다.
		List<BoardVo> boardList = boardService.getList(map);	//QnA 조회
		BoardVo pagePdsVo = (BoardVo) map.get("pagePdsVo");
		System.out.println(pagePdsVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.addObject("boardList",   boardList);
		mv.addObject("pagePdsVo",   pagePdsVo);
		/*String page = "/Board/List";
		mv.addObject("page",   page);*/
		
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@RequestMapping("/Board/WriteForm")
	public ModelAndView boardWriteForm(@RequestParam HashMap<String, Object> map) {
		
		//관리자 아이디 설정 : sky
		map.put("m_id", "sky");
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		System.out.println("/Board/WriteForm map : " + map);
		mv.setViewName("board/write");
		
		return mv;
	}
	
	@RequestMapping("/Board/Write")
	public ModelAndView boardWrite(@RequestParam HashMap<String, Object> map,
			HttpServletRequest request ) {
		// 넘어온 자료를 저장
		boardService.setWrite(map, request);
		
		ModelAndView mv = new ModelAndView();
		// 페이징 정보를 가지고 가야함
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.setViewName("redirect:/Board/List");
		return mv;
	}
	
	@RequestMapping("/Board/Content")
	public ModelAndView qnaContent(@RequestParam HashMap<String, Object> map,HttpSession session) {
		
		BoardVo		  boardVo		= boardService.getContent(map);
		session.setAttribute("m_id", "admin");
		System.out.println("값을 받는곳" + boardVo);
		ModelAndView mv = new ModelAndView(); 
		
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.addObject("map",map);
		mv.addObject("boardVo",boardVo);
		
		mv.setViewName("board/content");
		return mv;
	}
	
	@RequestMapping("/Board/UpdateForm")
	public ModelAndView boardUpdateForm(@RequestParam HashMap<String, Object> map) {
		
		BoardVo			boardVo		= boardService.getContent(map);
		
		ModelAndView mv = new ModelAndView();
		
		
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.addObject("boardVo",boardVo);
		
		mv.setViewName("board/update");
		return mv;
	}
	
	@RequestMapping("/Board/Update")
	public ModelAndView boardUpdate(@RequestParam HashMap<String, Object> map,
			HttpServletRequest request ) {
		// 넘어온 자료를 저장
		boardService.setUpdate(map, request);
		//boardService.fileDelete(map, request);
		ModelAndView mv = new ModelAndView();
		// 페이징 정보를 가지고 가야함
		mv.addObject("nowpage",    map.get("nowpage")   );
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.setViewName("redirect:/Board/List");
		return mv;
	}
	
	@RequestMapping("/Board/Delete")
	public ModelAndView boardDelete(@RequestParam HashMap<String, Object> map) {
		
		boardService.setDelete(map);
		
		ModelAndView mv = new ModelAndView();
		
		// 페이징 정보를 가지고 가야함
		
		List<BoardVo> boardList = boardService.getList(map);	//QnA 조회
		BoardVo pagePdsVo = (BoardVo) map.get("pagePdsVo");
		System.out.println(pagePdsVo);
		
		mv.addObject("boardList",   boardList);
		mv.addObject("pagePdsVo",   pagePdsVo);
		
		mv.setViewName("board/list");
		return mv;
	}
}
