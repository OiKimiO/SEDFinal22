package com.pkfinal.result.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.result.service.ResultService;
import com.pkfinal.result.vo.ResultVo;

@Controller
public class ResultController {
	
	@Autowired
	private ResultService resultService;
	

	@RequestMapping("/Result/List")
	public ModelAndView resultList(@RequestParam HashMap<String, Object> map) {
		if (map.get("nowpage") == null || map.get("nowpage") =="") {
			map.put("nowpage", 1);
			map.put("pagecount", 10);
			map.put("pagegrpnum", 1);
		}
		List<ResultVo> checkArray = resultService.checkArray(map);	// 예약 결과 조회
		ModelAndView mv = new ModelAndView();
		System.out.println("e_count ::: "+map.get("e_count"));
		if(map.get("e_count").equals("0")) {
			mv.setViewName("result/totallist");
		}else {
			if(map.get("m_count").equals("0")) {
				mv.setViewName("result/totallist");
			}else {
				List<ResultVo> resultList = resultService.getList(map);	//QnA 조회
				ResultVo pageResultVo = (ResultVo) map.get("pageResultVo");
				System.out.println("result 페이징 하기 " + pageResultVo);
				System.out.println("resultList 페이징 하기 " + resultList);				
				mv.addObject("r_result", map.get("r_result"));
				mv.addObject("resultList",   resultList);
				mv.addObject("pageResultVo", pageResultVo);
				mv.addObject("page", "/Result/List");
				mv.addObject("nowpage",    map.get("nowpage"));
				mv.addObject("pagegrpnum", map.get("pagegrpnum"));
				System.out.println("ResultVo : "+mv);
				mv.setViewName("result/totallist");
			}
			
		}
	
		
		return mv;
	}
	
	@RequestMapping("/Result/Eng")
	public ModelAndView resultEng(@RequestParam HashMap<String,Object> map) {
		if (map.get("nowpage") == null || map.get("nowpage") =="") {
			map.put("nowpage", 1);
			map.put("pagecount", 10);
			map.put("pagegrpnum", 1);
		}
		ModelAndView mv = new ModelAndView();
		
		
		List<ResultVo> checkArray = resultService.checkArray(map);	// 예약 결과 조회
		System.out.println("e_count ::: "+map.get("e_count"));
		int e_count = (int) map.get("e_count");
		if(e_count == 0) {
			mv.setViewName("result/engineerlist");
		}else {
			List<ResultVo> resultList = resultService.geteng(map);	//QnA 조회
			ResultVo pageResultVo = (ResultVo) map.get("pageResultVo");
			if(resultList.size()==0) {
				System.out.println("ResultVo : "+mv);
				mv.addObject("msg", "검색결과가 없습니다!");
				mv.setViewName("result/memberlist");
			}else {
				mv.addObject("resultList",   resultList);
				mv.addObject("pageResultVo", pageResultVo);
				ResultVo vo = resultList.get(0);
				mv.addObject("e_name", vo.getE_name());
				
				mv.addObject("page", "/Result/Eng");
				mv.addObject("nowpage",    map.get("nowpage"));
				mv.addObject("pagegrpnum", map.get("pagegrpnum"));
				System.out.println("ResultVo : "+mv);
				mv.setViewName("result/engineerlist");
			}
		}
		
		
		
		
		
		
		
		
		
		return mv;
	}
	
	@RequestMapping("/Result/Date")
	public ModelAndView resultDate(@RequestParam HashMap<String,Object> map) {
		if (map.get("nowpage") == null || map.get("nowpage") =="") {
			map.put("nowpage", 1);
			map.put("pagecount", 10);
			map.put("pagegrpnum", 1);
		}
		List<ResultVo> resultList = resultService.getdate(map);	//QnA 조회
		ResultVo pageResultVo = (ResultVo) map.get("pageResultVo");
		
		ModelAndView mv = new ModelAndView();
		
			if(resultList.size()==0) {
				System.out.println("ResultVo : "+mv);
				mv.addObject("msg", "검색결과가 없습니다!");
				mv.setViewName("result/datelist");
			}else {
				mv.addObject("resultList",   resultList);
				mv.addObject("pageResultVo", pageResultVo);
				ResultVo vo = resultList.get(0);
				mv.addObject("start_date", map.get("start_date"));
				mv.addObject("final_date", map.get("final_date"));
				mv.addObject("page", "/Result/Date");
				mv.addObject("nowpage",    map.get("nowpage"));
				mv.addObject("pagegrpnum", map.get("pagegrpnum"));
				System.out.println("ResultVo : "+mv);
				mv.setViewName("result/datelist");
		
			}
		
		
		
		
		
		
		return mv;
	}
	@RequestMapping("/Result/Cli")
	public ModelAndView resultCli(@RequestParam HashMap<String,Object> map) {
		if (map.get("nowpage") == null || map.get("nowpage") =="") {
			map.put("nowpage", 1);
			map.put("pagecount", 10);
			map.put("pagegrpnum", 1);
		}
		System.out.println("화악인! : " + map);
		
		ModelAndView mv = new ModelAndView();
		List<ResultVo> checkArray = resultService.checkArray(map);	// 예약 결과 조회
		
		int m_count = (int) map.get("m_count");
		System.out.println("1111111111111"+map.get("m_count"));
		if( m_count == 0) {
			mv.setViewName("result/memberlist");
		} else {
			List<ResultVo> resultList = resultService.getcli(map);	
			ResultVo pageResultVo = (ResultVo) map.get("pageResultVo");
			if(resultList.size()==0) {
				mv.addObject("msg", "검색결과가 없습니다!");
				System.out.println("ResultVo : "+mv);
				mv.setViewName("result/memberlist");
			}else {
				ResultVo vo = resultList.get(0);
				
				mv.addObject("resultList",   resultList);
				mv.addObject("pageResultVo", pageResultVo);
				mv.addObject("m_name", vo.getM_name());
				mv.addObject("page", "/Result/Cli");
				mv.addObject("nowpage",    map.get("nowpage"));
				mv.addObject("pagegrpnum", map.get("pagegrpnum"));
				System.out.println("ResultVo : "+mv);
				mv.setViewName("result/memberlist");
			}
		}
		
		
		
		
		return mv;
	}
}
