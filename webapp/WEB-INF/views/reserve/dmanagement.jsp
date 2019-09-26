<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	$('#manageselect').click(
			function() {
				var msg = $('#manageselect option:selected').val();
				if(msg == 'userid'){
					$('#MuidDiv').html('');
					$('#ReserveDiv').html('');
					$('#MuidDiv').html('<form action="/Reserve/Management/Id" method="post" id = "frm"></form>');
					$('#frm').append('<input type="text"   name ="m_uid" 	   placeholder ="회원아이디" /> ');
					$('#frm').append('<input type="hidden"   name ="r_id"      placeholder ="예약번호" /> ');
					$('#frm').append('<input type="hidden" name ="nowpage"     value="1" /> ');
					$('#frm').append('<input type="hidden" name ="pagegrpnum"  value="1" /> ');
					$('#frm').append('<input type="button" id="searchBtn"      value="검색" />  ');	
				}else{
					if(msg =='reserve'){ 
						$('#MuidDiv').html('');
						$('#ReserveDiv').html('');
						$('#ReserveDiv').html('<form action="/Reserve/Management/RId" method="post" id = "frm"></form>');
						$('#frm').append('<input type="hidden"   name ="m_uid" 		 placeholder ="회원아이디" /> ');
						$('#frm').append('<input type="text"   name ="r_id"      placeholder ="예약번호" /> ');
						$('#frm').append('<input type="hidden" name ="nowpage"     value="1" /> ');
						$('#frm').append('<input type="hidden" name ="pagegrpnum"  value="1" /> ');
						$('#frm').append('<input type="button" id="searchBtn"      value="검색" />  ');	
					}
				}
				
		
			});
}) 
$(function(){
	 $(document).on('click','#searchBtn',function(){
		 $.ajax({
				url   :'/Reserve/CheckId'
				,type :'post' 
				,data : {
					 m_uid       : $('input[name=m_uid]').val() 
					,r_id        : $('input[name=r_id]').val() 
					,nowpage	 : $('input[name=nowpage]').val() 
					,pagegrpnum	 : $('input[name=pagegrpnum]').val() 
				}
				,dataType : 'json'
				,success  : function(data){
					console.log(data);						
					if(data.length == 0){
						alert('다시 검색해주세요!');
						return false;
						$('#frm').attr('onsubmit','event.preventDefault();');						
					}else{
						location.href="/Reserve/Management/Id?m_uid="+$('input[name=m_uid]').val()+"&r_id=" + $('input[name=r_id]').val() + 
									  "&nowpage="+$('input[name=nowpage]').val()+"&pagegrpnum="+$('input[name=pagegrpnum]').val()+"";
					}
				
					 $.ajax({
							url   :'/Reserve/Checkmng'
							,type :'post' 
							,data : {
								 m_uid       : $('input[name=m_uid]').val() 
								,r_id        : $('input[name=r_id]').val() 
							}
							,dataType : 'json'
							,success  : function(data){
								console.log(data);						
								if(data.e_count == 0){
									alert('다시 검색해주세요!');
									return false;
									$('#frm').attr('onsubmit','event.preventDefault();');						
								}else{
									if(data.m_count == 0){
										alert('다시 검색해주세요!');
										return false;
										$('#frm').attr('onsubmit','event.preventDefault();');
										}else{
											location.href="/Reserve/Management/Id?m_uid="+$('input[name=m_uid]').val()+"&r_id=" + $('input[name=r_id]').val() + 
											  "&nowpage="+$('input[name=nowpage]').val()+"&pagegrpnum="+$('input[name=pagegrpnum]').val()+"";
										}
									
								}
					
							}
				
				
				
	
		 	}) // ajax end
		}
		 })
		})// search button
}) 



</script>
<title>관리자 예약확인</title>
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
    .inwrap table#tlb-Reserve {width:100%;border-spacing:0px;}
    #tlb-Reserve th, td {line-height:30px;font-size:13pt; }
    #tlb-Reserve th {background-color:#d9e1e8;}
    #tlb-Reserve tr td:first-child {text-align: center}
    #tlb-Reserve tr td:nth-child(2) {font-weight: bold; text-align : center;}
    #tlb-Reserve tr td:nth-child(3) {text-align : center; width : 60%;}
    #tlb-Reserve tr td:nth-child(4) {text-align : center;}
    #tlb-Reserve tr td:nth-child(5) {text-align : center;}
	
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
	#tlb-Reserve {border : 1px solid #d9e1e8; border-collapse : collapse; width : 100%; text-align : center;}
	#tlb-Reserve td{border : 1px solid #d9e1e8;}
	#tdId{width : 10px;}
	#menuEmpty{height: 20px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	#tlb-paging{margin-left: 80px;}
 	.LeftDiv{float:left;}
 	#MuidDiv{margin-left:10px;}
 	#ReserveDiv{margin-left:10px;}
</style>
</head>
<body>
	<div id = "Mdiv">
	<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>
    	<div id = "hDiv"><h2>고객 예약/결과 조회</h2></div>

			
				 	**검색하시고 싶은 회원 아이디 혹은 예약번호를 클릭 후 검색하세요!			
				<br/>
				<div class ="LeftDiv">
				<select id="manageselect">
						<option value="userid">회원아이디</option>
						<option value="reserve">예약번호</option>
				</select>
				</div>
				<div id ="MuidDiv" class ="LeftDiv">
				<form action="/Reserve/Management/Id" method="post" id = "frm">						
				 	<input type="text"   name ="m_uid" 		 placeholder ="회원아이디" /> 	
				 	<input type="hidden"   name ="r_id"      placeholder ="예약번호" />
				 	<input type="hidden" name ="nowpage"     value="1" /> 	
				 	<input type="hidden" name ="pagegrpnum"  value="1" /> 	
				 	<input type="button" id="searchBtn"      value="검색" /> 
				 </form>
				 </div>
				 <div id="ReserveDiv" class ="LeftDiv">
				 </div>
			<br/>
			
			<div class="inwrap">
				<table id ="tlb-Reserve">
					<tr>
						<th>예약번호</th>
						<th>회원아이디</th>
						<th>처리일자</th>
						<th>처리상태</th>
					</tr>
					<c:forEach var= "ReserveList" items="${ReserveList}" >
						<tr>
							<td>${ReserveList.r_id }</td>
							<td><a href="/Reserve/DetailManagement?rs_id=${ReserveList.rs_id}&m_uid=${ReserveList.m_uid}&r_id=${ReserveList.r_id }">${ReserveList.m_uid }</a></td>
							<td>${ReserveList.fin_date }</td>
							<td>${ReserveList.r_result }</td>
						</tr>
					</c:forEach>
					
				</table>
				<%@include file="/WEB-INF/include/mngpaging.jspf"%>
			</div>
		</section>
</div>
</body>
</html>