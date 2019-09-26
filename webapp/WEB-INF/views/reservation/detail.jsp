<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 보기(방문완료)</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cReservationStyle.css">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	$(function() {
		$("#service").click(function() {
			$(location).attr("href", "/");
		})

		$("#home").click(function() {
			$(location).attr("href", "/");
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
	
				<div style="width: 60%; margin: 0 auto;" >
					<table class="tbl-noticeWrite">
						<tbody>
							<c:forEach var="appresult" items="${AppResult}">
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;예약번호(R_ID)</th>
									<td>&nbsp;&nbsp;${appresult.r_id}</td>
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
									<th class="td_tag">&nbsp;&nbsp;&nbsp;서비스 완료</th>
									<td>&nbsp;&nbsp;${appresult.fin_date}&nbsp;&nbsp;${appresult.fin_time}</td>
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
									<td>&nbsp;&nbsp; <b>이름:${appresult.e_name}</b>/소속:${appresult.c_name}
									</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;사용부품</th>
									<c:choose>
										<c:when test="${appresult.pa_txt eq null }">
											<td>&nbsp;&nbsp;<b>부품을 바꾸지 않았습니다</b></td>
										</c:when>
										<c:otherwise>
											<td>&nbsp;&nbsp;${appresult.pa_txt}</td>
										</c:otherwise>
									</c:choose>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;수리내역</th>
									<td>&nbsp;&nbsp;${appresult.fin_msg}</td>
								</tr>
	
								<tr>
									<th class="td_tag">&nbsp;&nbsp;&nbsp;서비스비용</th>
									<td>&nbsp;&nbsp;${appresult.fin_pri}</td>
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
					<table class="tbl-noticeWrite"  >
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
					<input type="button" value="서비스평가" class="btnNoticeWrite" id="service">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="홈으로" class="btnNoticeWrite" id="home">
				</div>
			</div> <!-- id="inwrap" end -->
			<br /> <br />
		</section>
	</div>
</body>
</html>