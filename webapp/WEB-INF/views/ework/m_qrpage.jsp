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
		QR코드를
		<br>
		촬영해주세요.
		</p>		
		<a href="/DoingAS" id="btn-doingAS">직접 입력</a>
		</section>
	</div>
</body>
</html>