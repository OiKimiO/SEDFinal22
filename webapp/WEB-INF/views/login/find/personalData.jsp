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
	//휴대폰번호 입력
	function phoneNumberChk(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";
	
	
	
	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}


</script>
</head>
<body>
	<div id="wrap">		
	<%@ include file="/WEB-INF/include/cheader.jspf"%>
		<section class="sec-login">
			<div id="intro-notice" class="intros">
				<h3>
					아이디/비번 찾기 <br> <span>아이디/비번 찾기</span>
				</h3>
			</div>
			
			<div style="width: 50%; margin: 0 auto;" id="inwrap">
					<form action="/login/find/findid" method="post">
						<table class="tbl-noticeWrite">
							<tr>
								<th colspan="2" style="text-align: center; background-color: black; color: white; width: 520px; margin: 0 auto; height: 60px; font-size: 30px; font-weight: bold; text-align: center; padding-top: 15px;">아이디 찾기</th>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="m_name" autocomplete="off" placeholder="이름을 입력해 주세요" style="font-size: 2rem;" required />
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" name="m_tel" autocomplete="off" placeholder="전화번호를 입력해 주세요" style="font-size: 2rem;" maxlength="13" onKeyup="phoneNumberChk(this);" required />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="btnNoticeBox">
										<input type="submit" value="확인" id="idfind" class="btnNoticeWritesub " style="margin-right:40px;"/>
									</div>
								</td>
							</tr>	
						</table>
					</form>
					
	
					<form action="/login/find/findpw" method="POST">
						<table  class="tbl-noticeWrite">
							<tr>
								<th colspan="2" style="text-align: center; background-color: black; color: white; width: 520px; margin: 0 auto; height: 60px; font-size: 30px; font-weight: bold; text-align: center; padding-top: 15px;">비밀번호 찾기</th>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="m_uid"  autocomplete="off" placeholder="아이디를 입력해 주세요" style="font-size: 2rem;" required /></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="m_name"  autocomplete="off" placeholder="이름을 입력해 주세요" style="font-size: 2rem;" required /></td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="btnNoticeBox">
										<input type="submit" value="확인" class="btnNoticeWritesub " style="margin-right:40px;"/>
									</div>
								</td>
							</tr>	
								
						</table>
					</form>
			</div>	
		</section>
		</div>
	<footer></footer>
</body>
</html>