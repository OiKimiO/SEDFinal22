<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>
<link rel="stylesheet" href="/css/common.css" >
<link rel="stylesheet" href="/css/cJoinStyle.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
	
	
	//유효성체크
	function check(re, what, message) {
	    if(re.test(what.value)) {
	        return true;
	    }
	    
	    alert(message);
	    what.value = "";
	    what.focus();
	}
	
	//유효성체크
	function validate() {
		var re = /^[a-zA-Z0-9]{4,12}$/;
		
		var m_uid = document.getElementById('idDupCheckText');
		var m_pwd = document.getElementById('m_pwd');
		var m_pwdCheck = document.getElementById('m_pwdCheck');
	
		var c_id = document.getElementById('c_id');
	
		
		
		if(!check(re, m_uid,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력하세요")) {
	        return false;
	    }
		
		if(!check(re, m_pwd, "비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력하세요.")) {
			return false;
		}
		
		/*비밀번호와 비밀번호확인란 같은지 확인*/
		if (m_pwd.value != m_pwdCheck.value){
			alert("비밀번호와 비밀번호 확인란이 다릅니다.");
			m_pwd.focus();
			return false;
		}
		
	
		if(c_id.value == "") {
			alert("센터찾기를 클릭해 주세요");
			c_id.focus();
			return false;
		}

		
		
		
	}
	
	//submit 될때 체크
	window.onload = function() {
	var frm = document.querySelector('.register');
	//var btnReg	= document.querySelector('#btnReg');
		
		frm.onsubmit = function(e) {
			var result = validate();
			if(result == false) {
				e.preventDefault();
				e.stopPropagation();
			}
			return result;
		}
	}
</script>

<!-- 로그인 중복체크 js  -->
<script>
	$(function() {
		  $('#idDupCheckText').keyup(function( e ) {
			  
			  var userId = $("#idDupCheckText").val();
			  if(userId.length<1)
				  {
				 	$('#dupResult').html(
					 '<br><b style="color:red;">아이디를 입력해주세요</b>');
				  	$('#jbtn').attr('disabled', true);
				  } else{
					  e.preventDefault();
					  e.stopPropagation();
					  $.ajax({
						  url      : '/IdDupCheck', 
						  type     : 'GET',
						  data     : {m_uid : $('[name=m_uid]').val() },
						  dataType : 'json', 
						  success  : function(data) {
							 
							  if(data.membersVo == null) {
								  $('#dupResult').html(
									 '<br><b style="color:green;">사용가능한 아이디입니다</b>');
								  $('#jbtn').attr('disabled', false);
							  } else {
								  $('#dupResult').html(
									 '<br><b style="color:red;">사용 불가능한 아이디입니다</b>');
								  	$('#jbtn').attr('disabled', true);
							  }
							 
						  }
					  })
				}
		  });
	});
	
</script>

<!-- 주소찾기 kakao api js  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function fn_setAddr(){
		var width = 500;
		var height = 600;
		daum.postcode.load(function(){
			new daum.Postcode({
				oncomplete: function(data){
					$("#zonecode").val(data.zonecode);
					$("#sido").val(data.sido);
					$("#sigungu").val(data.sigungu);
					$("#addr").val(data.bname);
				}
			}).open({
				left: (window.screen.width/2) - (width/2),
				top : (window.screen.height/2) - (height/2)
			});
		});
	}
</script>

<!-- 해당지역 센터 찾기 -->
<script>
$(function() {
	  $('#NearCenterBtn').on("click", function( e ) {
		
		  $.ajax({
			  
			  url      : '/NearCenter', 
			  type     : 'GET',
			  data     : {gu_name : $('[name=m_gugun]').val() },
			  dataType : 'json', 
			  success  : function(data) {
				 console.log(data);
				  if(data.centersVo == null) {
					  var value = $('#cname').val('해당센터가 없습니다.');
				  } else {
					  var value = $('#cname').val(data.centersVo.c_name);
					  var value = $('input[name=c_id]').val(data.centersVo.c_id);
				  }
			  }
		  })
	  });
});
</script>
</head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/include/cheader.jspf" %>
	<section class="sec-join">
		<div id="intro-notice" class="intros">
		    <h3>공지사항
		    <br>
		    <span>이 페이지는 공지사항 페이지이다.</span>
		    </h3>
	    </div>
	    
	    <br><br>
	
	    <!-- 회원가입 table -->
	    <form action="/Members/Join" class="register" method="POST">
		    <div class="inwrap" >
		    <table id="tbl-noticeWrite" style="width:80%; margin:0 auto;">
		        <tr><th colspan="2">회원가입</th></tr>
       			<tr>
       				<th>아이디</th>
       				<td><input type="text" name="m_uid" placeholder="아이디"  id="idDupCheckText" autocomplete = off required />
        				<span id="dupResult"></span>
       				</td>
       			</tr>
       			<tr>
       				<th>비밀번호</th>
       				<td><input type="password" name="m_pwd" placeholder="비밀번호" id='m_pwd'  required /></td>
       			</tr>
       			<tr>
       				<th>비밀번호 확인</th>
       				<td>
       					<input type="password" name="m_pwdCheck" placeholder="비밀번호 확인" id='m_pwdCheck' required />
       				</td>
       			</tr>
       			<tr>
       				<th>이름</th>
       				<td><input type="text" name="m_name" id="m_name" placeholder="이름"  required /></td>
       			</tr>
       			<tr>
       				<th>전화번호</th>
       				<td><input type="tel" name="m_tel" placeholder="전화번호" required maxlength="13" onKeyup="phoneNumberChk(this);" /></td>
       			</tr>
       			<tr>
       				<th>주소</th>
       				<td>
       					<input type="text" name="m_zipcode" placeholder="우편번호" 	id="zonecode" 	style="width:100px;" onclick="fn_setAddr();" readonly required/>
						<input type="text" name="m_city" 	placeholder="시도" 		id="sido" 		style="width:100px;" onclick="fn_setAddr();" readonly required/>
						<input type="text" name="m_gugun" 	placeholder="구군" 		id="sigungu" 	style="width:100px;" onclick="fn_setAddr();" class="NearCenterChange" required/>
						<input type="text" name="m_addr" 	placeholder="상세주소" 	id="addr"   style="width:300px;"  required/>
						<!-- <button onclick="fn_setAddr();" >주소찾기</button> -->
							
       				</td>
       			</tr>
       			<tr>
       				<th>해당지역서비스센터</th>
       				<td>
       					<input type="hidden"  id="c_id" name="c_id" />
       					<input type="text"  id="cname"  value=""/>
       					<input type="button" value="센터찾기" id="NearCenterBtn"/>
       				</td>
       			</tr>
       			<tr>
       				<td colspan="2" style="width:100%;border-bottom:none;">
       				<span style="display:block; width:40%; margin:0 auto;">
						<input type="button" value="뒤로가기" onclick="javascript:history.back()"  style="font-size:15px;border-radius: 5px; padding:10px; background-color:#666666; color:#FFFFFF;"/>
       					<input type="submit"   id="jbtn" disabled="disabled"  value="회원가입" style="font-size:15px;border-radius: 5px; padding:10px; background-color:#A50034; color:#FFFFFF;" /> 
       				</span>
       				</td>
       			</tr>
		    </table>
		    <br><br><br>
		    </div>
	    </form>
	</section>
<footer>
</footer>
</div>
</body>
</html>