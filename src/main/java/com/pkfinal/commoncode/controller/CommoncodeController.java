package com.pkfinal.commoncode.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pkfinal.commoncode.service.CommoncodeService;
import com.pkfinal.commoncode.vo.CommoncodeVo;
import com.pkfinal.engineer.vo.EngineerVo;

@Controller
public class CommoncodeController {
	@Autowired
	private CommoncodeService commoncodeService;
	
	
	// 시간 선택
	@ResponseBody
	@RequestMapping(value="/CommonCodeChoice", method=RequestMethod.GET, headers="Accept=application/json")
	public HashMap<String, Object> commonCodeChoice(@RequestParam HashMap<String, Object> map) {
		
		List<CommoncodeVo> dateList = commoncodeService.getDate(map);
		
	
		System.out.println("dateList:" + dateList);
		System.out.println("map:" + map);
		
		return map;
	}
	

	// 기사 선택
	@ResponseBody
	@RequestMapping(value="/EngineerChoice", method=RequestMethod.GET, headers="Accept=application/json")
	public HashMap<String, Object> engineerChoice(@RequestParam HashMap<String, Object> map) {
		
		List<EngineerVo> eList = commoncodeService.getEngineer(map);
		
	
		System.out.println("eList:" + eList);
		System.out.println("map:" + map);
		
		return map;
	}
	
	
	
}












