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
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/cBoardStyle.css">
<style>
	.inwrap #tbl-noticeRead td:nth-child(1){width:11%;}
</style>
</head>
<body>
   <div id="wrap">
   <%@ include file="/WEB-INF/include/cheader.jspf" %>
  <!--  <div style="text-align:center;background-color:black;color:white;width:750px;margin:0 auto;height:60px;font-size:30px;font-weight:bold;text-align: center;padding-top:15px;"></div> -->
   <section class="sec-board">
   <div id="intro-notice" class="intros">
    <h3>공지사항
    <br>
    <span>이 페이지는 공지사항 페이지이다.</span>
    </h3>
    </div>
   <div class="inwrap">
   <table id="tbl-noticeRead">
   <tbody>
   <tr>
    <td class="td-title">
       글번호
    </td>
    <td class="td-title">
       ${ boardVo.idx } 
    </td>
    <td class="td-title">
       작성자
    </td>
    <td class="td-title">
       ${ boardVo.m_id } 
    </td>
    <td class="td-title">
      작성일
    </td>
    <td class="td-title">
       ${ boardVo.regdate }
    </td>
   </tr> 
   <tr>
    <td>
       제목
    </td>
    <td colspan="5" >
      ${ boardVo.title }       
    </td>
   </tr>
   <tr>
    <td>
       내용
    </td>
    <td colspan="5" >
      ${ boardVo.cont }       
    </td>
   </tr>
   </tbody>
   </table>
    <div class ="btnListBox">
	      	<a href="/Board/List?nowpage=${ nowpage }&pagegrpnum=${ pagegrpnum }" id="btnNoticeList">목록으로</a>
	   </div>
     
   </div>
   </section>
   </div>
</body>
</html>
