package com.pkfinal.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.service.pkService;
import com.pkfinal.vo.pkVo;

@Controller
public class MainController {
	
	@Autowired
	private pkService pkService;
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/Map")
	public String map() {
		return "map";
	}
	
	@RequestMapping("/Reservations")
	public String reservations() {
		return "reservation";
	}
	
	@RequestMapping("/bupum")
	public String bupum() {
		return "bupum";
	}
	
	@RequestMapping("/selectMenuButton")
	@ResponseBody
	public List<pkVo> selectMenuButton(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		List<pkVo> selectMenuButton = pkService.selectMenuButton(map);
		return selectMenuButton;
	}
	
	@RequestMapping("/Mobile/Index")
	public String Index() {
		return "m_index"; 
	}
	
	/*@RequestMapping("/Home")
	public String home() {
		return "index"; 
	}*/
	
	@RequestMapping("/MapTest")
	public ModelAndView mapTest(@RequestParam HashMap<String, Object> map) {
				
		ModelAndView mv = new ModelAndView();

		mv.setViewName("maptest/elecmap");
		
		return mv;
	}
	
	@RequestMapping("/MapTest1")
	public ModelAndView mapTest1(@RequestParam HashMap<String, Object> map) {
				
		ModelAndView mv = new ModelAndView();

		mv.setViewName("maptest/parkingmap");
		
		return mv;
	}
	
	
	@RequestMapping("/EngineerMain")
	public String engineerMain(HttpSession session) {
		session.removeAttribute("r_id");
		return "m_main";
	}
}
