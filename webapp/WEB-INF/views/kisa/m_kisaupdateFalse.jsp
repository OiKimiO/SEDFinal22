<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
// 	$("select[name=cate_id]").val("${kList.cate_id}").prop("selected", true);
// 	$("select[name=c_id]").val("${kList.c_id}").prop("selected", true);
	
	$('#homebtn').click(function(){
		location.href = "/EngineerMain";
	})
	
// 	$(document).ready(function(){
// 		$("#input_img").on("change", handleImgFileSelect);
// 	});
	
// 	function handleImgFileSelect(e){
// 		var files = e.target.files;
// 		var filesArr = Array.prototype.slice.call(files);
		
// 		filesArr.forEach(function(f){
// 			if(!f.type.match("image.*")){
// 				alert("확장자는 이미지 확장자만 가능");
// 				return;
// 			}
			
// 			sel_file = f;
			
// 			var reader = new FileReader();
// 			reader.onload = function(e){
// 				$("#img").attr("src", e.target.result);
// 			}
// 			reader.readAsDataURL(f);
// 		});
// 	}
	
 })
</script>
<style>
/* 웹 폰트 */
        @font-face { font-family: 'GoyangIlsan'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); 
        font-weight: normal; font-style: normal; }
          
	#inwrap{width:1024px;margin:0 auto}
	#entireDiv{border:0px solid #282c37;}
	.FrameDiv{border : 0px solid #282c37; width:50%; height:100px; margin : 0 auto;}
	.selectBox{width : 200px; height : 50px;}
	.inputText{width : 80%; height:30px; border : none; border-bottom : 1px solid #282c37; opacity : 0.9;}
	.floatDiv{float : left;}
	.FrameDiv .btn{display:inline-block; width:30%; height:50px; text-decoration : none; text-align : center; line-height: 50px;  
				   background-color : #d9e1e8; color : #282c37;}
	#imgDiv{border : 0px solid black; width:40%; margin : 0 auto;}
	#firstDiv{ border : 0px solid black; height:250px;}
	.imgDiv{width:5%; height : 5%; float:left;}
	.imgs{width:100%; height : 100%;} 
	#nameinput{width:85%;}
	#pictureDiv{width:30%; height:150px; margin-left:140px;}
	#imgbtninsert{margin-left:180px;}
</style>
</head>
<body>
	<h1>현재 비밀번호가 틀리거나 새로운 비밀번호가 일치하지 않습니다.</h1>
	<div id = "entireDiv">
	<form action ="" method = "post">
		<div id = "inwrap">
	
			<div class= "FrameDiv">
					<!-- 저장,재입력 버튼 -->
					<input type="button" id = "homebtn"	    class="btn" value = "홈으로" />
			</div>
			<input type = "hidden" name="e_id" value="${kList.e_id}" />
		</div>
	</form>
	</div>
</body>
</html>