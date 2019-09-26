package com.pkfinal.mng.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pkfinal.eng.vo.EngVo;
import com.pkfinal.mng.service.MNGService;
import com.pkfinal.mng.vo.DateVo;
import com.pkfinal.mng.vo.MNGVo;


@Controller
public class MNGController {
	@Autowired
	private MNGService MngService;
	
	@RequestMapping("/Reserve/Management")
	public ModelAndView Management(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		List<MNGVo> selectManagement = MngService.selectManagement(map);
		System.out.println("aㅁㄹㄴㅇㄹㅇㄴㄹ : " + map);
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		mv.addObject("m_uid"," ");
		mv.addObject("r_id", "R");
		String page = "/Reserve/Management";
		mv.addObject("page", page);
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		mv.addObject("pagePdsVo",pagePdsVo);
		mv.addObject("ReserveList", selectManagement);
		mv.setViewName("reserve/management");
		
		return mv;
	}
	
	@RequestMapping("/Reserve/CheckId")
	@ResponseBody
	public List<MNGVo> CheckId(@RequestParam HashMap<String, Object> map) {		
		List<MNGVo> selectManagementId = MngService.selectManagementId(map);
		System.out.println(selectManagementId);
		return selectManagementId;
	}
	
	@RequestMapping("/Reserve/Checkmng")
	@ResponseBody
	public List<MNGVo> checkMng(@RequestParam HashMap<String, Object> map) {		
		List<MNGVo> checkMng = MngService.checkMng(map);
		System.out.println(checkMng);
		return checkMng;
	}
	
	
	@RequestMapping("/Reserve/Management/Id")
	public ModelAndView ManagementId(@RequestParam HashMap<String, Object> map) {
		System.out.println("ReserveId : " + map);
		ModelAndView mv = new ModelAndView();
		List<MNGVo> selectManagementId = MngService.selectManagementId(map);
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		List<MNGVo> checkMng = MngService.checkMng(map);
		int m_count = (int) map.get("m_count");
		if(m_count == 0) {
			mv.addObject("msg", "옳바르게 검색해주세요");
		    List<MNGVo> selectManagement = MngService.selectManagement(map);
			mv.setViewName("reserve/management");
		}else {
			if(selectManagementId.size()==0) {
				mv.addObject("msg", "옳바르게 검색해주세요");
				List<MNGVo> selectManagement = MngService.selectManagement(map);
				mv.setViewName("reserve/management");
			}else {
				MNGVo vo = selectManagementId.get(0);

				mv.addObject("r_id", " ");
				mv.addObject("m_uid", vo.getM_uid());
					
				String page = "/Reserve/Management/Id";
				mv.addObject("page", page);
				mv.addObject("map", map);
				mv.addObject("nowpage",    map.get("nowpage"));
				mv.addObject("pagegrpnum", map.get("pagegrpnum"));
				mv.addObject("pagePdsVo",pagePdsVo);
				mv.addObject("ReserveList", selectManagementId);
				mv.setViewName("reserve/dmanagement");
			}
		}
		

		return mv;
	}
	
	@RequestMapping("/Reserve/Management/RId")
	public ModelAndView ManagementRId(@RequestParam HashMap<String, Object> map) {
		System.out.println("ReserveId : " + map);
		ModelAndView mv = new ModelAndView();
		List<MNGVo> selectManagementId = MngService.selectManagementId(map);
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		
		List<MNGVo> checkMng = MngService.checkMng(map);
		int r_count = (int) map.get("e_count");
		if(r_count == 0) {
			System.out.println("여기는 1번");
			mv.addObject("msg", "옳바르게 검색해주세요");
			List<MNGVo> selectManagement = MngService.selectManagement(map);
			mv.setViewName("reserve/management");
		}else {
			MNGVo vo = selectManagementId.get(0);
			if(selectManagementId.size()==0) {
				System.out.println("여기는 2번");
				mv.addObject("msg", "옳바르게 검색해주세요");
				mv.setViewName("reserve/management");
			}else {
				System.out.println("여기는 3번");
			mv.addObject("r_id",vo.getR_id());
			mv.addObject("m_uid", " ");
			
			String page = "/Reserve/Management/RId";
			mv.addObject("page", page);
			mv.addObject("map", map);
			mv.addObject("nowpage",    map.get("nowpage"));
			mv.addObject("pagegrpnum", map.get("pagegrpnum"));
			mv.addObject("pagePdsVo",pagePdsVo);
			mv.addObject("ReserveList", selectManagementId);
			mv.setViewName("reserve/dmanagement");
			}
			
		}
		return mv;
		
	}
	
	@RequestMapping("/Reserve/DetailManagement")
	public ModelAndView DetailManagement(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("DetailManagement : " + map);
		List<MNGVo> detailSelectManagement = MngService.detailSelectManagement(map);
		List<MNGVo> MaxRSid = MngService.MaxRSid(map);
		System.out.println("MaxRSid : "+ MaxRSid);
		mv.addObject("MaxRSid",MaxRSid.get(0));
		
		
		List<MNGVo> RidSelect = MngService.RidSelect(map);	
		MNGVo MReserve = detailSelectManagement.get(0);
		MNGVo vo = RidSelect.get(0);
		mv.addObject("RidSelect", vo);
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		mv.addObject("rs_id_max", map.get("r_id_count"));
		mv.addObject("r_id_count", map.get("r_id_count"));
		mv.addObject("MReserve", MReserve);
		mv.setViewName("reserve/detailmanagement");
		
		return mv;
	}
	
	@RequestMapping("/Reserve/CancelManagement")
	public ModelAndView CancelManagement(@RequestParam HashMap<String, Object> map) {		
		ModelAndView mv = new ModelAndView();
		System.out.println("cancel controller : " + map);
		MngService.cancelManagement(map);
		List<MNGVo> selectManagementId = MngService.selectManagementId(map);
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		MNGVo vo = selectManagementId.get(0);
		System.out.println("r_id : " + map.get("r_id"));
		System.out.println("m_uid :" + map.get("m_uid"));
		System.out.println("빨리 끝내고 쉬구싶다아아 ㅠㅜ : " + map);
		HashMap<String,Object> mapper = new HashMap();
		mapper.put("r_id", map.get("r_id"));
		mapper.put("m_uid", map.get("m_uid"));
			if(map.get("m_uid").equals("") && map.get("r_id").equals("")) {
				mv.addObject("m_uid", map.get(" "));
				mv.addObject("r_id", map.get("R"));
				}else {
					if(map.get("m_uid").equals(vo.getM_uid()) && map.get("r_id").equals("")) {
						mv.addObject("m_uid", vo.getM_uid());
						mv.addObject("r_id", map.get("R"));
					}else {
						if(map.get("m_uid").equals("") && map.get("r_id").equals(vo.getR_id())) {
							mv.addObject("m_uid", map.get(" "));
							mv.addObject("r_id" , vo.getR_id());
						} else {
								mv.addObject("m_uid", vo.getM_uid());
								mv.addObject("r_id" , vo.getR_id());
						}// else3
					}// else2
				}// else1					
		mv.addObject("map", map);
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		mv.addObject("pagePdsVo",pagePdsVo);
		mv.addObject("ReserveList", selectManagementId);
		mv.setViewName("reserve/dmanagement");				
		return mv;
	}

	@RequestMapping("/Reserve/ReReserve")
	public ModelAndView ReReserve(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<MNGVo> detailSelectManagement = MngService.detailSelectManagement(map);
		MNGVo MReserve = detailSelectManagement.get(0);
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		mv.addObject("r_id_max", map.get("r_id_max"));
		System.out.println("뜨냐"+ map);
		mv.addObject("MReserve", MReserve);
		mv.setViewName("reserve/rereserve");
		return mv;
	}
	
	@RequestMapping("/Reserve/CreateReserve")
	public ModelAndView CreateReserve(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println("CreateReserve : "+map);
	
		MngService.insertManagement(map);
		List<MNGVo> selectManagement = MngService.selectManagement(map);		
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		mv.addObject("m_uid"," ");
		mv.addObject("r_id", "R");
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		mv.addObject("pagePdsVo",pagePdsVo);
		mv.addObject("ReserveList", selectManagement);
		mv.setViewName("reserve/management");
		
		
		return mv;
	}
	
	@RequestMapping("/Reserve/updateManagement")
	public ModelAndView updateManagement(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<MNGVo> detailSelectManagement = MngService.detailSelectManagement(map);
		MNGVo MReserve = detailSelectManagement.get(0);
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		System.out.println("업데이트 확인 : "+ MReserve);
		mv.addObject("MReserve", MReserve);
		mv.setViewName("reserve/updatereserve");
		return mv;
	}
	
	@RequestMapping("/Reserve/updateM")
	public ModelAndView updateM(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println("updateM : "+map);
		MngService.updateManagement(map);
		List<MNGVo> selectManagement = MngService.selectManagement(map);		
		EngVo pagePdsVo = (EngVo) map.get("pagePdsVo");  
		mv.addObject("m_uid"," ");
		mv.addObject("r_id", "R");
		mv.addObject("nowpage",    map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		mv.addObject("pagePdsVo",pagePdsVo);
		mv.addObject("ReserveList", selectManagement);
		mv.setViewName("reserve/management");
		
		
		return mv;
	}
	
	@RequestMapping("/Reserve/MonthFind")
	@ResponseBody
	public DateVo YearFind(@RequestParam HashMap<String, Object> map) {		
		List<DateVo> MonthFind = MngService.MonthFind(map);	
		DateVo MonthVo = MonthFind.get(0);
		return MonthVo;
	}	
	
	@RequestMapping("/Reserve/DayFind")
	@ResponseBody
	public List DayFind(@RequestParam HashMap<String, Object> map) {		
		System.out.println("DayFind controller : " + map);
		List DayFind = MngService.DayFind(map);	
		return DayFind;
	}
	
	@RequestMapping("/Reserve/TimeFind")
	@ResponseBody
	public List TimeFind(@RequestParam HashMap<String, Object> map) {		
		System.out.println("DayFind controller : " + map);
		List DayFind = MngService.ProcessedDayFind(map);	
		return DayFind;
	}
	
	@RequestMapping("/Reserve/EnginSearch")
	@ResponseBody
	public List<MNGVo> EnginSearch(@RequestParam HashMap<String, Object> map) {
		List<MNGVo> EnginSearch = MngService.EnginSearch(map);
		return EnginSearch;
	}
}
