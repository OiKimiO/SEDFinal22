package com.pknufinal.engineer.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class EUserRestController {
	
	@RequestMapping(value = "/GetMap", method=RequestMethod.GET, headers="Accept=application/json")
	public Map<String, Object> getElecMap(@RequestParam HashMap<String, Object> map) throws ServletException, IOException{
		//System.out.println("getElecMap!!!!!여기왔다.!!!");
		String urlStr = "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList";
		String queryParams = "?serviceKey=HKVWRRTzWcmJJsshpNZdZ6HHmS9Lm3dOCRiblTrvOjpCZFnxgUkzV3XS5EQhAayMheNF3Y3rKome7ixuh9bKVA%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=100"
				+ "&addr=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C"
				+ "&_type=json";
		
		BufferedReader br = null;
		URL url = new URL(urlStr + queryParams);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		String json = "";
		String line = "";

		while((line = br.readLine()) != null) {
			json += line + "\n";
		}
		System.out.println(json);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2 = mapper.readValue(json, Map.class);

		return map2;
	}
	
	@RequestMapping(value = "/GetGu", method=RequestMethod.GET, headers="Accept=application/json")
	public Map<String, Object> getGuMap(@RequestParam HashMap<String, Object> map) throws ServletException, IOException{
		//System.out.println("getElecMap!!!!!여기왔다.!!!");
		String gu = String.valueOf(map.get("gu"));
		String addr = "부산광역시 " + gu;
		String addr2 = URLEncoder.encode(addr, "UTF-8");
		
		String urlStr = "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList";
		String queryParams = "?serviceKey=HKVWRRTzWcmJJsshpNZdZ6HHmS9Lm3dOCRiblTrvOjpCZFnxgUkzV3XS5EQhAayMheNF3Y3rKome7ixuh9bKVA%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=100"
				+ "&addr=" + addr2
				+ "&_type=json";
		
		BufferedReader br = null;
		URL url = new URL(urlStr + queryParams);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		String json = "";
		String line = "";

		while((line = br.readLine()) != null) {
			json += line + "\n";
		}
		System.out.println(json);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2 = mapper.readValue(json, Map.class);

		return map2;
	}
	
}
