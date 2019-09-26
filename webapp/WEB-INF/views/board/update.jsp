<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <style>
        /* 웹 폰트 */
        @font-face { font-family: 'GoyangIlsan'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); 
        font-weight: normal; font-style: normal; }

        /* default 설정 */
    * {padding:0; margin:0; box-sizing: border-box; text-decoration: none; list-style: none; color:#282c37; font-family: 'GoyangIlsan'}

        /* header */
    #header {height:70px}
    #header #mainNav:hover {height:200px;transition-duration: 2s}
    .inwrap {width:1024px;margin: 0 auto}
    .mainLogo {float:left;width:230px;height:70px;background-color:#ddd;margin-right:50px}
    #mainNav {width:calc(100% - 335px);float:left;height:70px;float:right;}
    #mainNav > ul {color:#ddd}
    #mainNav > ul#mainMenu > li {float:left; line-height:70px; font-size:14pt; margin-right:100px}
    #mainNav > ul#mainMenu > li:last-child {margin-right:0px}
    #mainNav > ul#mainMenu > li > ul.subMenu > li {line-height:30px; font-size:12.5pt}
    #mainNav > ul#myMenu {float:right;}
    #mainNav > ul#myMenu > li {float:left; line-height:110px; font-size:11pt; margin-right:30px}
    #mainNav > ul#myMenu > li:last-child {margin-right:0px}
    #subNav {width:100%;height:40px;background-color:#ddd;clear:both}
    #subNav ul#myMenu {float:right}
    #subNav ul#myMenu > li {float: left;margin-right:30px;line-height:40px}
    #subNav ul#myMenu > li:last-child {font-size:11pt;margin-right:0px}


        /* table */
    .inwrap table {width:100%;border-spacing:0px;}
    #notice th, td {line-height:50px;font-size:13pt;border-bottom:1px solid black;}
    #notice th {border-bottom:2px solid black;background-color:#eee}
    #notice tr td:first-child {text-align: center}
    #notice tr td:nth-child(2) {padding-left:30px;font-weight: bold}
    #notice tr td:nth-child(3) {text-align: right;padding-right:15px}
    </style>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

</head>
<body>
   <div id = "wrap">
   <div style="text-align:center;background-color:black;color:white;width:520px;margin:0 auto;height:60px;font-size:30px;font-weight:bold;text-align: center;padding-top:15px;">질문글 수정</div>
   <!-- 자료입력부분 -->
   <div style="width:500px;margin:0 auto;" id="in_wrap">
   <form action="/QNA/Update" method="POST" enctype="multipart/form-data" id="updateForm">
   <table cellpadding="0" cellpadding="0" width="500" align="center" class="type10">
   <tbody>
   <tr>
    <td width="100" align="center">
       작성자
    </td>
    <td width="400" >
       <input type="text" name="m_id" size="15" value="${ boardVo.m_id }" readonly="readonly" style="width:100%;height:100%; font-size:15px;"/> 
    </td>
   </tr> 
   <tr>
    <td width="100" align="center">
       제목
    </td>
    <td width="400" >
       <input type="text" name="title" id="title" size="15" value="${ boardVo.title }" style="width:100%;height:100%; font-size:15px;"/> 
    </td>
   </tr> 
   <tr>
    <td width="100" align="center">
       내용
    </td>
    <td width="400" >
       <textarea name="cont" id="cont" style="width:400px;height:150px;font-size:15px;">${ boardVo.cont }</textarea>        
    </td>
   </tr>
   
   <tr>
    <td width="500" align="center" colspan = "2">
        <input type="submit" value="질문 등록" id="btnSubmit" style="width:100%;height:100%;font-size:18px;font-weight:bold;background-color:#CCC;border: gray;"/>     
    </td>
   </tr>
   <tr>
    <td width="500" align="right" colspan = "2">           
        <a href="/Board/List?nowpage=1&pagecount=2&pagegrpnum=1">목록</a>&nbsp;  
    </td>
   </tr>
   </tbody>
   </table>
   
   <!-- 받은 정보를 다음 페이지(/PDS/Write)로 전송 -->
   <input type="hidden" name="idx"	   	   value="<c:out value='${ boardVo.idx   }'/>" />
   <input type="hidden" name="nowpage"     value="<c:out value='${ nowpage     }'/>" />
   <input type="hidden" name="pagegrpnum"  value="<c:out value='${ pagegrpnum  }'/>" />
   </form>
   </div>
   </div>
</body>
</html>