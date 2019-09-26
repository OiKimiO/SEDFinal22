<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>InsertMenu</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/eheader.css">
<link rel="stylesheet" href="/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	$('#e_login').click(function(){
		alert('!');	
		//var param = $("form[name=frm-login]").serialize();
		/* $.ajax({
			url : '/E_Login',
			data: param,
			type:'POST',
			dataType:'html',
			async:false,
			success: function(data) {
				alert(data);
			},
			error : function(xhr) {
				alert(xhr.status + ' : ' + xhr.statusText);
			}
		}) */
	});
	
});
</script>
</head>
<body>
<div id="wrap">
<header id="eheader" style="position:relative">
	<a href="#" style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)"> <img src="/img/mainLogo.svg">
	</a>
</header>
            <section id="sec-login">
              <div id="mar-bot">
              <div style=" width:50%;height:200px; padding-top:40px; margin:0 auto">
              <p style="color:#fff;text-align:center;font-size:1.5rem">PK Electronics</p>
              <p style="color:#fff;text-align:center;font-size:3rem">Engineer Mobile</p>
              </div>
              </div>
              <div class="comBox">
              <form id="frm-log" name="frm-login" action="/E_Login" method="POST">
                  <input type="text"     id="e_id"    name="e_id"  class="inp-log" placeholder="Engineer ID">
                  <input type="password" id="e_pwd"   name="e_pwd" class="inp-log" placeholder="Password">
                  <c:if test="${msg != null }">
                  <input type="text"     id="msg"     value="${ msg }" class="inp-log" >
                  </c:if>
                  <input type="submit"   id="e_login" value="LOGIN">
              </form>

              <!-- <div style="width:100%; height:100px; background-color:#eee; padding-top:30px">
              	  <p style="width:80%; font-size:1.5rem; margin::0 auto; text-align:center">
                  오류 혹은 계정 정보를 잊으신 경우,
                  <br>
                  관리자에게 연락하십시오.
                  </p>
                  <a href="/Home">
                  pc메인
                  </a>
              </div> -->
            </div>
            </section>
            <div style="width:100%; height:200px"></div>
            <%@ include file="/WEB-INF/include/efooter.jspf"%>
        </div>
</body>
</html>