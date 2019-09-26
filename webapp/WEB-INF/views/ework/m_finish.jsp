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
<style>
#tbl-scheduleCont {width:100%}
#tbl-scheduleCont tr:nth-child(odd) {background-color:#eee}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section id="sec-qrpage">
		<p class="mintro">
		보고서 제출이
		<br>
		완료되었습니다.
		</p>		
		<a href="/EngineerMain" id="btn-index">메인으로 돌아가기</a>
		</section>
	</div>
</body>
</html>