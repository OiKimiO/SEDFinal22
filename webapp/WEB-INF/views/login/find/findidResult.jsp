<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cLoginStyle.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
	$(function(){
		$("#loginpage").click(function() {
			window.location.replace("/Members/Login");
		});
		
		$("#pwds").click(function() {
			window.location.replace("/login/find/personalData");
		});
	});
</script>

</head>
<body>
	<div id="wrap">		
		<%@ include file="/WEB-INF/include/cheader.jspf"%>
		<section class="sec-login">
		
			<div class="inwrap"style="width:40%;margin-top:200px;">
			
				<table class="tbl-noticeWrite" >
					<tr>
						<th style="text-align: center; background-color: black; color: white; width: 520px; margin: 0 auto; height: 60px; font-size: 30px; font-weight: bold; text-align: center; padding-top: 15px;">아이디 찾기</th>
					</tr>
					<tr>
						<th>조회된 아이디는 <span>${m_uid }</span> 입니다.</th>
					<tr>
				</table>
				<div id="btnNoticeBox1">
					<input type="button" value="로그인하러가기" id="loginpage" class="btnNoticeWritesub " />
					<input type="button" value="비밀번호찾기"  id="pwds"  class="btnNoticeWritesub"  />
				</div>
			</div>
					
			
		</section>
	</div>
		<footer></footer>	
</body>
</html>