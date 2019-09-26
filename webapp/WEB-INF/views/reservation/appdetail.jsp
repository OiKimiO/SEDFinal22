<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 보기(예약완료/취소완료)</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cReservationStyle.css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	$(function() {
		var r_result = "<c:out value="${r_result}" />";
		
		
		if (r_result == 0) {
			$("#cancel").attr("style", "display:inline");
		} else {
			$("#cancel").attr("style", "display:none");
		}

		$("#list").click(function() {
			window.history.go(-1);
		})

		/* 	$("#cancel").click(
							function() {
								if (confirm("예약을 취소하시겠습니까?")) {
									$(location).attr("href","/Reservation/Check/Appdetail/Cancel?r_result=0");
								} else {
									return;
								}

							}) */

		$('#cancel').click(function() {
			
			var cc_reason = prompt("예약 취소 사유를 입력하세요.", '');
			if (cc_reason != null) {
				
				$.ajax({
					
					type : "POST",					
					url:"/Reservation/Check/Appdetail/Cancel",
					data : {
						r_id : $('[name=r_id]').val(), cc_reason : cc_reason
					},
					dataType : 'json',
					success : function(data) {
						console.log(data);
						alert("예약 취소 되었습니다");
						window.location.replace("/Reservation/Check?pagegrpnum=1&nowpage=1");
					},
					error : function(xhr) {
						alert("예약변경 에러발생");
					}

				})
			} else {
				return false;
			}

		})

	})
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/cheader.jspf"%>
		<section class="sec-reservation">
			<div id="intro-notice" class="intros">
				<h3>
					나의 예약/결과 조회 <br> <span>나의 예약/결과 조회</span>
				</h3>
			</div>
			
			<div class="inwrap">
				<div style="text-align: center; background-color: black; color: white; width: 60%; margin: 0 auto; height: 60px; font-size: 3rem; font-weight: bold; text-align: center; padding-top: 15px;">나의
					예약/결과 조회</div>
	
				<div style="width: 60%; margin: 0 auto;">
					<table class="tbl-noticeWrite">
						<tbody>
							<c:forEach var="appresult" items="${AppResult}">
								<tr>
									<th class="td_tag" >&nbsp;&nbsp;&nbsp;예약번호(R_ID)</th>
									<td id="r_id">&nbsp;&nbsp;<input type="text" name="r_id" value="${appresult.r_id}" /></td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;접수일시</th>
									<td>&nbsp;&nbsp;${appresult.r_date}</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;방문 요청 일자</th>
									<td>&nbsp;&nbsp;${appresult.f_date}&nbsp;&nbsp;${appresult.com_val}</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;진행상태</th>
									<td><c:if test="${appresult.r_result eq '0'}">
											<b>&nbsp;&nbsp;예약하기</b>
										</c:if> <c:if test="${appresult.r_result eq '1'}">
											<b>&nbsp;&nbsp;예약취소</b>
										</c:if> <c:if test="${appresult.r_result eq '2'}">
											<b>&nbsp;&nbsp;방문완료</b>
										</c:if>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;제품분류</th>
									<td>&nbsp;&nbsp;${appresult.cate_name}</td>
								</tr>
	
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;제품명</th>
									<td>&nbsp;&nbsp;${appresult.p_name}</td>
								</tr>
	
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;시리얼 넘버(S/N)</th>
									<td>&nbsp;&nbsp;<b>${appresult.s_num}</b></td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;구입시기</th>
									<td>&nbsp;&nbsp;${appresult.s_date}</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;증상분류</th>
									<td>&nbsp;&nbsp;${appresult.f_lname}</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;증상상태</th>
									<td>&nbsp;&nbsp;${appresult.f_sname}</td>
								</tr>
								
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;증상상세정보</th>
									<td>&nbsp;&nbsp;${appresult.r_msg}</td>
								</tr>
	
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;엔지니어</th>
									<td>&nbsp;&nbsp;<b>이름:${appresult.e_name}</b>/소속:${appresult.c_name}
									</td>
								</tr>
								
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;취소사유</th>
									<td>&nbsp;&nbsp;${appresult.cc_reason}</td>
								</tr>
								
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;비고</th>
									<td>&nbsp;&nbsp;${appresult.rs_note}</td>
								</tr>
								
	
							</c:forEach>
						</tbody>
									
					</table>
				</div>
	
				<br /> <br />
				<div style="text-align: center; background-color: black; color: white; width: 60%; margin: 0 auto; height: 60px; font-size: 3rem; font-weight: bold; text-align: center; padding-top: 15px;">서비스
					받으시는 분</div>
	
				<div style="width: 60%; margin: 0 auto;" >
					<table class="tbl-noticeWrite" >
						<tbody>
						
							<c:forEach var="list" items="${memDetail}">
								<tr>
									<th class="td_tag">&nbsp;&nbsp;이름</th>
									<td>&nbsp;&nbsp;${list.m_name}</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;휴대전화</th>
									<td>&nbsp;&nbsp;${list.m_tel}</td>
								</tr>
								
								<tr>
									<th class="td_tag">&nbsp;&nbsp;주소</th>
									<td>&nbsp;&nbsp;${fn:substring(list.m_zipcode,0,3)}-${fn:substring(list.m_zipcode,3,7)}
										<br>&nbsp;&nbsp;${list.m_city } &nbsp;${list.m_gugun }&nbsp;${list.m_addr}
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="width: 60%; margin: 0 auto;" id="btnNoticeBox">
					<br /> <br />
					<input type="button" value="목록으로가기" class="btnNoticeWrite" id="list">&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${ r_id_count == 1}" >
							<input type="button" value="예약 취소" class="btnNoticeWrite" id="cancel">
					</c:if>
				</div>
			</div>
			<br /> <br />
		</section>
	</div>
</body>
</html>