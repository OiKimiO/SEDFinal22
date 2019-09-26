package com.pkfinal.main.members.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.main.centers.service.CentersService;
import com.pkfinal.main.members.service.MembersService;
import com.pkfinal.main.members.vo.MembersVo;

@Controller
public class MembersController {
	@Autowired
	private MembersService membersService;
	@Autowired
	private CentersService centersService;
	

	
	// 회원가입
	@RequestMapping("/Members/JoinForm")
	public ModelAndView joinForm(MembersVo membersVo) {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("member/join");
		mv.addObject("membersVo", membersVo);
		
		return mv;
	}
	
	@RequestMapping("/Members/Join")
	public ModelAndView join(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		
		membersService.join(map);
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/IdDupCheck", method=RequestMethod.GET, headers="Accept=application/json")
	public HashMap<String, Object> idDupCheck(@RequestParam HashMap<String, Object> map) {
		
		map = membersService.idDupCheck(map);
		
		return map;
	}

	// 근처 센터 찾기
	@ResponseBody
	@RequestMapping(value="/NearCenter", method=RequestMethod.GET, headers="Accept=application/json")
	public HashMap<String, Object> nearCenter(@RequestParam HashMap<String, Object> map) {

		map = centersService.nearCenter(map);

		return map;
	}
	
	
	// 회원정보 수정
	@RequestMapping("/UMember/MUpdateForm")
	public ModelAndView mUpdateForm(MembersVo membersVo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		MembersVo loginMember = (MembersVo) session.getAttribute("loginMember");
		mv.setViewName("member/editprofile");
		mv.addObject("loginMember", loginMember);
		System.out.println("변경확인" + loginMember);
		
		
		return mv;
	}
	
	@RequestMapping("/Member/MUpdate")
	public ModelAndView mUpdate(@RequestParam HashMap<String, Object> map, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		membersService.mUpdate(map);
		
		mv.addObject("m_id", map.get("m_id"));
		System.out.println("변경확인 후" + map);
		
		
		mv.setViewName("redirect:/Members/Login");
		session.removeAttribute("loginMember");
		return mv;
	}


	
	
}












