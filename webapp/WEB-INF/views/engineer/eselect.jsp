<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	var c_id      = $('select[name=c_id]').val();
	var cate_id    = $('select[name=cate_id]').val();

	$('select[name=c_id]').change(function() {
	     c_id = $(this).val();  
	});
	
	$('select[name=cate_id]').change(function() {
		cate_id = $(this).val();  
	});
	
	$('#selctbtn').click(function(){
		location.href="/DetailEngineering?c_id=" + c_id + "&cate_id=" + cate_id + "&nowpage=1&pagegrpnum=1";
	})
	
	
	
	$('#addbtn').click(function(){
		location.href="EInsert";
	}) // addbtn click
	
	
	$('#deletebtn').click(function(){
		var arrayNum = new Array(); 
		var chk_count = 0;
		$("input:checkbox[name=RowCheck]:checked").each(function() {
			    chk_count = chk_count + 1;
				arrayNum.push($(this).val());									
	       })
	   location.href="/EDelete?e_id=" + arrayNum + "&check_count=" + chk_count + "&nowpage=1&pagegrpnum=1&c_id=" + c_id + "&cate_id=" + cate_id + "";    
	   				
				
	})// delete button
});
</script>
<style>
 	 /* 웹 폰트 */
    @font-face { font-family: 'GoyangIlsan'; 
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); 
    font-weight: normal; font-style: normal; }
        
	 /*Div*/
	.FrameDiv{border : 0px solid #282c37; width:80%; height:1000px; margin : 0 auto;}
	#emptyDiv{height :200px; }
	.btn{display:inline-block; width:30%; height:50px; text-decoration : none; text-align : center; line-height: 50px;  
				   background-color : #d9e1e8; color : #282c37;}
	
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
	
	 /* table */ 
    .inwrap table {width:100%;border-spacing:0px;}
    #KSelect th, td {line-height:30px;font-size:13pt; }
    #KSelect th {background-color:#d9e1e8;}
    #KSelect tr td:first-child {text-align: center}
    #KSelect tr td:nth-child(2) {font-weight: bold; text-align : center;}
    #KSelect tr td:nth-child(3) {text-align : center;}
    #KSelect tr td:nth-child(4) {text-align : center;}
    #KSelect tr td:nth-child(5) {text-align : center;}
	
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
	
	/* table */
	.inwrap{width : 97%;}
	#scrollDiv{ height : 65%;}
	#menubar{width : 80%;}
	#KSelect {border : 1px solid #d9e1e8; border-collapse : collapse; width : 100%; text-align : center;}
	#KSelect td{border : 1px solid #d9e1e8;}
	#tdId{width : 10px;}
	#menuEmpty{height: 20px;}
	ul#mainMenu li{float : left;}
	ul#mainMenu li div#menuEmpty{float:left; width : 40px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	.emptyClass{height:15px;}
	#emptySpan{width: 10px; display : inline-block;}
	 
</style>
</head>  
<body>
<div id = "Mdiv">
	<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>
				
				<div id = "hDiv"><h2>전체 기사 조회</h2></div>
				
					<span>센터 이름</span> 
						<select class="selectBox" id="c_id" name = "c_id">
							<option value="C">전체</option>
							<c:forEach var = "center" items="${selectCenter}">
								<option value="${center.c_id}">${center.c_name}</option>
							</c:forEach>
						</select>
					
					<span id ="emptySpan"></span>
					<span>수리 분야</span> 
					
						<select class="selectBox" id ="cate_id" name ="cate_id">
							<option value="C">전체</option>
							<c:forEach var = "category" items="${selectCate}">
								<option value="${category.cate_id}">${category.cate_name}</option>
							</c:forEach>
								
						</select>
						<input type = "button" id = "selctbtn" value="선택찾기" />
						<br/><br/>
						
						
					
						** 삭제시에는 반드시 체크버튼을 클릭해주세요! 	<input type = "button" id = "deletebtn" value="삭제하기" />
						<input type ="button" id = "addbtn" value="기사 추가하기" />  
						<div class="emptyClass"></div>
						<br/> 
			 <div class="inwrap">
				<table id = "KSelect">
					<tr>
						<th></th>
						<th>기사 아이디</th>
						<th>기사 이름</th>
						<th>센터 이름</th>
						<th>수리 분야</th>
						<th>전화번호</th>
					</tr>
					<c:forEach var = "kList" items="${kList}" >
						<tr>
							<td><input type="checkbox" name = "RowCheck" value="${kList.e_id}"/></td>
							<td>${kList.e_id}</td>
							<td><a href="/EUpdate?e_id=${kList.e_id}">${kList.e_name}</a></td>
							<td>${kList.c_name}</td>
							<td>${kList.cate_name}</td> 
							<td>${kList.e_tel}</td>
						</tr>
					</c:forEach>
				</table>
					<%@include file="/WEB-INF/include/Engpaging.jspf"%>			
		<div id = "fileDiv"></div>
			 </div>
		</section>
</div>


		  
		
			
	
</body>
</html>