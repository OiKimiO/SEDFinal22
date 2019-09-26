package com.pkfinal.reservation.controller;

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
import com.pkfinal.reservation.service.ReservationService;
import com.pkfinal.reservation.vo.AppResultVo;
import com.spring.appoint.vo.AppointVo;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private LoginService loginService;
	
	
	
	@RequestMapping("/Reservation/RWriteForm")
	public ModelAndView rWriteFrom(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("reservation/reservation");
		mv.addObject("reservationVo", map);
		
		
		return mv;
	}
	
	@RequestMapping("/Reservation/RWrite")
	public ModelAndView rWrite(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		System.out.println("map" + map);
		reservationService.write(map);
		mv.addObject("reservationVo", map);
		
		return mv;
	}
	
	//예약확인
	//->interceptor로 로그인 창으로 간다음에 들어가게 해야 함
	//->그렇지 않으면 null 나옴
	@RequestMapping("/Reservation/Check")
	public ModelAndView Mypage(@RequestParam HashMap<String, Object> map, HttpSession session)
	{
		
		
		ModelAndView mv = new ModelAndView();
		MembersVo login=(MembersVo)session.getAttribute("loginMember");
		System.out.println("예약확인"+ login);
		map.put("m_id", login.getM_id());
		
		List<AppointVo>mylist = reservationService.empMypage(map);		
		mv.addObject("lists", mylist);
		mv.addObject("pagePdsVo", map.get("pagePdsVo"));
				
		String page="/Reservation/Check";
		mv.addObject("page",page);		
		mv.setViewName("reservation/check");
		return mv;
	}
	
	//예약확인 ->제품명으로 검색했을 떄 화면 
		@RequestMapping("/Reservation/Check/Pname")
		public ModelAndView MypagePname(@RequestParam HashMap<String, Object> map, HttpSession session)
		{		
			ModelAndView mv = new ModelAndView();
			MembersVo login=(MembersVo)session.getAttribute("loginMember");
			map.put("m_id", login.getM_id());		
		
			List<AppointVo>mylist = reservationService.mypagePname(map);
			
			String result=(String)map.get("p_name");
			if(result!=null) {
				mv.addObject("result","제품명:"+result);			
				int result2=(int) map.get("totalcount");
				mv.addObject("result2","검색결과:"+result2+"건");
			}

			if((int) map.get("totalcount")==0) {
				String result2="검색결과가 없습니다";
				mv.addObject("result2",result2);
			}

			mv.addObject("lists", mylist);
			mv.addObject("pagePdsVo", map.get("pagePdsVo"));
			
			String page="/Reservation/Check/Pname";
			mv.addObject("page",page);	
			
			mv.setViewName("reservation/check");
			return mv;
		}


		//예약확인->예약 번호로 검색했을 떄 화면
		@RequestMapping("/Reservation/Check/Rid")
		public ModelAndView MypageRid(@RequestParam HashMap<String, Object> map, HttpSession session)
		{		
			ModelAndView mv = new ModelAndView();
			MembersVo login=(MembersVo)session.getAttribute("loginMember");
			map.put("m_id", login.getM_id());
		
			List<AppointVo>mylist = reservationService.mypageRid(map);
			
			String result=(String)map.get("r_id");
			
			if(result!=null) {
				mv.addObject("result","예약번호:"+result);
				int result2=(int) map.get("totalcount");
				mv.addObject("result2","검색결과:"+result2+"건");
			}

			if((int) map.get("totalcount")==0) {
				String result2="검색결과가 없습니다";
				mv.addObject("result2",result2);
			}
					
			mv.addObject("lists", mylist);
			mv.addObject("pagePdsVo", map.get("pagePdsVo"));
			
			String page="/Reservation/Check/Rid";
			mv.addObject("page",page);	
			
			mv.setViewName("reservation/check");
			return mv;
		}
		
		
		
		//예약확인->카테고리로 검색했을 떄 화면
			@RequestMapping("/Reservation/Check/CateName")
			public ModelAndView MypageCateName(@RequestParam HashMap<String, Object> map, HttpSession session)
			{		
				ModelAndView mv = new ModelAndView();
				MembersVo login=(MembersVo)session.getAttribute("loginMember");
				map.put("m_id", login.getM_id());
			
				List<AppointVo>mylist = reservationService.mypageCateName(map);
				
				String result=(String)map.get("cate_name");
				if(result!=null) {
					mv.addObject("result","카테고리:"+result);
					int result2=(int) map.get("totalcount");
					mv.addObject("result2","검색결과:"+result2+"건");
				}

				if((int) map.get("totalcount")==0) {
					String result2="검색결과가 없습니다";
					mv.addObject("result2",result2);
				}
				
				String page="/Reservation/Check/CateName";
			
				mv.addObject("page",page);	
				
				mv.addObject("lists", mylist);
				mv.addObject("pagePdsVo", map.get("pagePdsVo"));
				mv.setViewName("reservation/check");
				return mv;
			}
			
			
			
			//처리상태가 예약완료/예약취소일 경우 Mapping
			@RequestMapping("/Reservation/Check/AppDetail")
			public ModelAndView checkapp(@RequestParam HashMap<String, Object>map,HttpSession session)
			{
				ModelAndView mv=new ModelAndView();		
				MembersVo login=(MembersVo)session.getAttribute("loginMember");	
				
				map.put("m_id", login.getM_id());				
				//회원 정보 뽑아낼 떄 사용
				List<MembersVo>detailList=loginService.empDetail(map);
				//결과 정보 뽑아낼 때 사용
				List<AppResultVo>list=reservationService.empAppResult(map);
				int r_id_count = Integer.valueOf(String.valueOf(map.get("r_id_count")));
				AppResultVo vo=list.get(0);
				mv.addObject("r_result",vo.getR_result());
				mv.addObject("AppResult",list);	
				mv.addObject("r_id_count",r_id_count);
				mv.addObject("memDetail",detailList);
				mv.setViewName("reservation/appdetail");						
				return mv;
			}
			
	

 

			@RequestMapping("/Reservation/Check/Appdetail/Cancel")
			@ResponseBody
			public void appdetailCancel(@RequestParam HashMap<String, Object> map, HttpServletRequest request,HttpServletResponse response) throws IOException  {
				reservationService.AppDetailCancel(map);
				System.out.println("1211231"+ map);
			}

			



			//처리상태가 방문완료일 경우 Mapping
			@RequestMapping("/Reservation/Check/Detail")
			public ModelAndView detail(@RequestParam HashMap<String, Object>map,HttpSession session)
			{

				ModelAndView mv=new ModelAndView();		
				MembersVo login=(MembersVo)session.getAttribute("loginMember");		
				map.put("m_id", login.getM_id());				

				//회원 정보 뽑아낼 떄 사용
				List<MembersVo>detailList=loginService.empDetail(map);

				//결과 정보 뽑아낼 때 사용
				List<AppResultVo>list=reservationService.empAppResult(map);		
				System.out.println("확인하고 싶은 값 : "+ list);
				mv.addObject("AppResult",list);		
				mv.addObject("memDetail",detailList);
				mv.setViewName("reservation/detail");						
				return mv;
			}
}
