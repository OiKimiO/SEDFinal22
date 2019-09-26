<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){

	$('select[name=month]').click(function(){
		$.ajax({
			url  :'/Reserve/MonthFind'
			,type :'post'
			,dataType : 'json'
			,success  : function(data){				
				console.log(data);
					var current_month = $('select[name=month]').val();
					$('#selectMonthDiv').html('');	
					$('#selectMonthDiv').append('<select name = "month"  id = "monthSelect" class ="timeClass" ></select> 월');	
					$('select[name=month]').append('<option value='+data.current_date+'>' + data.this_month + '</option>');	
					$('select[name=month]').append('<option value='+data.next_month_day+'>' + data.next_month + '</option>');

					$(function(){
						$(document).on('mouseout','select[name=month]',function(){
							$.ajax({
								url   :'/Reserve/DayFind'
								,type :'post'
								,data : {
									this_month   : $('select[name=month]').val() 
									,r_id        : '${MReserve.r_id}'
								}
								,dataType : 'json'
								,success  : function(data){
									console.log(data);						
									$('#selectDayDiv').html('<select name = "day"  id = "monthSelect" class ="timeClass" ></select>일');
									for (var i = 0; i < data.length; i++) {
										$('select[name=day]').append('<option value='+data[i].day+'>' + data[i].day.substr(6,2) + '</option>');	
									}	
									$('#fdateDiv').html('<input type="hidden" name="f_date" />');
									$('input[name=f_date]').val($('select[name=day]').val());
						
							$(function(){
								$(document).on('mouseout','select[name=day]',function(){
								$.ajax({
									url   :'/Reserve/TimeFind'
									,type :'post' 
									,data : {
										current_date     : $('select[name=day]').val() 
										,r_id        : '${MReserve.r_id}'
									}
									,dataType : 'json'
									,success  : function(data){
										console.log(data);					
										$('#selectClockDiv').html('');	
										$('#selectClockDiv').html('<select name = "clock"  id = "monthSelect" class ="timeClass" ></select>시');
										for (var i = 0; i < data.length; i++) {
											$('select[name=clock]').append('<option value='+data[i].chk_date+'>' + data[i].chk_date.substr(0,2) + '</option>');	
										}	
										$('input[name=f_date]').val($('select[name=day]').val());							
										$('#ftimeDiv').html('<input type="hidden" name="f_time" />');
										$('input[name=f_time]').val($('select[name=clock]').val());
										
											$(function(){
												$(document).on('mouseout','select[name=clock]',function(){
												$.ajax({
													url   :'/Reserve/EnginSearch'
													,type :'post' 
													,data : {
														current_date     : $('select[name=day]').val() 
														,chk_date        : $('select[name=clock]').val() 
														,r_id        	 : '${MReserve.r_id}'
													}
													,dataType : 'json'
													,success  : function(data){
														console.log(data);					
														$('#selectEnginDiv').html('');	
														$('#selectEnginDiv').html('<select name = "selectengin"  id="selectEngin" class ="timeClass" ></select>');
														for (var i = 0; i < data.length; i++) {
															$('select[name=selectengin]').append('<option value='+data[i].e_id+'>' + data[i].e_name + '</option>');	
															
														}
														$('#eidDiv').html('<input type="hidden" name="e_id" />');
														$('input[name=e_id]').val($('select[name=selectengin]').val());								
														$('input[name=f_time]').val($('select[name=clock]').val());
														
														$(function(){
															$(document).on('click','select[name = "selectengin"]',function(){
																$('input[name=e_id]').val($('select[name=selectengin]').val());
															})
														})
													}
													,error : function(xhr){
														alert(xhr.status + ":" +xhr.statusText)
													}
												})
												})
											})// function end time
										
										}
									,error : function(xhr){
										alert(xhr.status + ":" +xhr.statusText)
									}
								})								
							})	
							}) // function end clock										
						}
						,error : function(xhr){
							alert(xhr.status + ":" +xhr.statusText)
						}
						})
					})
				})//function end day
			}
			,error : function(xhr){
				alert(xhr.status + ":" +xhr.statusText)
			}
		})
	})
})




$(function(){
	$('input[name=rs_note_input]').blur(function(){
		console.log('오오키');
		$('input[name=rs_note]').val($('input[name=rs_note_input]').val());
	});
	
	$('input#homeBtn').click(function(){
		location.href="/Reserve/Management?nowpage=1&pagegrpnum=1"
	});
	
	 $('#reserveBtn').on('click',function(){
			
			if($('input[name=f_date]').val() == ''){
				alert("서비스 예약 일시를 제대로 입력해주세요!");
				$('#frm').attr('onsubmit','event.preventDefault();');
				}else{ 
					if($('input[name=f_time]').val() == ''){
						alert("서비스 예약 일시를 제대로 입력해주세요!");
						$('#frm').attr('onsubmit','event.preventDefault();');
					}else{
						if($('input[name=e_id]').val() == ''){
							alert("서비스 예약 일시를 제대로 입력해주세요!");
							$('#frm').attr('onsubmit','event.preventDefault();');
						}
					}
				}
	
			return true;
	 })
	
})
</script>

<title>관리자 예약확인</title>
<style>
/* 웹 폰트 */
     @font-face {
         font-family: 'GoyangIlsan';
         src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff") format('woff');
         font-weight: normal;
         font-style: normal;
            }
      /*default*/
     * {
                padding: 0;
                margin: 0;
                box-sizing:border-box;
                text-decoration: none;
                list-style: none;
                color: #282c37;
                font-family: 'GoyangIlsan';
            }
	 /* Mdiv */
	#wrap{width : 1024px; }
 	 /* body */
 	body{margin : 0px; padding : 0px;}
	
	 /* header */
	#header{height:100px; background-color : #2b90d9; text-align : center; line-height:100px;  }
	#underHeader{height : 20px; background-color : #d9e1e8;}
	h2{margin : 0 ;}
	
	/*nav ul */
	nav{float: left;}
	ul{ list-style-type: none;  width : 200px; background-color : #9baec8; padding : 0; margin : 0; }
	ul#navbar li{ height: 50px; font-size : 15px; line-height : 50px; text-align : center; font-size : 18px; border: 1px solid #282c37;    }
	.classA{text-decoration : none;}
	
	/* section */
	section{width :calc(100% - 230px); height : 500px; margin-left : 230px;}
	#managerIdDiv{border:1px solid #9baec8; width : 80%; margin : 0 auto; text-align : center; height : 50px; margin-top : 80px; background-color :#2b90d9; }
	
	/*yearSelect, monthSelect*/
	select{width : 60px; }
	select#fin_gbn{width : 80px;}
	
	/* RidHeader */
	#RidTitle{width : 80%; height :3%; margin : 0 auto; font-size : 15px;}
	table#RidTable{width : 100%; height : 100%; border : 0px solid black; border-collapse : collapse;}


	
	  /* table */
	  
    .inwrap table {width:97%;border-spacing:0px;}
    table#notice tr th, td {line-height:30px;font-size:13pt; text-align:center; width : 30%; }
	#notice{border:1px solid #282c37; border-bottom : 0;}
	#notice td, th{border-bottom:1px solid #282c37;}
    
    table th {background-color:#eee; width : 20%;}
    table tr td:first-child {font-weight: bold; }
	input[type=submit]{width : 100px; height : 50px;}
 	#BoldNotTd{border-bottom : 0px solid black;}
 	#reserveBtn{width : 100px; height : 50px;}
 	input[name=cancel]{width : 100px; height : 50px;}
 	#cancelReason{width : 80%; height : 50px; font-size : 20px; border:none; text-align :center;}
	#rsNote{width : 80%; height : 50px; font-size : 20px; border:none; text-align :center;}
	.floatDiv{float:left;}
	#homeBtn{width : 100px; height : 50px;}
	#enTiredDiv{ margin : 0 auto; width : 300px;}
	#cancelDiv{float:left;}
	#backbtn{width:100px; height: 50px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	#tlb-paging{margin-left: 80px;}
	.leftDiv{float: left;}
 	.timeClass{width : 38px; }
 	#firstTimeId{width : 35px;}
 	#selectMonthDiv{float:left;}
 	#input[name=year]{width:25px;}
 	#timeId{width : 90%; margin : 0 auto;}
 	#savebtn{width : 30%; margin : 0 auto;}
 	
	#notice tr th:first-child  {text-align: center; width : 15%;}
    #notice tr td:nth-child(2) {font-weight: bold; text-align : center; width : 34%;}
    #notice tr th:nth-child(3) {text-align : center; width:15%; }
    #notice tr td:nth-child(4) {text-align : center; width : 34%;}
    input[name=rs_note_input]{width:100%; height:100%; border : 0px;}
	
	select[name=selectengin]{width:100px; font-weight: lighter;}
	#redId{color : red;}
	.leftDiv{width : 23%;}
	#selectMonthDiv{width : 25%;}
	#selectDayDiv{width : 25%;}
	#selectClockDiv{width : 25%;}
	#yearId{width:33px;}
	
	
	
	
	
	
	
</style>
</head>
<body>
	<div id="wrap">
	<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>
			<div id = "hDiv"><h2>고객 예약 변경</h2></div>				
			<div class="inwrap">		
				<table id ="notice">
					<tr>
						<th>접수 번호</th>
						<td><input type = "text" name = "r_id" value = "${MReserve.r_id}" /></td>
						<th>처리 상태</th>
						<td>-</td>
					</tr>
					<tr>
						<th>접수 일시</th>
						<td colspan="3">-</td>
					</tr>
					<tr>
						<th>서비스 예약 일시</th>
						<td>
							<div id="timeId" >
								<div class = "leftDiv" >
									<input  name = "year"   id = "yearId" class ="timeClass" type = "text" value="2019" readonly/>년 							
								</div>
								<div id ="selectMonthDiv" class = "leftDiv" >
									<select name = "month"  id = "monthSelect" class ="timeClass" >
									</select>월
								</div>
								<div id = "selectDayDiv" class = "leftDiv" >
									<select name = "day"  class ="timeClass" >
									</select>일
								</div>
								<div id = "selectClockDiv" class = "leftDiv" >
									<select name = "clock"  class ="timeClass" >
									</select>시 
								</div>															
							</div> 
						</td>
						<th>서비스 완료 일시</th>
						<td>${MReserve.fin_date}</td>
					</tr>				
					<tr>
						<th>고객명</th>
						<td>${MReserve.m_name}</td>
						<th>고객 아이디</th>
						<td>${MReserve.m_uid}</td>
					</tr>					
					<tr>
						<th>제품명</th>
						<td>${MReserve.p_name}</td>
						<th>SNUM</th>
						<td>${MReserve.s_num}</td>
					</tr>
					<tr>
						<th>구입시기</th>
						<td>${MReserve.pr_date}</td>
						<th>증상</th>
						<td>${MReserve.f_sname}</td>
					</tr>
					<tr>
						<th>전달사항</th>
						<td colspan = "3">${MReserve.r_msg}</td>						
					</tr>
					<tr>
						<th>엔지니어</th>
						<td id ="enginName">
						<div id ="selectEnginDiv" >
							<select name ="selectengin" id="selectEngin">
								<option value="${MReserve.e_id}">${MReserve.e_name}</option>
							</select>
						</div>
						</td>
						<th>소속</th>
						<td>${MReserve.c_name}</td>
					</tr>
					<tr>
						<th>수리 유/무상 구분</th>
						<td>${MReserve.fin_gbn}</td>
						<th>수리 비용</th>
						<td>${MReserve.fin_pri}</td>
					<tr/>
					<tr>	
						<th>수리 내역</th>
						<td colspan="3">${MReserve.fin_msg}</td>
					</tr>					
					<tr>			
						<th>부품 내역</th>
						<td colspan = "3">${MReserve.pa_txt}</td>
					</tr>
				
					<tr>
						<th>비고</th>
						<td colspan="3"><input type = "text" name="rs_note_input"></td>
					</tr>					
				</table>
					<form action="/Reserve/updateM" id="frm" method = "post">
								<input type="hidden"   name = "r_id" 	   	  value ="${MReserve.r_id}" /> 
								<input type="hidden"   name = "m_uid"    	  value ="${MReserve.m_uid}" />								
								<div   id = "fdateDiv">
									<input type="hidden" name = "f_date" />
								</div> 
									<input type = "hidden" name = "day" />
								<div   id = "ftimeDiv">
								</div> 
								<div   id = "eidDiv"><input type ="hidden" name = "e_id" value="${MReserve.e_id}"></div> 
								<input type="hidden" 	 name = "f_sname"     value ="${MReserve.f_sname}" /> 
								<input type="hidden" 	 name = "s_num"       value ="${MReserve.s_num}" /> 
								<input type="hidden" 	 name = "p_name"      value ="${MReserve.p_name}" /> 
								<input type="hidden" 	 name = "fin_gbn"     value ="${MReserve.fin_gbn}" /> 
								<input type="hidden" 	 name = "pa_txt"      value ="${MReserve.pa_txt}" /> 
								<input type="hidden" 	 name = "fin_pri"     value ="${MReserve.fin_pri}" /> 
								<input type="hidden" 	 name = "fin_msg"     value ="${MReserve.fin_msg}" /> 
								<div id="noteDiv">
									<input type="hidden" 	 name = "rs_note"     value ="${MReserve.rs_note}" /> 
								</div>
								<input type="hidden"  name = "pagegrpnum"  value ="1" /> 
								<input type="hidden"  name = "nowpage"     value ="1" /> 									
								<div id ="savebtn">
									<input type ="submit" id = "reserveBtn"   value = "저장하기" />	
									<input type ="button" id = "homeBtn"      value = "홈으로" />																								
								</div>
							
							</form>	
			</div>
		</section>
</div>
</body>
</html>