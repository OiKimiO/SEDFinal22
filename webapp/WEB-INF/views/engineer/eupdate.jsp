<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Engineer update page</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
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
	$("select[name=cate_id]").val("${kList.cate_id}").prop("selected", true);
	$("select[name=c_id]").val("${kList.c_id}").prop("selected", true);
	
	$('#homebtn').click(function(){
		location.href = "/Engineering?nowpage=1&pagegrpnum=1&cate_id=C&c_id=C";
	})

	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
	});
	
	$('#input_img').click(function(){
		$('#hiddenInput').remove();
		
	})
	
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
<div id = "Mdiv">
<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>
	<form action ="/EUpdateProcess" method = "post" enctype="multipart/form-data">
		<div id = "inwrap">
			<div class= "imgFrameDiv" id ="firstDiv">
			<div id = "hDiv"><h2>기사 수정 페이지</h2></div>
				<br/>
				<br/>
				<!-- 기사 사진 추가  -->
				<div id ="pictureDiv"> 
					<img id="img" class ="imgs" src="/image/${kList.e_img}" />
				</div>
				<div id ="imgbtninsert"> 	
					<input type="file" id = "input_img" name="e_img"  />
					<input id = "hiddenInput" type="hidden" name="e_img" value="${kList.e_img}" />
				</div>
			</div>
			
			<div class= "FrameDiv" id ="firstDiv">
				<!-- 이름  -->
				<div>
					<span>이름</span><br /><br />
					<span>${kList.e_name}</span>
				</div>
				<br />
				<!-- 아이디  -->
				<div>
					<span>아이디</span><br /><br />
					<div class ="imgDiv">
						<img id = "pwd" class="imgs" src="/img/idicon.JPG" >
					</div>
					<span>&nbsp;&nbsp;${kList.e_id}</span> 
				</div>
			<br/>
				<!-- 비밀번호  -->
			<span>비밀번호</span><br /><br />
				<div >
					<div class ="imgDiv">
						<img id = "pwd" class="imgs" src="/img/key.JPG" >
					</div>
					<input type = "password" class="inputText" name = "e_pwd" value="${kList.e_pwd }" required/>
				</div>
			<br/>	
			<!-- 전화번호 -->
				<span>전화번호</span><br /><br />
				<div>
					<div class ="imgDiv">
						<img id = "pwd" class="imgs"  src="/img/tel.JPG" >
					</div>
					<input type = "text" class="inputText" name = "e_tel" value = "${kList.e_tel}" required maxlength="13" onKeyup="phoneNumberChk(this);"/>
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
				<span>센터</span><br /><br />
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
			
			<br/>
			
			<div id = "btnIdFrame" class= "FrameDiv">
			<br/>
					<!-- 저장,재입력 버튼 -->
					<input type="submit" id = "savebtn" 	class="btn" value = "변경내용저장" />
					<input type="button" id = "homebtn"	    class="btn" value = "홈으로" />
			</div>
			<input type = "hidden" name="e_id" value="${kList.e_id}" />
			<input type = "hidden" name = "nowpage" value="1" />
			<input type = "hidden" name = "pagecount" value="1" />
			<input type = "hidden" name = "pagegrpnum" value="1" />
		</div>
	</form>
	</section>
</div>
</body>
</html>