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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	/* $("select[name=cate_id]").val("${kList.cate_id}").prop("selected", true);
	$("select[name=c_id]").val("${kList.c_id}").prop("selected", true);
	
	$('#homebtn').click(function(){
		location.href = "/Engineering?nowpage=1&pagegrpnum=1&cate_id=C&c_id=C";
	})

	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
	});
	
	$('#input_img').click(function(){
		$('#hiddenInput').remove();
		
	}) */
	
	/* $('input[type=file]').click(function(){
		var arrayNum = $(this).val().split("\\");
		$('#e_img').val(arrayNum[2]); 
		alert(arrayNum[2]);		
	}) */
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
/* 		console.log(files);
		console.log(filesArr); */
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
				$('#e_img').val(files[0].name); 
			}
			reader.readAsDataURL(f);
		});
	}
	

})

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
	
	 /* header */
	#header{height:100px; background-color : #2b90d9; text-align : center; line-height:100px;  }
	#underHeader{height : 20px; background-color : #d9e1e8;}
	h2{margin : 0 ;}
	
	/*nav ul */
	nav{float: left;}
	ul#navbar { list-style-type: none;  width : 200px; background-color : #9baec8; padding : 0; margin : 0; }
	ul#navbar li{ height: 50px; font-size : 15px; line-height : 50px; text-align : center; font-size : 18px; border: 1px solid #282c37;    }
	.classA{text-decoration : none;}
	
	/* section */
	section{width :calc(100% - 230px); height : 500px; margin-left : 230px;}
	#managerIdDiv{border:1px solid #9baec8; width : 80%; margin : 0 auto; text-align : center; height : 50px; margin-top : 80px; background-color :#2b90d9; }
	
         
	#inwrap{width:1024px;margin:0 auto}
	#entireDiv{border:0px solid #282c37;}
	.FrameDiv{border : 0px solid #282c37; width:27%; height:210px; margin-top : 40px; float: left;}
	.imgFrameDiv{border : 0px solid #282c37; width:201px; height:100px; float : left; }
	.selectFrameDiv{border : 0px solid #282c37; width:280px;; height:100px; float : left; margin-top : 40px;}
	#btnIdFrame{margin-top : 0; width : 45%; margin-left : 480px;}
	
	.selectBox{width : 200px; height : 50px;}
	.inputText{width : 245px; height:30px; border : none; border-bottom : 1px solid #282c37; opacity : 0.9;}
	.floatDiv{float : left;}
	.FrameDiv .btn{display:inline-block; width:30%; height:50px; text-decoration : none; text-align : center; line-height: 50px;  
				   background-color : #d9e1e8; color : #282c37;}
	#imgDiv{border : 0px solid #282c37; width:40%; margin : 0 auto;}
	#firstDiv{ border : 0px solid black; height:210px;}
	.imgDiv{width:19px; height : 18px; float:left;}
	.imgs{width:100%; height : 100%;}
	#nameinput{width:85%;}
	#pictureDiv{width:150px; height:150px; }
	div#hDiv h2{padding : 30px 0; color : black;}

</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
			<section>
				<form action ="/EUpdateProcess" method = "post" enctype="multipart/form-data">
		<div id = "inwrap">
			<div class= "imgFrameDiv" id ="firstDiv">
			<div id = "hDiv"><h2>기사 수정 페이지</h2></div>
				<br/>
				<br/>
				<!-- 기사 사진 추가  -->
				<div id ="pictureDiv"> 
					<img id="img" class ="imgs" src="/img/${kList.e_img}" />
				</div>
				<div id ="imgbtninsert"> 	
					<input type="file" id = "input_img" name="e_img"  />
					<input id = "hiddenInput" type="hidden" name="e_img" value="${kList.e_img}" />
				</div>
			</div>
			
			<div class= "FrameDiv" id ="firstDiv">
				<!-- 기사 번호  -->
				<div>
					<span>기사 번호</span><br /><br />
					<span>${userInfo.e_id}</span>
				</div>
				<br />
				<!-- 이름  -->
				<div>
					<span>이름</span><br /><br />
					<span>${userInfo.e_name}</span>
				</div>
				<br />
				<!-- 전화번호  -->
				<div>
					<span>전화번호</span><br /><br />
					<span>${userInfo.e_tel}</span>
				</div>
				<br />
				<!-- 소속 센터  -->
				<div>
					<span>소속 센터</span><br /><br />
					<span>${userInfo.c_name}</span>
				</div>
				<br />
				<!-- 전문 분야  -->
				<div>
					<span>전문 분야</span><br /><br />
					<span>${userInfo.cate_name}</span>
				</div>
				<br />
			

				<div id = "btnIdFrame" class= "FrameDiv">
				<br/>
						<!-- 저장,재입력 버튼 -->
						<input type="submit" id = "savebtn" 	class="btn" value = "변경내용저장" />
						
				</div>
			
		</div>
	</form>
			
			
			<input type="button" id = "homebtn"	    class="btn" value = "홈으로" />
			
			
				<table>
				<tr>
					<th>기사 번호</th>
					<td>${userInfo.e_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userInfo.e_name }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${userInfo.e_tel }</td>
				</tr>
				<tr>
					<th>소속 센터</th>
					<td>${userInfo.c_name }</td>
				</tr>
				<tr>
					<th>전문 분야</th>
					<td>${userInfo.cate_name }</td>
				</tr>
				</table>
			</section>
		<%@ include file="/WEB-INF/include/efooter.jspf"%>
	</div>
</body>
</html>
				