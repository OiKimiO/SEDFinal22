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
table th, td {font-size:2rem}
input {font-size:2rem}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section>
		<form>
		<table>
		<tr>
		<td>제품명</td>
		</tr>
		<tr>
		<td>pname</td>
		</tr>
		<tr>
		<td>Serial Number</td>
		</tr>
		<tr>
		<td>snum</td>
		</tr>
		<tr>
		<td>제품 생산일자</td>
		</tr>
		<tr>
		<td>s_date</td>
		</tr>
		</table>
		<input type="submit" value="확인">
		</form>
		
		</section>
		<%@ include file="/WEB-INF/include/efooter.jspf"%>
	</div>
</body>
</html>