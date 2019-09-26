package com.pkfinal.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.login.service.LoginService;
import com.pkfinal.main.members.vo.MembersVo;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	// 회원로그인 FORM
	@RequestMapping("/Members/Login")
	public ModelAndView login(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/mem_login");
		return mv;
	}
	
	// 회원로그아웃
	@RequestMapping("/Members/Logout")
	public ModelAndView logout(@RequestParam HashMap<String, Object> map, HttpSession session) {
		
		if(session.getAttribute("loginMember") != null) {
			session.removeAttribute("loginMember");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	// 회원로그인액션
	@RequestMapping("/Members/LoginAction")
	public ModelAndView loginAction(@RequestParam HashMap<String, Object> map, HttpSession session) {
		
		if(session.getAttribute("loginMember") != null) {
			session.removeAttribute("loginMember");
		}
		
		ModelAndView mv = new ModelAndView();
		
		map.put("m_gbn", "GBN02");
		
		MembersVo member = loginService.loginAction(map);
		
		if(member == null) {
			mv.setViewName("redirect:/Members/Login");
		} else {
			session.setAttribute("loginMember", member);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}

	// 관리자로그인 FORM
	@RequestMapping("/Admin/Login")
	public ModelAndView loginAdmin(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/admin_login");
		return mv;
	}
	
	// 관리자 로그아웃
	@RequestMapping("/Admin/Logout")
	public ModelAndView logoutAdmin(@RequestParam HashMap<String, Object> map, HttpSession session) {
		
		if(session.getAttribute("loginMember") != null) {
			session.removeAttribute("loginMember");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	//관리자로그인액션
	@RequestMapping("/Admin/LoginAction")
	public ModelAndView loginActionAdmin(@RequestParam HashMap<String, Object> map, HttpSession session) {
		
		if(session.getAttribute("loginMember") != null) {
			session.removeAttribute("loginMember");
		}
		
		ModelAndView mv = new ModelAndView();
		
		map.put("m_gbn", "GBN01");
		
		MembersVo member = loginService.loginAction(map);
		
		if(member == null) {
			mv.setViewName("redirect:/Admin/Login");
		} else {
			session.setAttribute("loginMember", member);
			mv.setViewName("admin_index");
		}
		
		return mv;
	}
	
	
	
	// 아이디/패스워드 찾기 페이지 이동
	@RequestMapping("/login/find/personalData")
	public ModelAndView findPersonalData() {
		ModelAndView mv= new ModelAndView();
		
		mv.setViewName("login/find/personalData");
		return mv;
	}
	
	
	// 아이디 찾기 결과페이지이동
	@RequestMapping("/login/find/findid")
	public ModelAndView findId(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv  = new ModelAndView();
		String       url = "";
		boolean findIdCheck = loginService.findId(map); // 아이디 이미 존재: true, 아이디 없음: false
		if (findIdCheck) {
			List<MembersVo> pList = (List<MembersVo>) map.get("result");
			MembersVo       pVo   = pList.get(0);
			
			mv.addObject("m_uid", pVo.getM_uid());
			url = "login/find/findidResult";
			mv.setViewName(url);
			return mv;
		} else {
			String msg = "조회된 계정이 없습니다.";
			mv.addObject("msg", msg);
			url = "login/find/alert";
			mv.setViewName(url);
		}
		return mv;
	}
	
	
	// 패스워드 찾기 결과페이지이동
		@RequestMapping("/login/find/findpw")
		public ModelAndView findPw(@RequestParam HashMap<String, Object> map) {
			ModelAndView mv  = new ModelAndView();
			String       url = "";

			boolean findIdCheck = loginService.findpwd(map);
			if (findIdCheck) {
				// 계정 조회 후 결과가 있다면
				List<MembersVo> pList = (List<MembersVo>) map.get("result");
				MembersVo       pVo   = pList.get(0);
				
				mv.addObject("m_pwd", pVo.getM_pwd());
				url = "login/find/findpwdResult";
				mv.setViewName(url);
				return mv;
			} else {
				// 계정 조회 후 결과가 없다면
				String msg = "조회된 계정이 없습니다.";
				mv.addObject("msg", msg);
				url = "login/find/alert";
				mv.setViewName(url);
			}
			return mv;
		}
		
	/*
	 * // 패스워드 변경페이지
	 * 
	 * @RequestMapping("/login/find/findpw/changepw")
	 * 
	 * @ResponseBody public boolean changePwd(@RequestParam HashMap<String, Object>
	 * map, HttpServletRequest request,HttpServletResponse response) throws
	 * IOException { boolean changeCheck = loginService.changePwd(map); return
	 * changeCheck; }
	 */
	
}