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
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/cBoardStyle.css">
</head>
<body>
    <!-- table -->
    <div id="wrap">
    <%@ include file="/WEB-INF/include/cheader.jspf" %>
    <section class="sec-board">
    <div id="intro-notice" class="intros">
    <h3>공지사항
    <br>
    <span>이 페이지는 공지사항 페이지이다.</span>
    </h3>
    </div>
    <div class="inwrap">
     <table id="tbl-noticeList">
   <thead>
   <tr>
     <th class="th-title">번호</th>
     <th class="th-title">글제목</th>
     <th class="th-title">글쓴이</th>
     <th class="th-title">작성일</th>
   </tr>
   </thead>
   <tbody>
   <c:forEach var="board" items="${ boardList }" >
   <tr>
     <td>        
          ${ board.bnum }       
     </td>
     <td>
      	<a href="/Board/Content?idx=${ board.idx }&pagegrpnum=${ pagegrpnum }&nowpage=${ nowpage }">
                ${ board.title }
      	</a>    
     </td>
     
     
     <td>${ board.m_id  }</td>
     <td>${ board.regdate }</td>
     
   </tr>
   </c:forEach>
  </tbody>
 
 </table>

	  
	 <%@include file="/WEB-INF/include/BoardPaging.jspf"%>	   
    
    </div>
    </section>
    </div>
</body>
</html>


