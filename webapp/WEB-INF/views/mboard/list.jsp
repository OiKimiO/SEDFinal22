<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항</title>
    
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>    
$(function(){
$('#delbtn').click(function(){
		var arrayNum = new Array(); 
		var chk_count = 0;
		$("input:checkbox[name=RowCheck]:checked").each(function() {
			    chk_count = chk_count + 1;
				arrayNum.push($(this).val());									
	       })
	   location.href="/Management/Board/Delete?nowpage=1&pagegrpnum=1&idx=" + arrayNum + "&check_count="+chk_count+"";    
		
				
	})// delete button
})
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
    #tbl-noticeList th, td {line-height:30px;font-size:13pt; }
    #tbl-noticeList th {background-color:#d9e1e8;}
    #tbl-noticeList tr td:first-child {text-align: center}
    #tbl-noticeList tr td:nth-child(2) {font-weight: bold; text-align : center;}
    #tbl-noticeList tr td:nth-child(3) {text-align : center;}
    #tbl-noticeList tr td:nth-child(4) {text-align : center;}
    #tbl-noticeList tr td:nth-child(5) {text-align : center;}
	
	 /* wrap */
	#wrap{width : 1024px;}
	
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
	#tbl-noticeList {border : 1px solid #d9e1e8; border-collapse : collapse; width : 100%; text-align : center;}
	#tbl-noticeList td{border : 1px solid #d9e1e8;}
	#tdId{width : 10px;}
	#menuEmpty{height: 20px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	.emptyClass{height:15px;}
	#emptySpan{width: 10px; display : inline-block;}
	 
	.inwrap #btnNoticeBox {
	display: inline-block;
	float : right;
	padding: 5px;
	font-size: 1rem;
	border: 1.5px solid black
	}
	
	
	
</style>
</head>
<body>
    <!-- table -->
    <div id="wrap">
    <%@ include file="/WEB-INF/include/mheader.jspf" %>
    <section class="sec-board">
	    <div id = "hDiv"><h2>게시판 조회</h2></div>				
	    <div class="inwrap">
	     	<table id="tbl-noticeList">
	   		<thead>
	   			<tr>
				    <th></th>
				    <th class="th-title">번호</th>
				    <th class="th-title">글제목</th>
				    <th class="th-title">글쓴이</th>
				    <th class="th-title">작성일</th>
	   			</tr>
	   		</thead>
	   <tbody>
	   <c:forEach var="board" items="${ boardList }" >
	   <tr>
	     <!-- 글의 첫부분 -->
	     <td>
	     	<input type="checkbox" name = "RowCheck" value="${ board.idx }"/>
	     </td>
	     
	     <td>         
	        ${ board.bnum }	
	     </td>
	     
	     <!-- 글이 담기는 부분 -->
	     <td>
			<a href="/Management/Board/Content?idx=${ board.idx }&pagegrpnum=${ pagegrpnum }&nowpage=${ nowpage }">
	           ${ board.title }
	        </a>       
	     </td>
	     <!-- 회원 아이디 -->
	     <td>${ board.m_id  }</td>
	     
	     <!-- 등록 일자 -->
	     <td>${ board.regdate }</td>
	     
	   </tr>
	   </c:forEach>
	  </tbody>
	
	 </table>
	
	  <div id="btnNoticeBox">
	 	<a href="/Management/Board/WriteForm?bnum=0&lvl=0&step=0&nref=0&pagegrpnum=${ pagegrpnum }&nowpage=${ nowpage }" id="btnNoticeWrite">글쓰기</a>
	  </div>
	  
	  <div id="btnNoticeBox">
	 	<a id = "delbtn" >삭제하기</a>
	  </div>
	   <%@include file="/WEB-INF/include/BoardPaging.jspf"%>	
	 
	
	    </div>
    </section>
    </div>
</body>
</html>