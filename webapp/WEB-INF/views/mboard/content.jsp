<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항 확인</title>
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
	 /* wrap */
	#wrap{width : 1024px;}
	
	 /* table */ 
    .inwrap table {width:100%;border-spacing:0px;}
    #tbl-noticeRead th, td {line-height:30px;font-size:13pt; }
    #tbl-noticeRead th {background-color:#d9e1e8;}
    #tbl-noticeRead tr td:first-child {text-align: center}
    #tbl-noticeRead tr td:nth-child(2) {font-weight: bold; text-align : center;}
    #tbl-noticeRead tr td:nth-child(3) {text-align : center;}
    #tbl-noticeRead tr td:nth-child(4) {text-align : center;}
    #tbl-noticeRead tr td:nth-child(5) {text-align : center;}
    #tbl-noticeRead tr td#contId {height : 300px;}
	
 	 /* body */
 	body{margin : 0px; padding : 0px;}
	
	 /* header */
	#header{height:100px; background-color : #2b90d9; text-align : center; line-height:100px;  }
	h2{margin : 0 ;}
	
	/* section */
	section{width :calc(100% - 230px); height : 500px; margin-left : 230px;}
	#managerIdDiv{border:1px solid #9baec8; width : 80%; margin : 0 auto; text-align : center; height : 50px; margin-top : 80px; background-color :#2b90d9; }
	
	/* table */
	.inwrap{width : 97%;}
	#scrollDiv{ height : 65%;}
	#menubar{width : 80%;}
	#tbl-noticeRead {border : 1px solid #d9e1e8; border-collapse : collapse; width : 100%; text-align : center;}
	#tbl-noticeRead td{border : 1px solid #d9e1e8;}
	#tdId{width : 10px;}
	#menuEmpty{height: 20px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	.emptyClass{height:15px;}
	#emptySpan{width: 10px; display : inline-block;}
	 
	.inwrap .btnNoticeBox {
	display: inline-block;
	float : right;
	padding: 5px;
	margin-right : 30px;
	font-size: 1rem;
	border: 1.5px solid black
	}
	
	.inwrap .btnListBox {
	display: inline-block;
	float : right;
	padding: 5px;
	font-size: 1rem;
	border: 1.5px solid black
	}
	
	
</style>
</head>
<body>
   <div id="wrap">
    <%@ include file="/WEB-INF/include/mheader.jspf" %>
   		<section class="sec-board">
 			<div id = "hDiv"><h2>게시판 조회</h2></div>	
   				<div class="inwrap">
   					<table id="tbl-noticeRead">
   						<tbody>
			   				<tr>
							    <th class="td-title">
							       글번호
							    </th>
							    <td class="td-title">
							       ${ boardVo.idx } 
							    </td>
							    <th class="td-title">
							       작성자
							    </th>
							    <td class="td-title">
							       ${ boardVo.m_id } 
							    </td>
							    <th class="td-title">
							      작성일
							    </th>
							    <td class="td-title">
							       ${ boardVo.regdate }
							    </td>
						   </tr> 
						   <tr>
							    <th>
							       제목
							    </th>
							    <td colspan="5" >
							      ${ boardVo.title }       
							    </td>
						   </tr>
						   <tr>
							    <th>
							       내용
							    </th>
							    <td id ="contId" colspan="5" style="width:80%;" >
									${ boardVo.cont }
							    </td>
						   </tr>
						   </tbody>
				</table>
	   <div class ="btnListBox">
	      	<a href="/Management/Board/List?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }" id="btnNoticeList">목록으로</a>
	   </div>
       <div class ="btnListBox">
	   		<a href="/Management/Board/UpdateForm?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }&idx=${ boardVo.idx }">수정</a>&nbsp;&nbsp;
	   </div>
	  
	  
	   <div class = "btnNoticeBox">
	   	 	<a href="/Management/Board/WriteForm?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }&bnum=0&lvl=0&step=0&nref=0" id="btnNoticeWrite">새글 쓰기</a>
	   </div> 
	
	  <%-- <c:choose>
	  <c:when test="${ boardVo.m_id eq sessionScope.login.m_id }">
	  	<a href="/Board/UpdateForm?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }&idx=${ boardVo.idx }">수정</a>&nbsp;&nbsp;
	  	<a href="/Board/Delete?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }&idx=${ boardVo.idx }">삭제</a>
      </c:when>
      <c:when test="${ sessionScope.login.m_id eq 'admin' }">
	  	<a href="/Board/WriteForm?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }&bnum=${ boardVo.bnum }&lvl=${ boardVo.lvl }&step=${ boardVo.step }&nref=${ boardVo.nref }">답글 쓰기</a>&nbsp;&nbsp;
	  	<a href="/Board/Delete?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }&idx=${ boardVo.idx }">삭제</a>
      </c:when>
      </c:choose> --%>
 	
   </div>
   </section>
   </div>
</body>
</html>
