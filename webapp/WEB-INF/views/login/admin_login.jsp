<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그인</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cLoginStyle.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/cheader.jspf"%>
		<section class="sec-login">
	
	

			<!-- 로그인 table -->
			<form action="/Admin/LoginAction" method="POST" id="form1">
				<div class="inwrap"style="width:50%;margin-top:200px;" >
					<table class="tbl-noticeWrite" >
						<tr>
							<th colspan="2" style="font-size:3rem; margin-bottom:50px;">로그인</th>
						</tr>
						<tr>
							
							<tr>
								<th>userid</th>
								<td><input type="text" id="mid" name="m_uid"  placeholder="아이디를 입력해 주세요" style="font-size: 2rem;" required /></td>
							<tr>
							<tr>
								<th>userpwd</th>
								<td><input type="password" id="mpwd" name="m_pwd"  placeholder="비밀번호를 입력해주세요" style="font-size: 2rem;" required /></td>
							<tr>
							<tr>
								<td colspan="2" id="#tnNoticeBox">
									<input type="submit" value="로그인" class="btnNoticeWrite"> 
								</td>
							<tr>
						
						</tr>
					</table>
					<div id="btnNoticeBox">
						<input type="button" value="뒤로가기" class="btnNoticeWritesub" onclick="javascript:history.back()"  />
					</div>
				</div>
			</form>
		</section>
		<footer> </footer>
	</div>
</body>
</html>