package com.pknufinal.ework.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknufinal.ework.service.EWorkService;
import com.pknufinal.ework.vo.EDoingASVO;
import com.pknufinal.ework.vo.EScheduleContVO;
import com.pknufinal.ework.vo.EScheduleVO;
import com.pknufinal.ework.vo.EWorkVO;
import com.pknufinal.ework.vo.ProductFreeVO;

@Controller
public class EworkController {
	
	@Autowired
	EWorkService eworkservice;

	@RequestMapping("/EScheduleList")
	public ModelAndView eScheduleList(HttpSession session) {
		// 오늘 날짜를 보내서 오늘 날짜 기준으로 일단 초기화면을 구성
		ModelAndView mv = new ModelAndView();
		String[] dateList = eworkservice.getDateList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_id", session.getAttribute("e_id"));
		map.put("f_date", dateList[0].toString());
		//System.out.println("map : " + map);
		List<EScheduleVO> eScheduleList = eworkservice.getEScheduleList(map); 
		//System.out.println("dateList[0].toString() : " + dateList[0].toString());
		//dateList[0].toString();
		mv.addObject("dateList", dateList);
		mv.addObject("eScheduleList", eScheduleList);
		mv.setViewName("/ework/m_schedule");
		return mv;
	}
	
	@RequestMapping("/ChangeEScheduleList")
	@ResponseBody
	public List<EScheduleVO> changeEScheduleList(HttpSession session, @RequestParam String f_date) {
		
		//String[] dateList = eworkservice.getDateList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_id", session.getAttribute("e_id"));
		map.put("f_date", f_date);
		//System.out.println("map : " + map);
		List<EScheduleVO> changedEScheduleList = eworkservice.changeEScheduleList(map); 
		//System.out.println("changedEScheduleList : " + changedEScheduleList);
		//System.out.println("dateList[0].toString() : " + dateList[0].toString());
		//dateList[0].toString();
		return changedEScheduleList;
	}
	
	@RequestMapping("/EScheduleView")
	public ModelAndView eScheduleView(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		EScheduleContVO eScheduleCont = eworkservice.eScheduleView(map);
		//System.out.println(eScheduleCont);
		mv.addObject("eScheduleCont", eScheduleCont);
		mv.setViewName("/ework/m_scheduleCont");
		return mv;
	}
	
	@RequestMapping("/QRPage")
	public ModelAndView qrPage(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		session.setAttribute("r_id", map.get("r_id"));
		//System.out.println("r_id : " + map.get("r_id"));
		/*System.out.println("qrmap : " + map);
		System.out.println("session정보 : " + session.getAttribute("e_id"));*/
		mv.setViewName("/ework/m_qrpage");
		return mv;
	}
	
	@RequestMapping("/DoingQRAS") //QR찍었을 때 작동
	public ModelAndView doingQRAS(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		map.put("e_id", session.getAttribute("e_id"));//map안에 s_num이 있음
		map.put("r_id", session.getAttribute("r_id"));
		EDoingASVO reservationInfo = eworkservice.doingAS(map);
		ProductFreeVO productFreeInfo = eworkservice.freeOrNotCheck(map);
		
		productFreeInfo.setP_name((String) map.get("p_name"));
		productFreeInfo.setS_num((String) map.get("s_num"));
		//값 갖고 오면 vo에 setter로 p_name이랑 s_num넣기
		mv.addObject("productFreeInfo",productFreeInfo);
		mv.addObject("reservationInfo", reservationInfo);
		mv.setViewName("/ework/m_doingas");
		return mv;
	}
	
	@RequestMapping("/DoingAS")
	public ModelAndView doingAS(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		//HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_id", session.getAttribute("e_id"));//map안에 s_num이 있음
		map.put("r_id", session.getAttribute("r_id"));
		EDoingASVO reservationInfo = eworkservice.doingAS(map);
		System.out.println("reservationInfo : "+ reservationInfo);
		//System.out.println("check1 : " + session.getAttribute("e_id") );
		//System.out.println("check2 : " + session.getAttribute("r_id") );
		mv.addObject("reservationInfo", reservationInfo);
		mv.setViewName("/ework/m_doingas");
		return mv;
		
	}
	
	@RequestMapping("/SearchFreeOrNot")
	@ResponseBody
	public HashMap<String, Object> SearchFreeOrNot(@RequestParam HashMap<String, Object> map){
		List<EWorkVO> SearchFreeOrNot = eworkservice.SearchFreeOrNot(map);
		HashMap<String, Object> hashmap = new HashMap();
		hashmap.put("fin_gbn",map.get("fin_gbn"));
		System.out.println("SearchFreeOrNot : " + SearchFreeOrNot);
		return hashmap;
	}
	
	@RequestMapping("/GetPartsList")
	@ResponseBody
	public List<String> getPartsList(@RequestParam HashMap<String, Object> map){
		List<String> partsList = eworkservice.getPartsList(map);
		//System.out.println("partsList : " + partsList);
		return partsList;
	}
	
	
	@RequestMapping("/apitest")
	public String apitest() {
		return "/ework/apitest";
		
	}
	
	@RequestMapping(value="/FinishService", method=RequestMethod.POST)
	public String finishService(HttpSession session, @RequestParam HashMap<String, Object> map) {
		System.out.println("FinishService map : " + map);
		map.put("e_id", session.getAttribute("e_id"));
		eworkservice.finishService(map);
		session.removeAttribute("r_id");
		
		return "/ework/m_finish";
	}
}
