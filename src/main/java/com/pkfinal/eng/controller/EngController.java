package com.pkfinal.eng.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.eng.service.EngService;
import com.pkfinal.eng.vo.EngVo;
import com.pkfinal.vo.pkVo;


@Controller
public class EngController {
 
	@Autowired
	private EngService EngService;
	
	@RequestMapping("/EInsert")
	public ModelAndView EInsert(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<EngVo> selectCenter = EngService.selectCenter();
		List<EngVo> selectCate = EngService.selectCate();
		mv.addObject("selectCenter", selectCenter);
		mv.addObject("selectCate", selectCate);
		mv.setViewName("/engineer/einsert");
		return mv; 
	}
	
	@RequestMapping("/EInsertProcess")
	public ModelAndView EInsertProcess(@RequestParam HashMap<String, Object> map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("EInsertProcess :"+map);
		EngService.insertEngineer(map, request);
		HashMap<String,Object> mapper = new HashMap();
		mapper.put("c_id","C");
		mapper.put("cate_id","C");
		mapper.put("nowpage", 1);
		mapper.put("pagecount", 1);
		mapper.put("pagegrpnum", 1);
		 List<EngVo> selectEngineer = EngService.selectEngineer(mapper); 
		 List<EngVo> selectCenter = EngService.selectCenter();
		 List<EngVo> selectCate = EngService.selectCate();
		 EngVo pagePdsVo = (EngVo) mapper.get("pagePdsVo");  
			
		 EngVo vo = selectEngineer.get(0);
		 System.out.println("야 그럼 vo는 뭐가 나오는데?" + vo);
		 System.out.println("pagePdsVo : "+ pagePdsVo);
		 mv.addObject("c_id", "C");
		 mv.addObject("cate_id", "C");
			
			
		 mv.addObject("pagePdsVo", pagePdsVo); 
		 mv.addObject("selectCenter" ,  selectCenter);
		 mv.addObject("selectCate" ,  selectCate);
			
		 mv.addObject("kList",selectEngineer);
		 mv.setViewName("/engineer/eselect");

		 return mv;
	}
	
	@RequestMapping("/Engineering")
	public ModelAndView ESelect(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println("Engineer111 : "  + map);
	    List<EngVo> selectEngineer = EngService.selectEngineer(map); 
	    List<EngVo> selectCenter = EngService.selectCenter();
		List<EngVo> selectCate = EngService.selectCate();
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		
		EngVo vo = selectEngineer.get(0);
		mv.addObject("VoGubun", vo);
		System.out.println("야 그럼 vo는 뭐가 나오는데?" + vo);

		mv.addObject("c_id", map.get("c_id"));
		mv.addObject("cate_id", map.get("cate_id"));
		
		System.out.println(map.get("c_id"));
		System.out.println(map.get("cate_id"));
		
		mv.addObject("pagePdsVo", pagePdsVo); 
		mv.addObject("selectCenter" ,  selectCenter);
		mv.addObject("selectCate" ,  selectCate);
		
	    mv.addObject("kList",selectEngineer);
		mv.setViewName("/engineer/eselect");
		return mv;
	}
	
	
	@RequestMapping("/DetailEngineering")
	public ModelAndView DetailESelect(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println("detailEng : "  + map);
	
		List<EngVo> DselectEngineer = EngService.detailselectEngineer(map);
		List<EngVo> selectCenter = EngService.selectCenter();
		List<EngVo> selectCate = EngService.selectCate();	
		
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		System.out.println("우아아아 : " + DselectEngineer);
		HashMap<String,Object> mapper = new HashMap();
		
		if(DselectEngineer.size() == 0) {
			mv.addObject("c_id", map.get("c_id"));
			mv.addObject("cate_id", map.get("cate_id"));
		} else {
			if(map.get("cate_id").equals("C")) {
				mv.addObject("c_id", map.get("c_id"));
				mv.addObject("cate_id", map.get("cate_id"));
			} else {
				if(map.get("c_id").equals("C")) {
					EngVo vo = DselectEngineer.get(0);
					mv.addObject("c_id", map.get("c_id"));
					mv.addObject("cate_id", vo.getCate_id());
				} else {
					EngVo vo = DselectEngineer.get(0);
					mv.addObject("c_id", vo.getC_id());
					mv.addObject("cate_id", vo.getCate_id());
				}// else3 end
			}// else2 end
		}// else1 end

		mv.addObject("pagePdsVo",pagePdsVo); 
		mv.addObject("selectCenter", selectCenter);
		mv.addObject("selectCate", selectCate);
		mv.addObject("kList",DselectEngineer);
		mv.setViewName("/engineer/detaileselect");
		return mv;
	}
	
	@RequestMapping("/EUpdate")
	public ModelAndView EUpdate(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<EngVo> idSelectEngineer = EngService.idSelectEngineer(map);
		EngVo vo = idSelectEngineer.get(0);
		System.out.println("수우우우우정"+map);
		
		List<EngVo> selectCenter = EngService.selectCenter();
		List<EngVo> selectCate = EngService.selectCate();
		mv.addObject("c_id", vo.getC_id());
		mv.addObject("cate_id", vo.getCate_id());
		mv.addObject("selectCenter", selectCenter);
		mv.addObject("selectCate", selectCate);
		mv.addObject("kList", vo);
		mv.setViewName("engineer/eupdate");
		return mv;
	}
	
	@RequestMapping("/EUpdateProcess")
	public ModelAndView EUpdateProcess(@RequestParam HashMap<String, Object> map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("EUpdateProcess :" + map);
		EngService.UpdateEngineer(map,request);
		HashMap<String,Object> mapper = new HashMap();
		mapper.put("c_id",map.get("c_id"));
		mapper.put("cate_id",map.get("cate_id"));
		mapper.put("nowpage", map.get("nowpage"));
		mapper.put("pagecount", map.get("pagecount"));
		mapper.put("pagegrpnum", map.get("pagegrpnum"));
		List<EngVo> selectEngineer = EngService.selectEngineer(mapper); 
		 List<EngVo> selectCenter = EngService.selectCenter();
		 List<EngVo> selectCate = EngService.selectCate();
		 EngVo pagePdsVo = (EngVo) mapper.get("pagePdsVo");  
			
		 EngVo vo = selectEngineer.get(0);
		 mv.addObject("VoGubun", vo);
		 System.out.println("야 그럼 vo는 뭐가 나오는데?" + vo);

		 mv.addObject("c_id", mapper.get("c_id"));
		 mv.addObject("cate_id", mapper.get("cate_id"));
			
		 System.out.println(map.get("c_id"));
		 System.out.println(map.get("cate_id"));
			
		 mv.addObject("pagePdsVo", pagePdsVo); 
		 mv.addObject("selectCenter" ,  selectCenter);
		 mv.addObject("selectCate" ,  selectCate);
			
		 mv.addObject("kList",selectEngineer);
		 mv.setViewName("/engineer/eselect");
		
		return mv;
	}
	

	
	@RequestMapping("/EDelete")
	public ModelAndView EDelete(@RequestParam HashMap<String, Object> map) {
		System.out.println("삭제하는 건데 그만하구 싶다.. : "  + map);
		ModelAndView mv = new ModelAndView();
		EngService.deleteEngineer(map);

		
		
		List<EngVo> DselectEngineer = EngService.detailselectEngineer(map);
		List<EngVo> selectCenter = EngService.selectCenter();
		List<EngVo> selectCate = EngService.selectCate();
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		
		EngVo vo = DselectEngineer.get(0);
		System.out.println(map.get("cate_id"));
		if(map.get("cate_id").equals("C")) {
			mv.addObject("c_id", map.get("c_id"));
			mv.addObject("cate_id", map.get("cate_id"));
		} else {
			if(map.get("c_id").equals("C")) {
				mv.addObject("c_id", map.get("c_id"));
				mv.addObject("cate_id", vo.getCate_id());
			} else {
				mv.addObject("c_id", vo.getC_id());
				mv.addObject("cate_id", vo.getCate_id());
			}
		}
		
		mv.addObject("pagePdsVo",pagePdsVo); 
		mv.addObject("selectCenter", selectCenter);
		mv.addObject("selectCate", selectCate);
		mv.addObject("kList",DselectEngineer);
		mv.setViewName("/engineer/detaileselect");
		
		return mv;    
	} 
 
	
	
}
