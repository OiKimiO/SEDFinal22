package com.pknufinal.engineer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknufinal.euser.service.EUserService;
import com.pknufinal.euser.vo.EUserVO;


@Controller
public class EUserController {

	@Autowired
	private EUserService euserservice;
	
	@RequestMapping(value="/E_Login", method=RequestMethod.POST)
	public ModelAndView e_login(HttpSession session, @RequestParam HashMap<String, Object> map) {

		EUserVO userInfo = euserservice.e_login(map);
		
		ModelAndView mv = new ModelAndView(); 
		if(userInfo != null) {
			mv.setViewName("m_main");
			session.setAttribute("e_id", userInfo.getE_id());
			session.setAttribute("e_name", userInfo.getE_name());			
		} else {
			mv.setViewName("m_index");
			mv.addObject("msg", "Id 혹은 패스워드가 유효하지 않습니다.");
		}
		return mv;
		
	}
	
	@RequestMapping("/E_MyPage")
	public ModelAndView e_mypage(HttpSession session, @RequestParam HashMap<String, Object> map) {
	    map.put("e_id", session.getAttribute("e_id"));
		EUserVO userInfo = euserservice.e_view(map);	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("kList", userInfo);
		mv.setViewName("kisa/m_kisapage");
		
		return mv;
	}

	@RequestMapping("/Update_image")
	public ModelAndView e_mypage_update(@RequestParam HashMap<String, Object> map, HttpServletRequest request) {
		
		
		Set pathSet = request.getSession().getServletContext().getResourcePaths("/");

		System.out.println("여기 어디?? : " + pathSet);
		euserservice.imgUpdate(map,request);
		
		EUserVO userInfo = euserservice.e_view(map);	
		ModelAndView mv = new ModelAndView();
		System.out.println("Update_image : " + userInfo);
		mv.addObject("kList", userInfo);
		mv.setViewName("kisa/m_kisapage");
		
		return mv;
	}
	
	@RequestMapping("/E_UpdateView")
	public ModelAndView e_updateview(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("e_updateview : "+ map);
		EUserVO userInfo = euserservice.e_view(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("kList", userInfo);
		mv.setViewName("kisa/m_kisaupdate");
		
		return mv;
	}
	

	@RequestMapping("/E_Update")
	public ModelAndView e_update(@RequestParam HashMap<String, Object> map) {
		String pwd = (String) map.get("e_pwd");
		String pwd2 = (String) map.get("e_pwd2");
		String pwd3 = (String) map.get("e_pwd3");
		
		String url = "";
		
		EUserVO userInfo = euserservice.e_view(map);
		
		if((pwd.equals(userInfo.getE_pwd())) && (pwd2.equals(pwd3)) ) {
			euserservice.e_update(map);
			url = "kisa/m_kisaupdateComplete";
		}else {
			url = "kisa/m_kisaupdateFalse";
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName(url);
		
		return mv;
	}
	
	
	/*@RequestMapping("/MyPage")
	public ModelAndView viewMyPage(HttpSession session,@RequestParam HashMap<String, Object> map) {
		String e_id = (String) session.getAttribute("e_id");
		EUserVO userInfo = euserservice.e_viewMyPage(e_id);
		System.out.println("userInfo : " + userInfo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/euser/m_mypage"); 
		mv.addObject("userInfo", userInfo);
		return mv; 
	}*/
	
	/*@RequestMapping("/Test")
	public String test(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		
		return "test";
		
	}*/
	
}
