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
public class EUserParkingRestController {
	
	
	@RequestMapping(value = "/GetParkingMap", method=RequestMethod.GET, headers="Accept=application/json")
	public Map<String, Object> getParkingMap(@RequestParam HashMap<String, Object> map) throws ServletException, IOException{
		
		String urlStr = "http://api.data.go.kr/openapi/prkplce-info-std";

		
		String queryParams = "?serviceKey=DDnxuvSmiwLNBihAagYgEWgoSIS5u5fUc9K8py220ZIOpsYRmQJatTfTtPEG68wfhsmsGDCCBbq4oUCoGYxCDw%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=100"
				+ "&institutionNm=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C%20%ED%95%B4%EC%9A%B4%EB%8C%80%EA%B5%AC"
				//+ "&parkingchrgeInfo=%EC%9C%A0%EB%A3%8C"
				//+ "&prkplceSe=%EA%B3%B5%EC%98%81"
				+ "&type=json";
		
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
	
	@RequestMapping(value = "/GetParkingFree", method=RequestMethod.GET, headers="Accept=application/json")
	public Map<String, Object> getParkingFree(@RequestParam HashMap<String, Object> map) throws ServletException, IOException{
		String sfree = String.valueOf(map.get("sfree"));
		String spub = String.valueOf(map.get("spub"));
		System.out.println("sssss"+sfree);
		String fe = URLEncoder.encode(sfree, "UTF-8");
		String pu = URLEncoder.encode(spub, "UTF-8");
		
		String urlStr = "http://api.data.go.kr/openapi/prkplce-info-std";
		String queryParams = "?serviceKey=DDnxuvSmiwLNBihAagYgEWgoSIS5u5fUc9K8py220ZIOpsYRmQJatTfTtPEG68wfhsmsGDCCBbq4oUCoGYxCDw%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=100"
				+ "&institutionNm=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C%20%ED%95%B4%EC%9A%B4%EB%8C%80%EA%B5%AC"
				+ "&parkingchrgeInfo=" + fe
				+ "&prkplceSe=" + pu
				+ "&type=json";
		
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
