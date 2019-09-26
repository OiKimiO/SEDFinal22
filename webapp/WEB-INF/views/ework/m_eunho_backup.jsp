<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>

function parse(str) {
    var y = str.substr(0, 4);
    var m = str.substr(4, 2);
    var d = str.substr(6, 2);
    return new Date(y,m-1,d);
}

$( document ).ready(function() {

	//alert($('.changeDate').html());
	//var arrDates;
	for (var i = 0; i <= 6; i++) {
		var date = parse($('.changeDate').eq(i).html());
		if(date.getDay() == 0) {
			//$('.changeDate').eq(i).html('일요일!!!');
			$('.changeDate').eq(i).html($('.changeDate').eq(i).html().substring(0, 4) + '년 ' + $('.changeDate').eq(i).html().substring(4, 6) + '월 ' + $('.changeDate').eq(i).html().substring(6, 8) + '일');
			$('.changeDate').eq(i).css( "color", "red" );
		} else {
			$('.changeDate').eq(i).html($('.changeDate').eq(i).html().substring(0, 4) + '년 ' + $('.changeDate').eq(i).html().substring(4, 6) + '월 ' + $('.changeDate').eq(i).html().substring(6, 8) + '일');

		}
		
	}//for 닫음
	
	$('#sel-schedule').change(function(){
		//alert($(this).val());
		var selectedDate = $(this).val();
		var selectedDay = parse(selectedDate);
		console.log(selectedDay.getDay());
		if(selectedDay.getDay() == 0) {
			$('#escheduleBox').html('휴무일입니다.');
		} else {
			$.ajax({
				url:'/ChangeEScheduleList',
				data: {f_date : selectedDate},
				type:'POST', 
				dataType:'json',
				success:function(changedEScheduleList) { 
					console.log(changedEScheduleList);
					$('#escheduleBox').html('');
					for (var i = 0; i < changedEScheduleList.length; i++) {
						//changedEScheduleList[i].f_time
						
						$('#escheduleBox').append('<div class="escheduleList"><a href="/EScheduleView?r_id=' + changedEScheduleList[i].r_id + '" style="display:block;width:100%;height:100%;">'
						+ '<span class="left">예약번호</span>' +  '<span class="right">' + changedEScheduleList[i].r_id + '</span>'
						+ '<span class="left">예약시간</span>' +  '<span class="right">' + changedEScheduleList[i].f_time + '</span>'
						+ '<span class="left">고객이름</span>' +  '<span class="right">' + changedEScheduleList[i].m_name + '</span>'
						+ '<span class="left">고객연락처</span>' +  '<span class="right">' + changedEScheduleList[i].m_tel + '</span>'
						+ '<span class="left">고객주소</span>' +  '<span class="right">' + changedEScheduleList[i].m_city + '시 ' +changedEScheduleList[i].m_gugun + '</span>'
						+ '<span class="left">제품명</span>' +  '<span class="right">' + changedEScheduleList[i].p_name + '</span>'
						+ '</a></div>'
						);
						//<div style="border:1px solid black;font-size:1.8rem;padding:1.5rem;margin-bottom:2.5rem">
						//<a href="#" style="display:block;width:100%;height:100%;">
						//예약번호 : ${ eschedule.r_id }
						
						/* $('#sel-schedule').append('<c:forEach items="' + ${ dateList } +'" var="arrDates"><option value="' + ${arrDates} + '" class="changeDate">' + ${arrDates } + '</option></c:forEach>'); */
					}
					
				},
				error:function(xhr){
					alert(xhr.status + ':' + xhr.statusText);
				}
			}); 
		}
		
	});
});
	
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section id="sec-eschedule">
		<p class="mintro">
		서비스 일정 확인
		</p>
			<div class="inwrap">
			<select id="sel-schedule">
			<c:forEach items="${ dateList }" var="arrDates">
			<option value="${arrDates}" class="changeDate">${arrDates }</option>
			</c:forEach> 
			</select>
			</div>
			
			<div id="escheduleBox" class="inwrap">
			<c:forEach items="${ eScheduleList }" var="eschedule">
			<div class="escheduleList">
			<a href="/EScheduleView?r_id=${ eschedule.r_id }" style="display:block;width:100%;height:100%;">
			<span class="left">예약번호</span>
			<span class="right">${ eschedule.r_id }</span>
			<span class="left">예약시간</span>
			<span class="right">${ eschedule.f_time }</span>
			<span class="left">고객이름</span>
			<span class="right">${ eschedule.m_name }</span>
			<span class="left">고객연락처</span>
			<span class="right">${ eschedule.m_tel }</span>
			<span class="left">고객주소</span>
			<span class="right">${ eschedule.m_city } ${ eschedule.m_gugun }</span>
			<span class="left">제품명</span>
			<span class="right">${ eschedule.p_name }</span>
			</a>
			</div>
			</c:forEach>
			
			</div>
		</section>
		<%@ include file="/WEB-INF/include/efooter.jspf"%>
	</div>
</body>
</html>