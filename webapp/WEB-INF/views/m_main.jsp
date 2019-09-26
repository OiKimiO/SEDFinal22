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
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section>
			<p id="EUserWelcome">
				<span id="EUserName">${sessionScope.e_name }</span> 기사님 환영합니다.
			</p>
			<div id="MenuBox">
				<ul>
					<li style="width:100%"><a href="/EScheduleList" style="background-image:url(/img/e/getServiceList.png);background-size:100%"> 서비스 일정 </a></li>
					<li style="display:none"><a href="#"></a></li>
					<li><a href="/MapTest"  style="background-image:url(/img/e/getElecCar.png);background-size:100%"></a></li>
					<li><a href="/MapTest1"  style="background-image:url(/img/e/getElecCar.png);background-size:100%"></a></li>
					<li><a href="/E_MyPage" style="background-image:url(/img/e/myPage.png);background-size:100%"></a></li>
					<!-- <li><a href="/E_MyPage" style="background-image:url(/img/e/myPage.png);background-size:100%"></a></li> -->
				</ul>
			</div>
			<!-- <div id="squaresBox" class="pos-rel">
				<div>
					<a href="#" id="square1" class="squares"> 서비스 일정 </a>
				</div>
				<div>
					<a href="#" id="square2" class="squares"> 수리 내역 조회 </a> 
					<a href="/MyPage" id="square3" class="squares"> 마이페이지 </a>
				</div>
			</div> -->
			<!-- <div>
				<br><br><br>
				<a href="#" id="btnLogout">Logout</a>
			</div> -->
		</section>
		<%@ include file="/WEB-INF/include/efooter.jspf"%>
	</div>
</body>
</html>