<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>

var sel_file;
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
$(function(){
	
	
	
	
	$('#homebtn').click(function(){
	
		location.href = "/Engineering?nowpage=1&pagegrpnum=1&cate_id=C&c_id=C";
	})
	
	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
		// #input_img의 type은 file이며, type이 file일때 파일 선택 대화상자 열림 
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files; // e.target은 이벤트가 일어난 대상, 즉 input. files에는 어떤 파일들을 올렸는지 나옴
		var filesArr = Array.prototype.slice.call(files);//이 코드가 존재하는 함수의 매개변수로 넘어온 값들을 array로 변환
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader(); //html5의 file api - 로컬에 보존돼 있는 파일의 정보나 내용을 가져오기 위한 API
			
			                              //FileReader가 즉시 파일을 읽는 게 아니기 때문에 
			reader.onload = function(e){ //onload 이벤트 핸들러를 붙여서 콜백으로 파일을 다 읽었다는 것을 알려줌
				$("#img").attr("src", e.target.result); //미리보기용
				$('#e_img').val(files[0].name);//파일 이름(name)을 읽어서 e_img의 value에 넣어줌 
			}
			
			//파일을 읽는 방법은 네 가지가 있음
			//readAsText, readAsDataURL, readAsArrayBuffer, readAsBinaryString
			//으노는 readAsDataURL을 사용했고, 이 방법은 데이터 URL로 만드는 방법
			//처음에 base64라는 말이 보이는데, base64로 인코딩했다는 뜻.
			//base64로 인코딩한 경우 브라우저가 이 문자열을 인식해서 원래 데이터로 만들어줌. 
			//길긴 해도 이 문자열을 주소창에 치면, 브라우저가 이 파일을 표시.
			//즉, 파일 정보를 주소처럼 활용할 수 있다는 것.
			
			//img 태그의 src로도 사용할 수 있어서 이미지의 미리보기를 바로 표시하고 싶을 때 사용가능
			// document.getElementById('이미지').src = e.target.result; 해주면 되므로
			// 위에 $("#img").attr("src", e.target.result);라는 줄이 있었던 것
			
			
			reader.readAsDataURL(f);
		});
	}
	
})// function ends 
</script>

<style>
 	/* 웹 폰트 */
        @font-face { font-family: 'GoyangIlsan'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); 
        font-weight: normal; font-style: normal; }
   
     /*default*/
     * {
                padding: 0;
                margin: 0;
                box-sizing:border-box;
                text-decoration: none;
                list-style: none;
                color: #282c37;
                font-family: 'GoyangIlsan';
            }
   
   /* Mdiv */
	#Mdiv{width : 1024px;}
 	 /* body */
 	body{margin : 0px; padding : 0px;}
	
	/* section */
	section{width :calc(100% - 230px); height : 500px; margin-left : 230px;}
	#managerIdDiv{border:1px solid #9baec8; width : 80%; margin : 0 auto; text-align : center; height : 50px; margin-top : 80px; background-color :#2b90d9; }
	
         
	#inwrap{width:1024px;margin:0 auto}
	#entireDiv{border:0px solid #282c37;}
	.FrameDiv{border : 0px solid #282c37; width:38%; height:210px; margin-top : 40px; float: left;}
	.imgFrameDiv{border : 0px solid #282c37; width:25%; height:100px; float : left; }
	.selectFrameDiv{border : 0px solid #282c37; width:250px;; height:100px; float : left; margin-top : 40px;}
	#btnIdFrame{margin-top : 0; width : 45%; margin-left : 200px;}
	
	.selectBox{width : 200px; height : 50px;}
	.inputText{width : 80%; height:30px; border : none; border-bottom : 1px solid #282c37; opacity : 0.9;}
	.floatDiv{float : left;}
	.FrameDiv .btn{display:inline-block; width:30%; height:50px; text-decoration : none; text-align : center; line-height: 50px;  
				   background-color : #d9e1e8; color : #282c37;}
	#imgDiv{border : 0px solid #282c37; width:40%; margin : 0 auto;}
	#firstDiv{ border : 0px solid black; height:210px;}
	.imgDiv{width:5%; height : 5%; float:left;}
	.imgs{width:100%; height : 100%;}
	#nameinput{width:85%;}
	#pictureDiv{width:150px; height:150px; }
	div#hDiv h2{padding : 30px 0; color : black;}
</style>
</head>
<body>
<div id = "Mdiv">
<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>

		<form action = "/EInsertProcess" method = "post" enctype="multipart/form-data">
				<div class= "imgFrameDiv" id ="firstDiv">
				
				<div id = "hDiv"><h2>기사 추가 페이지</h2></div>
					<br/>
					<br/>
					
					<!-- 기사 사진 추가  -->
					<div id ="pictureDiv">
						<img id="img" class ="imgs" />
						
					</div>
					<div id ="imgbtninsert"> 	
						<input type="file" id = "input_img" name = "e_img" 
						  required/>
						<input type="hidden" id = "e_img" name = "e_img" />
					</div>
					</div>
					<div class= "FrameDiv" id ="firstDiv">
					<!-- 이름  -->
					<span>이름</span><br />
						
					<input type = "text" id = "nameinput"class="inputText" name = "e_name"
					 required/>
					<br/>
					<br/>
					<!-- 비밀번호  -->
					<span>비밀번호</span><br />
					<div >
						<div class ="imgDiv">
							<img id = "pwd" class="imgs" src="/img/key.JPG" >
						</div>
						<input type = "password" class="inputText" name = "e_pwd" 
						 required/>
					</div>
					<br/>		
					<!-- 전화번호 -->
					<span>전화번호</span><br />
					<div>
						<div class ="imgDiv"> 
							<img id = "pwd" class="imgs"  src="/img/tel.JPG" >
						</div>
						<input type = "text" class="inputText" name = "e_tel" 
						 required maxlength="13" onKeyup="phoneNumberChk(this);"/>
					</div>
				</div>
					
				<div class= "selectFrameDiv">
					<!-- 전문분야 선택 -->
					<span>전문분야</span><br /><br />
					<div>
						<div class ="imgDiv">
							<img id = "pwd" class="imgs"  src="/img/bag.JPG" >
						</div>
						<select class="selectBox" name = "cate_id">
							<c:forEach var = "category" items="${selectCate}">
								<option value="${category.cate_id}">${category.cate_name}</option>
							</c:forEach>		
						</select>
					</div>
					<br/>
					<!-- 센터 선택 -->
					<span>센터</span><br />
					<div>
						<div class ="imgDiv">
							<img id = "pwd" class="imgs"  src="/img/building.JPG" >
						</div>
						<select class="selectBox" name = "c_id">
							<c:forEach var = "center" items="${selectCenter}">
								<option value="${center.c_id}">${center.c_name}</option>
							</c:forEach>					
						</select>
					</div>
				
				</div>

				<div id = "btnIdFrame" class= "FrameDiv">
					<!-- 저장,재입력 버튼 -->
					<input type="submit" id = "savebtn" 	class="btn" value = "저장" />
					<input type="reset"  id = "rewritebtn"  class="btn" value = "재입력" />
					<input type="button" id = "homebtn"	    class="btn" value = "홈으로" />
				</div>
			<input type = "hidden" name = "nowpage" value="1" />
			<input type = "hidden" name = "pagecount" value="1" />
			<input type = "hidden" name = "pagegrpnum" value="1" />
		</form>

		</section>
	</div>
</body>
</html>