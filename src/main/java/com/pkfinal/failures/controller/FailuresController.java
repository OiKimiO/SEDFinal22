package com.pkfinal.failures.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pkfinal.failures.service.FailuresService;
import com.pkfinal.failures.vo.FailuresVo;

@Controller
public class FailuresController {
	@Autowired
	private FailuresService failuresService;
	
	
	// 제품 이상증세 대분류
	@ResponseBody
	@RequestMapping(value="/FailuresLNameChoice", method=RequestMethod.GET, headers="Accept=application/json")
	public HashMap<String, Object> failuresLNameChoice(@RequestParam HashMap<String, Object> map) {
		
		List<FailuresVo> failLList = failuresService.getfLList(map);
		
	
		System.out.println("failLList:" + failLList);
		System.out.println("map:" + map);
		
		return map;
	}
	
	// 제품 이상증세 소분류
	@ResponseBody
	@RequestMapping(value="/FailuresSNameChoice", method=RequestMethod.GET, headers="Accept=application/json")
	public HashMap<String, Object> failuresSNameChoice(@RequestParam HashMap<String, Object> map) {
		
		List<FailuresVo> failSList = failuresService.getfSList(map);
		System.out.println("failSList:" + failSList);
		
		return map;
	}


	
	
	
	
}












