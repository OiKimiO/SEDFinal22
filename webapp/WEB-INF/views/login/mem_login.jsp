
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cLoginStyle.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
  
    window.onload = function () {
      //비밀번호 정규식 만들기 
      //
      var login = document.getElementById('login');
      var form1 = document.getElementById('form1');
	  var idPwdCheck=document.getElementById('idPwdCheck');	

	  
      login.onclick = function () {
        var userid = document.getElementById('mid');
        var pwd = document.getElementById('mpwd');

        if (userid.value.trim().length == 0) {
          alert('아이디를 입력해주세요.');
          userid.focus();
          return false;
        }

        if (userid.value.trim().length < 3) {
          alert('아이디는 3자 이상입니다.');
          userid.focus();
          // e.preventDefault();
          // e.stopPropagation();
          return false;
        }

        if (pwd.value.trim().length < 4) {
          alert('비밀번호는 3자 이상입니다.');
          pwd.focus();
          // e.preventDefault();
          // e.stopPropagation();
          return false;
        }
        form1.action = "/Members/LoginAction";
        form1.submit();
      }

      
      idPwdCheck.onclick=function(){
    	  form1.action = "/login/find/personalData";
          form1.submit();    	  
      }     
    }
  </script>

</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/cheader.jspf"%>
		<section class="sec-login">
	
			<!-- 로그인 table -->
			<form action="/Members/LoginAction" method="POST" id="form1">
				<div class="inwrap"style="width:50%;margin-top:100px;" >
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
									<input type="submit" id="login" value="로그인" class="btnNoticeWrite"> 
								</td>
							<tr>
						
						</tr>
					</table>
					<div id="btnNoticeBox">
						<input type="button" value="아이디/비밀번호 찾기" id="idPwdCheck" class="btnNoticeWritesub " />
						<input type="button" value="뒤로가기" class="btnNoticeWritesub" onclick="javascript:history.back()"  />
					</div>
				</div>
			</form>
		</section>
		<footer> </footer>
	</div>
</body>
</html>