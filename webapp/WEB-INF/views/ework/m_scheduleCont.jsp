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
</head>
<script>

</script>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section id="sec-escheduleCont">	
		<p class="mintro">
		서비스 요청 상세조회
		</p>	
			<div class="inwrap">
				 
			<table id="tbl-scheduleCont">
			<tr>
			<td>예약번호</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.r_id }</td>
			</tr>
			<tr>
			<td>접수일시</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.r_date }</td>
			</tr>
			<tr>
			<td>방문요청일시</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.f_date } ${ eScheduleCont.f_time }</td>
			</tr>
			<tr>
			<td>제품명</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.p_name }</td>
			</tr>
			<tr>
			<td>제품 이상 증상</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.f_lname } > ${ eScheduleCont.f_sname }</td>
			</tr>
			<tr>
			<td>전달사항</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.r_msg }</td>
			</tr>
			<tr>
			<td>고객명</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.m_name }님</td>
			</tr>
			<tr>
			<td>고객 연락처</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.m_tel }</td>
			</tr>
			<tr>
			<td>고객 주소</td>
			</tr>
			<tr>
			<td>${ eScheduleCont.m_city } ${ eScheduleCont.m_gugun }<br>
			상세주소 : ${ eScheduleCont.m_addr }</td>
			</tr>
			</table>
			<a href="/QRPage?r_id=${ eScheduleCont.r_id }" id="btn-qrPage">서비스 진행</a>
			</div>
		</section>
		<%@ include file="/WEB-INF/include/efooter.jspf"%>
	</div>
</body>
</html>