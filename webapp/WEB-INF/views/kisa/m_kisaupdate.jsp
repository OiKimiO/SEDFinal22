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
	.FrameEntried{height : 200px;  width:72%; margin : 0 auto;}
	.FrameDiv{border : 0px solid #282c37; width:50%; height:200px; margin : 0 auto;}
	.selectBox{width : 200px; height : 50px;}
	.inputText{width : 90%; height:30px; border : none;  opacity : 0.9;}
	.floatDiv{float : left;}
	.FrameDiv .btn{display:inline-block; width:48%; height:50px; text-decoration : none; text-align : center; line-height: 50px;  
				   background-color : #d9e1e8; color : #282c37;}
	#imgDiv{border : 0px solid black; width:40%; margin : 0 auto; }
	#firstDiv{ border : 0px solid black; height:250px;}
	.imgDiv{width:5%; height : 5%; float:left;}
	.imgs{width:100%; height : 100%;} 
	#nameinput{width:85%;}
	#pictureDiv{width:30%; height:150px; margin-left:140px;}
	#imgbtninsert{margin-left:180px;}
	.mintro{width : 100%; text-align : center;} 
	.FrameEntried div span{ height: 35px;
    line-height: 18px;
    width : 90%;
    display : inline-block; display : block;}
	
	.FrameEntried div span:first-child{background-color: #282c37;     color: #fff; font-weight: bold;}
</style>
</head>
<body>	
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section id="sec-eschedule">
	
			<div class="inwrap">
				<p class="mintro">
					기사 비밀번호 수정 페이지
				</p>
				<form action ="/E_Update" method = "post">
					<div class= "FrameEntried">
					<!-- 비밀번호  -->				
						<div >	
							<span>현재 비밀번호</span>
							
							<div class ="inputDiv">
								<input type = "password" class="inputText" name = "e_pwd" value=""/>
							</div>							
						</div>
						<div >
						<span>변경할 비밀번호  </span>
							
							<div class ="inputDiv">
								<input type = "password" class="inputText" name = "e_pwd2" value=""/>
							</div>
							
						</div>
						<div >
						<span>재입력</span> 
							
							<div class ="inputDiv">
								<input type = "password" class="inputText" name = "e_pwd3" value=""/>
							</div>
							 
						</div>
					</div>
					
					<br/>
					
					<div class= "FrameDiv">
							<!-- 저장,재입력 버튼 -->
							<input type="submit" id = "savebtn" 	class="btn" value = "확인" />
							<input type="button" id = "homebtn"	    class="btn" value = "홈으로" />
					</div>
					<input type = "hidden" name="e_id" value="${kList.e_id}" />
					
						
				</form>
			</div>
		</section>
		
	</div>
<%@ include file="/WEB-INF/include/efooter.jspf"%>
</body>
</html>