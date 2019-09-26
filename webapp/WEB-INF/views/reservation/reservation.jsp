<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>예약하기</title>
<link rel="stylesheet" href="/css/common.css" >
<style>
	.product {
		width: 100%;
		border-spacing: 0px;
	}
	
	.product th, td {
		line-height: 50px;
		font-size: 13pt;
		border-bottom: 1px solid black;
	}
	
	.product th {
		border-bottom: 2px solid black;
		background-color: #eee;
	}
	
	.product tr td {
		text-align: center
	}
	
	.agreed {
		border-bottom: none;
		background-color: #eee;
	}
	
	.agreed th {
		border-bottom: none;
	}
	
	#lgubun tr td {
		border: 1px solid black;
		text-align: center
	}
	
	/*  */
	
	ul.lfail {
		list-style: none;
		margin: 0px;
		padding: 0px;
		max-width: 900px;
		width: 50%;
	}
	
	ul.lfail li. {
		display: inline-block;
		padding: 10px;
		margin-bottom: 5px;
		border: 1px solid #BFBFBF;
		font-size: 20px;
		cursor: pointer;
		max-width: 20xp;	
	}
	
	ul.sfail li. {
		font-size: 10px;
		padding: 0px;
		margin: 0px;
		cursor: pointer;
	}
	
	.fchoice {
		display: inline;
		width: 99%;
		
	}
	
	.fail{
		display:inline-bolck; 
		float:left; 
		width: 49.5%;
		border:1px solid black;
		height:400px;
	}
	
	.days{
		display:inline-bolck; 
		float:left; 
		width: 33%;
		border:1px solid black;
		height:100%;
	}
	
	ul.rtime {
		list-style: none;
		margin: 0px;
		padding: 0px;
		max-width: 900px;
		width: 99%;
		height:100%;
	}
	
	ul.rtime li {
		display: inline-block;
		padding: 10px;
		margin-bottom: 5px;
		border: 1px solid #BFBFBF;
		font-size: 20px;
		cursor: pointer;
		width: 99%;	
	}

</style>

<style>
	ul.mylist{
		list-style: none;
		margin: 0px;
		padding: 0px;
		max-width: 1200px;
		width: 100%;
		height:100%;
	}
	  
	ul.mylist li {
		display: inline-block;
		padding: 10px;
		margin-bottom: 5px;
		border: 1px solid #808080;
		font-size: 12px;
		cursor: pointer;
		width:30%;
		height:20%;
	}
	
	.selected { background:#808080; }

	
</style>

  <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 
<!-- 카테고리 클릭시 대분류 표시 -->
<script>
	$(function(){
		$(".cateBtn1").on('click', function(e){
			e.preventDefault();
			e.stopPropagation();

			/* alert($(this).val()); */
	        //alert($('div.selectDiv input[type=text]').eq(0).val());
			$.ajax({
				url			: '/FailuresLNameChoice',
				type		: 'GET',
				data     	: {cate_name : $(this).val() },
				dataType	: 'json',
				success		: function(data){
				
					$('.mylist').empty();    
					console.log(data.failLList);
					$.each(data.failLList, function(index, v){
						console.log(v);
						var str = '';	
						str += '<li>';
						str += '<input type="text" id="cateBtn2"  class="lcss" name="f_lname" value="'+v.f_lname+'" style="border:none;text-align:center;width:100%;height:50px;cursor: pointer;" readonly />'
						str += '</li>';					
						$('.mylist').append(str);
						
					});
				}
			});
		});
	});
</script>


<!-- 대분류 클릭시 소분류 표시 -->
<script>
	$(function(){
		var click = true;
		$(document).on('click',"#cateBtn2", function(e){
			
			e.preventDefault();
			e.stopPropagation();
			$.ajax({
				url			: '/FailuresSNameChoice',
				type		: 'GET',
				data     	: {f_lname : $(this).val() },
				dataType	: 'json',
				success		: function(data){
					console.log(data.failSList);
					$('.sfail').empty();
					$.each(data.failSList, function(index, a){
						console.log(a);
						
						var strs = '';
						
						strs += '<li>';
						strs += '<input type="hidden" name="f_sname" id="fid" value="' + a.cate_id + '" style="border:none;text-align:center;width:100%;cursor:pointer;" readonly />'
						strs += '<input type="text" name="f_sname" id="fid" value="' + a.f_sname + '" style="border:none;text-align:center;width:50%;cursor:pointer;" readonly />'
						strs += '<input type="hidden" name="f_sname" id="fid" value="' + a.f_id + '" style="border:none;text-align:center;width:100%;cursor:pointer;" readonly />'
						strs += '</li>';					
						
						$('.sfail').append(strs);
						
						$(document).ready(function () {
				            $("li").each(function () {
				                $(this).click(function () {
				                    $(this).addClass("selected");                 //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				                    $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
				                });
				            });
				        });
						
						$(function(){
								$(document).on('click',"#fid", function(e){
									/* alert($(this).prev().val()); */
									/* alert($(this).next().val()); */
									var value = $('#cate_id').val($(this).prev().val());
									var value = $('#f_id').val($(this).next().val());
								});
						});
						
					
						
					});
				}
			});
		});
	});
</script>

<!-- 달력(날짜) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
	.ui-datepicker { width:100%;}
</style>
<script>
 	$( function() {
  
   		$( "#datepicker" ).datepicker({ 
   	
		   	//showOn: "both", 
		   	dateFormat: 'yymmdd',
		   	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
		   	maxDate: "+2M", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
		   	minDate: 1, 
		   	beforeShowDay: noSundays,
		   	showMonthAfterYear: true,
		   	onSelect : function(e){
		   		
		   		var fdate = $('#f_date').val(e);
   		
	   			// alert($(this).val());
	   			/* 시간 선택 */
	   			$.ajax({
	   				url			: '/CommonCodeChoice',
	   				type		: 'GET',
	   				data     	: {f_date : $(this).val() },
	   				dataType	: 'json',
	   				success		: function(data){
	   					$('.times').empty();
	   					
	   					console.log(data);
	   					

	   				   
	   					if(data.dateList.length < 1){
	   						var str1 = '';	
   							str1 += '<li>';
   							str1 += '<input type="text"  value="선택할수 있는 시간이 없습니다." style="border:none;text-align:center;width:100%;" readonly />'
   							str1 += '</li>';					
   							$('.times').append(str1);
	   					} else {
	   						
  							$.each(data.dateList, function(index, v){
  								
	   							var str2 = '';	
	   							str2 += '<li>';
	   							str2 += '<input type="hidden" name="com_val"  value="'+v.com_id+'" style="border:none;text-align:center;width:100%;cursor:pointer;" readonly />'
	   							str2 += '<input type="text" name="com_val" id="timecc" value="'+v.com_val+'" style="border:none;text-align:center;width:50%;cursor:pointer;" readonly />'
	   							str2 += '</li>';					
	   							$('.times').append(str2);
	   							
	   							$(function(){
									$(document).on('click',"#timecc", function(e){
										var ftime = $('#f_time').val($(this).prev().val());
									});
								});
  								
	   							/* 기사선택 */
	   							$(function(){
	   								$(document).on('click',"#timecc", function(e){
	   										console.log($(this).val() );
	   										console.log(data.f_date);
	   										
	   									
	   										e.preventDefault();
	   										e.stopPropagation();
	   										$.ajax({
	   											url			: '/EngineerChoice',
	   											type		: 'GET',
	   											data     	: {com_val : $(this).val(), f_date : data.f_date, c_id : $('[name=c_id]').val(), cate_id : $('[name=cate_id]').val()}, 
	   											dataType	: 'json',
	   											success		: function(data){
	   												console.log(data.eList);
	   												$('.engi').empty();
	   												$.each(data.eList, function(index, g){
	   													console.log(g);
	   													
	   													var strs = '';
	   													
	   													strs += '<li>';
	   													strs += '<input type="hidden" name="e_name" value="' + g.e_id + '" style="border:none;text-align:center;width:100%;cursor:pointer;" readonly />'
	   													strs += '<input type="text"   id="ename" name="e_name" value="' + g.e_name + '" style="border:none;text-align:center;width:50%;height:40px;cursor:pointer;" readonly/>'
	   													strs += '<input type="hidden" name="e_name" value="' + g.e_img + '" style="border:none;text-align:center;width:100%;cursor:pointer;" readonly />'
	   													strs += '</li>';		
	   											
	   													$('.engi').append(strs);
	   													
	   													$(document).ready(function () {
	   											            $("li").each(function () {
	   											                $(this).click(function () {
	   											                    $(this).addClass("selected");                 //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
	   											                    $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
	   											                });
	   											            });
	   											        });
	   													
	   													
	   													$(function(){
	   														$('#e_img').empty();
	   														$(document).on('click',"#ename", function(e){
	   															/* alert($(this).prev().val()); */
	   															/* alert($(this).next().val()); */
	   															var eid = $('#e_id').val($(this).prev().val());
	   															var eimg = $('#e_img').attr("src", '/image/' + $(this).next().val());
	   														});
	   													});
	   													
	   													$(function(){
	   														$(document).on('click',"#ename", function(e){
	   															/* alert($(this).prev().val()); */
	   															/* alert($(this).next().val()); */
	   															var eid = $('#e_id').val($(this).prev().val());
	   														});
	   													});

	   												});
	   											}
	   										});
	   									});
	   							}); // 기사선택 END
	   							
	   						}); // $.each
	   					}
					} // success
	   			}); //$.ajax
	   			/* 시간 선택 END */
   		
		   		
			} // function(e) end
   		}); //.datepicker end
 	});  // function() end
	
	function noSundays(date) {
	 return [date.getDay() != 0, ''];
	}
	
</script>


</head>
<body>
	<div id="wrap">
	<%@ include file="/WEB-INF/include/cheader.jspf" %>
	<section>
		<div id="intro-notice" class="intros">
	    	<p style="background-image:url(/img/intro-reservation.png);background-size:100%"></p>
	    </div>
	    
	   
	
	    <!-- 예약 table -->
	    <form action="/Reservation/RWrite"  method="POST">
		    <div class="inwrap">
		     
		    <table class="product" >
		    	<tr>
		    		<td>
		    			<div>
		    				<table  class="agreed" style="width:99%">
		    					<tr>
		    						<th>개인정보 수집 및 이용 동의(필수)</th>
		    					</tr>
		    					<tr>
		    						<td><textarea rows="8" cols="100" style="resize: none;" readonly="readonly"
		    							placeholder="1. 개인정보의 수집 항목
	LG전자 주식회사(이하 '회사'라 합니다)는 비회원의 서비스 이용을 위해 아래와 같은 개인정보를 수집하고 있습니다
	1) 필수 : 이름, 휴대전화번호, 주소
	※ 서비스 예약 후 제품 서비스 시 : 모델명, 제조번호
	- 스마트 가전 : LG전자 스마트 제품 정보/상태/사용이력, 스마트 진단 정보, 에너지 정보, 제품 F/W 및 S/W 정보, 사용자 콘텐츠, 스마트폰 어플리케이션 사용 정보, 원격 동작 이력 등
	- 스마트 폰 : 휴대전화 상태 (모델명, S/W Ver, IMEI, 시리얼넘버, IMSI, 전원상태, 배터리상태, CPU/RAM 사용률, H/W 자가진단 결과, 평균 사용시간), 네트워크 상태 (서비스 상태(Call, Data), 신호세기, 기지국 정보, 통화 횟수/시간), 애플리케이션 정보 (설치, 삭제된 앱 List, 앱 버전, 최근 실행 앱, 앱 사용 횟수/통계), 휴대전화 연결 상태 (WIFI, 블루트스, GPS, Ear-jack, 충전기, USB, SD Card 연결상태), 오류 정보 (멈춤/꺼짐(Lockup),통화끊김(Call drop), 어플리케이션 오류(Fatal, Exception))
	- 스마트 TV 로그 다운로드 시 : 통합로그 (TV 설정정보(디바이스ID, IP Address, Mac Address, Platform 정보), App 설치 이력 및 실행이력, 사용이력, Today, 간편설정, 설정메뉴, 사용자 매뉴얼 등), Crash 로그 (에러발생원인/위치/시간, 시스템 부팅 메시지, 운영체제(OS)관련정보 등),
	단, 서비스 기사 방문을 통한 USB 다운로드 : 스마트TV 로그에 限함
	2) 선택 : 전달사항
	
	 
	
	2. 개인정보 이용목적
	“회사” 는 수집한 개인정보를 아래와 같은 목적을 위해 활용합니다.
	가. 서비스 제공을 위한 정보 활용: A/S, 및 서비스 예약 (전문가 전화상담예약, 원격서비스 예약, 출장서비스, 서비스센터 방문예약, 이전설치 서비스, 이메일 문의), 온라인 상담 (전문가 전화상담, 원격서비스, 이전설치 서비스 상담, 고객의 소리, 이메일 문의 답변 등), 고객의 소리 (칭찬합니다. 개선해주세요), 만족도 조사(서비스 및 자재 판매 관련), 이전 서비스 이력 관리, 서비스 이용에 따른 본인 확인, 콘텐츠 제공, 개인 식별, 부정 이용 방지와 비인가 사용 방지, 혜택 제공 및 안내, 분쟁 조정을 위한 기록 보존, 불만 민원 처리, 고지사항 전달의 목적으로 사용, 통계정보 등을 이용한 제품서비스 분석, 제품/서비스 개선 및 신제품/서비스 개발 등
	나. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금 정산: 콘텐츠 제공, 물품 배송 또는 청구서 발송, 구매 및 결제, A/S서비스 접수 및 결제 시 활용
	다. 마케팅 및 광고에 활용: 신규 서비스 개발, 인구 통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 서비스 이용에 대한 통계, 이벤트 경품 배송, 고객 지향적 이벤트와 광고성 정보 전달
	※ 온라인 이벤트 및 이벤트와 광고성 정보 전달 진행 시 이벤트 유형에 따라 수집되는 이름, 연락처, 주소 등에 대한 개인정보의 수집 항목, 수집 목적, 보유 기간을 별도 고지하여 동의를 받습니다.
	※ 회사는 익명 처리된 고객들의 개인정보를 집계한 후, 통계자료를 만들어 이용성향 분석을 위해 사용할 수 있습니다.
	
	 
	
	3. 개인정보의 보유 및 이용기간
	“회사”는 아래와 같이 필요한 기간 동안 동의 받은 “이용자”의 개인정보를 이용 보관함을 원칙으로 합니다. 또한 해당 보유 기간이 도래하면 해당 정보를 지체 없이 파기 합니다.
	* 개인정보 외 A/S 및 상담 내용, 스마트 가전 기기 정보, 로그 정보 중 일부 등은 통계 및 서비스 개선 목적으로 개인을 식별할 수 없는 형태로 보관 될 수 있습니다.
	- 콜센터 및 홈페이지A/S 접수 / 상담 시 수집된 개인정보 : 5년
	- A/S 이용, 제품 교환/환불, 홈페이지 소모품 구매 시 수집된 개인정보: 5년
	- 홈페이지 이메일 문의, 고객의 소리 이용 시 수집된 개인정보 : 3년
	다만 상법, 국세기본법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. 이 경우 회사는 보관하는 개인정보를 그 보관의 목적으로만 이용하며 보존 기간 및 보존 항목은 아래와 같습니다.
	- 계약 또는 청약철회 등에 관한 기록: 5 년(전자상거래 등에서의 소비자보호에 관한 법률)
	- 대금 결제 및 재화 등의 공급에 관한 기록: 5년(전자상거래 등에서의 소비자보호에 관한 법률)
	- 소비자 불만 또는 분쟁 처리에 관한 기록: 3년(전자상거래 등에서의 소비자보호에 관한 법률)
	- 납세 증거에 관한 기록 : 5년 (국세 기본법)
	- 전표 또는 이와 유사한 서류에 포함된 개인정보: 5년(상법)
	- 통신사실확인자료 제공 시 “이용자” 확인에 필요한 성명, 전화번호 등: 12개월(통신비밀보호법)
	- “회사”와 고객 간에 민원, 소송 등 분쟁이 발생한 경우에 그 보유기간 내에 분쟁이 해결되지 않을 경우: 그 분쟁이 해결될 때까지
	
	 
	
	4. 동의 거부권 및 미동의에 대한 불이익 안내
	고객님께서는 정보주체로서 개인정보 동의 거부권이 있으시며, 미동의 시 A/S 서비스 신청 및 이용에 제약이 있을 수 있습니다.
	
	 
	
	5. 이용 제한 대상
	14세 미만은 서비스 신청 및 소모품 구매 등을 이용하실 수 없습니다."></textarea><br/>
		    							<input type="checkbox" id="chk" required/>개인정보 수집 및 이용에 동의합니다.	
		    						</td>
		    					</tr>
		    				</table>
		    			</div>
		    			<br><br>
		    			
		    			<div>
		    				<table style="width:99%">
		    					<tr>
		    						<th colspan="5">제품 선택</th>
		    					</tr>
		    					<tr>
		    						<td>
		    							<div>
		    								<img src="/img/category/refrigerator.png" style="width:150px; height:150px;" />
		    							</div>
		    							<div class="selectDiv">
		    								<input type="text" value="냉장고" style="border:0;font-weight:bold; font-size:30px; width:100%;text-align:center; cursor: pointer;" class="cateBtn1"   readonly/> 
		    							</div>
		    						</td>
		    						<td>
		    							<div>
		    								<img src="/img/category/tv.png"  style="width:150px; height:150px;" />
		    							</div>
		    							<div class="selectDiv">
		    								<input type="text" value="TV" style="border:0;font-weight:bold; font-size:30px; width:100%;text-align:center; cursor: pointer;" class="cateBtn1" readonly/> 
		    							</div>
		    						</td>
		    						<td>
		    							<div>
		    								<img src="/img/category/airconditioner.png"  style="width:150px; height:150px;" />
		    							</div>
		    							<div class="selectDiv">
		    								<input type="text" value="에어컨" style="border:0;font-weight:bold; font-size:30px; width:100%;text-align:center; cursor: pointer;" class="cateBtn1"   readonly/> 
		    							</div>
		    						</td>
		    						<td>
		    							<div>
		    								<img src="/img/category/it.png"  style="width:150px; height:150px;" />
		    							</div>
		    							<div class="selectDiv">
		    								<input type="text" value="컴퓨터" style="border:0;font-weight:bold; font-size:30px; width:100%;text-align:center; cursor: pointer;" class="cateBtn1" readonly/> 
		    							</div>
		    						</td>
		    						
		    					</tr>
		    					
		    					<!-- <tr>
		    						<td>제품명</td>
		    						<td colspan="4">
		    							<input type="text" name="p_id" id="p_id" placeholder="제품명을 모르는 경우 생략가능합니다.(ex.LG노트북 그램)" />
		    							<input type="button" value="검색" />
		    						</td>
		    					</tr> -->
		    				</table>
		    			</div>
		    			<br><br>
		    			
		    			
						<!-- 증상 선택 -->
						<div  class="falichoice" style="width:100%">
							<div style="border-bottom:2px solid black; background-color:#EEEEEE; width:99%;" ><h3>증상선택</h3></div>
							<div class="fail" >
								<ul class="mylist">
							        
						   		</ul>
							</div>
							
							<div  class="fail" >
								<ul class="sfail">
							       
						    	</ul>
							</div>
							
						</div>
		    			<br><br>
		    			
		    			<div>
		    				<table style="width:99%" >
		    					<tr>
		    						<th colspan="2">전달사항</th>
		    					</tr>
		    					<tr>
		    						<td>고장증상 상세</td>
		    						<td ><textarea rows="6" cols="50" style="resize: none;" name="r_msg" placeholder="제품의 증상은 세부적으로 입력해 주시되, 고객님의 주민등록번호, 휴대폰 번호와 같은 개인정보는 입력하지 마시기 바랍니다."></textarea></td>
		    					</tr>
		    				</table>
		    			</div>
		    			<br><br>
		    			
		    			<div id="members">
		    				<input type="hidden" name="m_id" value="${loginMember.m_id}"/>
		    				<input type="hidden" name="c_id" value="${loginMember.c_id}"/>
		    				<table style="width:99%">
		    					<tr>
		    						<th colspan="2">예약자 정보 확인</th>
		    					</tr>
		    					<tr>
		    						<td>이	름</td>
		    						<td>${loginMember.m_name}</td>
		    					</tr>
		    					<tr>
		    						<td>휴대전화</td>
		    						<td>${loginMember.m_tel}</td>
		    					</tr>
		    					<tr>
		    						<td>주소</td>
		    						<td>${loginMember.m_city} ${loginMember.m_gugun} ${loginMember.m_addr}</td>
		    					</tr>
		    				</table>
		    			</div>
		    			<br><br>
		    			
		    			
		    			
		    			<!-- 예약날짜 선택 -->
		    			<div style="width:100%; height:500px;">
				
							<div class="days" id="datepicker" ><h3 style="border-bottom:2px solid black;">날짜 선택</h3>
								
							</div>
							
								
						
							<div class="days"  ><h3 style="border-bottom:2px solid black;">시간 선택</h3>
								<ul class="times">
									<!-- <li>09:00</li> -->
									
								</ul>
	 						
							</div>
							
							<div class="days" ><h3 style="border-bottom:2px solid black;">기사 선택</h3>
								<ul class="engi">
									<!-- <li>기사</li> -->
									
								</ul>
								<div><img src="" id="e_img" /></div>
								
							</div>
					
		    			</div>
		    			<br><br>
		    			
		    			<input type="hidden" name="m_id" value="${loginMember.m_id}"/>
		    			<input type="hidden" name="c_id" value="${loginMember.c_id}"/>
		    			
		    			<input type="hidden" id="cate_id" name="cate_id" value="" />
		    			<input type="hidden" id="f_id" name="f_id" value="" />
		    			
		    		
		    			<input type="hidden" id="f_date" name="f_date" value="" />
		    			
		    			<input type="hidden" id="f_time" name="f_time" value="" />
		    			
		    			<input type="hidden" id="e_id" name="e_id" value="" />
		    			
		    			
		    			<input type="hidden" id="s_num" name="s_num" value="" />
		    			<input type="hidden" id="p_id" name="p_id" value="" />
		    			<input type="hidden" id="fin_gbn" name="fin_gbn" value="" />
		    			<div>
	   						<a href="/"><input type="button" value="취소" style="font-size:30px;border-radius: 5px; padding:10px; background-color:#666666; color:#FFFFFF;"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
	   						<input type="submit"  value="예약" style="font-size:30px;border-radius: 5px; padding:10px; background-color:#A50034; color:#FFFFFF;"/>
		    			</div>
		    			<br><br>
		    		</td>
		    	</tr>
		    </table>
		    </div>
	    </form>
	</section>
	<footer>
	</footer>
	</div>
    

</body>
</html>