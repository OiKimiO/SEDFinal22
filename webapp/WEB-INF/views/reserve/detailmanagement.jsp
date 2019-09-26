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
	
	
	if('${MReserve.r_result}' == '방문완료' && '${MaxRSid.rs_id}' == '${MReserve.rs_id}'){ 
		
		$('#reReserveDiv').html('<form id="RereserveFrm" action="/Reserve/ReReserve" method = "post"></form>');
		$('#RereserveFrm').append('<input type="hidden" 	name = "rs_id"    	  value ="${MReserve.rs_id}" /> ');
		$('#RereserveFrm').append('<input type="hidden" 	name = "m_uid"    	  value ="${MReserve.m_uid}" /> ');
		$('#RereserveFrm').append('<input type="hidden" 	name = "r_id"    	  value ="${MReserve.r_id}" /> ');
		$('#RereserveFrm').append('<div id = "reserveDiv"></div> ');
		$('#reserveDiv').append('<input type ="submit" id = "reserveBtn1" value = "재예약하기" />');
	}else{
		if('${MReserve.r_result}'=='예약완료'&& '${MaxRSid.rs_id}' == '${MReserve.rs_id}'){ 
			 
			
			$('#floatDiv').html('<form action="/Reserve/CancelManagement" id="CancelFrm" method = "post"></form>');
			$('#CancelFrm').append('<input type="hidden" 	name = "r_id" 	   	  value ="${MReserve.r_id}" /> ');
			$('#CancelFrm').append('<input type="hidden" 	name = "rs_id"    	  value ="${MReserve.rs_id}" />  ');
			$('#CancelFrm').append('<input type="hidden" 	name = "m_uid"    	  value ="${MReserve.m_uid}" /> ');
			$('#CancelFrm').append('<input type="hidden" 	name = "rs_note"  	  id="rs_note_input"  />  ');
			$('#CancelFrm').append('<input type="hidden" 	name = "pagegrpnum"   value ="1" />  ');
			$('#CancelFrm').append('<input type="hidden" 	name = "nowpage"      value ="1" /> ');
			$('#CancelFrm').append('<input type="hidden"   	name = "cc_reason"    id="cc_reason" /> ');
			$('#CancelFrm').append('<div id = "cancelDiv"></div>');
			$('#cancelDiv').append('<input type="button" name = "cancel"  value ="예약취소" /> ');
			
			
			$('#backDiv').html('<form id="RereserveFrm" action="/Reserve/ReReserve" method = "post"></form>');
			$('#RereserveFrm').append('<input type="hidden" 	name = "rs_id"    	  value ="${MReserve.rs_id}" /> ');
			$('#RereserveFrm').append('<input type="hidden" 	name = "m_uid"    	  value ="${MReserve.m_uid}" /> ');
			$('#RereserveFrm').append('<input type="hidden" 	name = "r_id"    	  value ="${MReserve.r_id}" /> ');
			$('#RereserveFrm').append('<div id = "reserveDiv"></div> ');
			$('#reserveDiv').append('<input type ="submit" id = "reserveBtn" value = "재예약하기" />');
			
		
			
			$('#updateReserve').html('<form action="/Reserve/updateManagement" id="updateReserveFrm" method = "post"></form>');
			$('#updateReserveFrm').append('<input type="hidden" 	name = "rs_id"    	  value ="${MReserve.rs_id}" /> ');
			$('#updateReserveFrm').append('<input type="hidden" 	name = "m_uid"    	  value ="${MReserve.m_uid}" /> ');
			$('#updateReserveFrm').append('<input type="hidden" 	name = "r_id"    	  value ="${MReserve.r_id}" /> ');
			$('#updateReserveFrm').append('<div id = "updateReserveDiv"></div>');
			$('#updateReserveDiv').append('<input type ="submit" id = "reserveBtn" value = "예약변경하기" />	');
		}	
	}
})


$(function(){	
	if($('.rResultClass').val() == '0'){
		$('table#RidTable tr td').eq(0).css('backgroundColor','#eee');
		
		$('table#notice tr th').css('backgroundColor','#eee');
		$('table#RidTable tr td').eq(0).click(function(){
			$('table#notice tr th').css('backgroundColor','#eee');			
		})
		
	}else{
		if($('.rResultClass').val() == '1' && $('.rResultname').val() == '예약완료'){
			$('table#RidTable tr td').eq(0).css('backgroundColor','#eee');
			$('table#RidTable tr td').eq(1).css('backgroundColor','#D9E1E8');
			
			$('table#notice tr th').css('backgroundColor','#eee');
			$('table#RidTable tr td').eq(0).click(function(){
				$('table#notice tr th').css('backgroundColor','#eee');
				location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#rs_id').val();
			})
			$('table#RidTable tr td').eq(1).click(function(){
				$('table#notice tr th').css('backgroundColor','#D9E1E8');
				location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#next_rs_id').val();
			})			
			} else {
				if($('.rResultClass').val() == '1' && $('.rResultname').val() == '예약취소'){
					$('table#RidTable tr td').eq(0).css('backgroundColor','#eee');
					$('table#RidTable tr td').eq(1).css('backgroundColor','#D9E1E8');
				
					$('table#notice tr th').css('backgroundColor','#D9E1E8');
					$('table#RidTable tr td').eq(0).click(function(){
						$('table#notice tr th').css('backgroundColor','#eee');
						location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#prev_rs_id').val();
					})
					$('table#RidTable tr td').eq(1).click(function(){
						$('table#notice tr th').css('backgroundColor','#D9E1E8');
						location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#rs_id').val();
					})
					}else{
						if($('.rResultClass').val() == '2' && $('.rResultname').val() == '예약완료'){
							$('table#RidTable tr td').eq(0).css('backgroundColor','#eee');
							
							$('table#RidTable tr td').eq(2).css('backgroundColor','#D9E1E8');
							$('table#notice tr th').css('backgroundColor','#eee');
							$('table#RidTable tr td').eq(0).click(function(){
								$('table#notice tr th').css('backgroundColor','#eee');
								location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#rs_id').val()+"";
							})// td(0) 클릭
							$('table#RidTable tr td').eq(2).click(function(){
								$('table#notice tr th').css('backgroundColor','#D9E1E8');
								location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#next_rs_id').val();
							})// td(2) 클릭
							} else{
								$('table#RidTable tr td').eq(0).css('backgroundColor','#eee');
		
								$('table#RidTable tr td').eq(2).css('backgroundColor','#D9E1E8');
								$('table#notice tr th').css('backgroundColor','#D9E1E8');
								$('table#RidTable tr td').eq(0).click(function(){
									$('table#notice tr th').css('backgroundColor','#eee');
									location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#prev_rs_id').val();
								})
								$('table#RidTable tr td').eq(2).click(function(){
									$('table#notice tr th').css('backgroundColor','#D9E1E8');
									location.href="/Reserve/DetailManagement?m_uid="+$('#m_uid').val()+"&rs_id="+$('#rs_id').val();
							})
						}// else4 end
					}// else3 end
				}// else2 end	
			} // else1
			$(document).on('click','input[name=cancel]',function(){				
				$('#updateReserve').html('');
				$('#backDiv').remove();
				$('#reReserveDiv').remove();
				$('#floatDiv').html('<form action="/Reserve/CancelManagement" id="CancelFrm" method = "post"></form>');
				$('#CancelFrm').append('<input type="hidden" 	name = "r_id" 	   	  value ="${MReserve.r_id}" /> ');
				$('#CancelFrm').append('<input type="hidden" 	name = "rs_id"    	  value ="${MReserve.rs_id}" />  ');
				$('#CancelFrm').append('<input type="hidden" 	name = "m_uid"    	  value ="${MReserve.m_uid}" /> ');
				$('#CancelFrm').append('<input type="hidden" 	name = "rs_note"  	  id="rs_note_input"  />  ');
				$('#CancelFrm').append('<input type="hidden" 	name = "pagegrpnum"   value ="1" />  ');
				$('#CancelFrm').append('<input type="hidden" 	name = "nowpage"      value ="1" /> ');
				$('#CancelFrm').append('<input type="hidden"   	name = "cc_reason"    id="cc_reason" /> ');
				$('#CancelFrm').append('<div id = "cancelDiv"></div>');
				$('#cancelDiv').append('<input type = "submit" value="저장하기" />');
				$('#cancelDiv').append('<input type ="button" id = "homeBtn"      value = "홈으로" />');
				$('#rsNoteDiv').html('<input type = "text" id ="rsNote" />');
				$('#floatDiv').css('margin-left','40px'); 
				$('#ReasonDiv').html('<input type = "text"   id ="cancelReason" />');
				$('#backDiv').append('<input type = "button" id="backbtn" value="목록으로" onclick="history.back(-1);" />');
			 }) 
			$(document).on('click','input#homeBtn',function(){
				
				location.href="/Reserve/Management?nowpage=1&pagegrpnum=1"
			});
			 
			 $(document).on('blur','#cancelReason',function(){
           		 $('#cc_reason').val($('#cancelReason').val());
        	 })
        	 
			 $(document).on('blur','#rsNote',function(){
           		 $('#rs_note_input').val($('#rsNote').val());
        	 }) 

		})// function end
		
	





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
	#wrap{width : 1009px; }
 	 /* body */
 	body{margin : 0px; padding : 0px;}
	
	 /* header */
	#header{width:100%;height:100px; background-color : #2b90d9; text-align : center; line-height:100px;  }
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
	#enTiredDiv{ margin : 0 auto; width : 300px;}
	#cancelDiv{float:left;}
	#backbtn{width:100px; height: 50px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	#tlb-paging{margin-left: 80px;}
	
	
	#notice tr th:first-child  {text-align: center; width : 15%;}
    #notice tr td:nth-child(2) {font-weight: bold; text-align : center; width : 34%;}
    #notice tr th:nth-child(3) {text-align : center; width:15%; }
    #notice tr td:nth-child(4) {text-align : center; width : 34%;}
	#backDiv{float:right;}
	#reserveBtn1{margin-left:120px;}
	#homeBtn{width : 100px; height : 50px;}
</style>
</head>
<body>
	<div id="wrap">
	<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>
			<div id = "hDiv"><h2>고객 예약/결과 상세 조회</h2></div>
			
			<div class="inwrap">
			<div id ="RidTitle">
				<table id = "RidTable">
					<tr>
						<td>예약완료</td>
						<td>예약취소</td>
						<td>방문완료</td>
					</tr>
				</table>
					<input type = "hidden" class= "rResultClass"  value="${RidSelect.r_result}" />
					<input type = "hidden" class= "rResultname"  value="${MReserve.r_result}" />
					<input type = "hidden" id="rs_id"  value="${MReserve.rs_id}" />
					<input type = "hidden" id="m_uid"  value="${MReserve.m_uid}" />
					<input type = "hidden" id="prev_rs_id"  value="${RidSelect.prev_rs_id}" />
					<input type = "hidden" id="next_rs_id"  value="${RidSelect.next_rs_id}" />				
			</div>
				<table id ="notice">
					<tr>
						<th>접수 번호</th>
						<td>${MReserve.r_id}</td>
						<th>처리 상태</th>
						<td>${MReserve.r_result}</td>
					</tr>
					<tr>
						<th>접수 일시</th>
						<td>${MReserve.r_date}</td>
						<th>취소 일시</th>
						<td>${MReserve.cc_date}</td>
					</tr>
					<tr>
						<th>취소 사유</th>
						<td colspan = "3">
							<div id="ReasonDiv">
								${MReserve.cc_reason}
							</div>
						</td>
					</tr>
			
					<tr>
						<th>서비스 예약 일시</th>
						<td>${MReserve.f_date} </td>
						<th>서비스 완료 일시</th>
						<td>${MReserve.fin_date}</td>
					</tr>
				
					<tr>
						<th>고객명</th>
						<td id ="m_name">${MReserve.m_name}</td>
						<th>고객 아이디</th>
						<td id= "m_uid">${MReserve.m_uid}</td>
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
						<td>${MReserve.e_name}</td>
						<th>소속</th>
						<td>${MReserve.c_name}</td>
					</tr>
					
					<tr>
						<th>수리 유/무상 구분</th>
						<td>${MReserve.fin_gbn}</td>
						<th>수리 비용</th>
						<td>${MReserve.fin_pri}</td>						
					</tr>
					<tr>
						<th>수리 내역</th>
						<td colspan = "3">${MReserve.fin_msg}</td>
					</tr>					
					<tr>
						<th>부품 내역</th>
						<td colspan = "3">${MReserve.pa_txt}</td>
					</tr>				
					<tr>
						<th>비고</th>
						<td colspan = "3"><div id = "rsNoteDiv">${MReserve.rs_note}</div></td>
					</tr>										
				</table>		
						<div id="enTiredDiv">
							<div class ="floatDiv" id ="backDiv">								
							</div>	
							<div id ="floatDiv">	
							</div>	
							<div class ="floatDiv" id ="updateReserve">								
							</div>	
							<div id="reReserveDiv">
							</div>
						</div>			
				
			</div>
		</section>
</div>
</body>
</html>