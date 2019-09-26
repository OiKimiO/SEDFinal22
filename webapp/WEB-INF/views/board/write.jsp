<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
    
<title>공지사항 작성</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cBoardStyle.css">
<script src="/js/WriteForm.js"></script>
</head>
<body>
   <div id="wrap">
   <%@ include file="/WEB-INF/include/cheader.jspf" %>
    <section class="sec-board">
    <div id="intro-notice" class="intros">
    <h3>공지사항
    <br>
    <span>이 페이지는 공지사항 페이지이다.</span>
    </h3>
    </div>
   <!-- <div style="text-align:center;background-color:black;color:white;width:520px;margin:0 auto;height:60px;font-size:30px;font-weight:bold;text-align: center;padding-top:15px;">Q&A 질문하기</div>
    --><!-- 자료입력부분 -->
   <div class="inwrap">
   <form action="/Board/Write" method="POST" enctype="multipart/form-data" id="frmWrite">
   <table id="tbl-noticeWrite">
   <tbody>
   <tr>
    <th class="td-title">
       작성자
    </th>
    <td class="td-title">
       <input type="text" name="m_id" size="15" value="M001" readonly  style="width:100%;height:100%; font-size:15px;" /> 
    </td>
   </tr> 
   <tr>
    <th>
       제목
    </th>
    <td width="400" >
       <input type="text" id="title" name="title" size="15" value="" style="width:100%;height:100%;font-size:15px;" /> 
    </td>
   </tr> 
   <tr>
    <th>
       내용
    </th>
    <td width="400" >
       <textarea name="cont" id="cont"></textarea>        
    </td>
   </tr>
   
   <!-- <tr>
    <td width="500" align="center" colspan = "2">
        <input type="submit" value="질문 등록" id="btnSubmit" style="width:100%;height:100%;font-size:18px;font-weight:bold;background-color:#CCC;border: gray;"/>     
    </td>
   </tr> -->
   <%-- <tr>
    <td width="500" align="right" colspan = "2">           
        <a href="/Board/List?nowpage=${ map.nowpage }&pagegrpnum=${ map.pagegrpnum  }">목록</a>&nbsp;  
    </td>
   </tr> --%>
   </tbody>
   </table>
    <input type="submit" value="공지사항 등록" id="btnSubmit"/>     
   <div id="btnNoticeBox">
   <a href="/Board/List?nowpage=${ map.nowpage }&pagegrpnum=${ map.pagegrpnum  }" id="btnNoticeList">목록</a>
   </div>
   <!-- 받은 정보를 다음 페이지(/PDS/Write)로 전송 -->
   <input type="hidden" name="bnum"    value="<c:out value='${ map.bnum    }'/>" />
   <input type="hidden" name="lvl"     value="<c:out value='${ map.lvl     }'/>" />
   <input type="hidden" name="step"    value="<c:out value='${ map.step    }'/>" />
   <input type="hidden" name="nref"    value="<c:out value='${ map.nref    }'/>" />
   
   <input type="hidden" name="nowpage"     value="<c:out value='${ map.nowpage     }'/>" />
   <input type="hidden" name="pagegrpnum"  value="<c:out value='${ map.pagegrpnum  }'/>" />
   </form>
   </div>
   </section>
   </div>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
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
<title>QnA 작성</title>
<script src="/js/WriteForm.js"></script>
</head>
<body>
   <div id="wrap">
   <div style="text-align:center;background-color:black;color:white;width:520px;margin:0 auto;height:60px;font-size:30px;font-weight:bold;text-align: center;padding-top:15px;">Q&A 질문하기</div>
   <!-- 자료입력부분 -->
   <div style="width:500px;margin:0 auto;" id="in_wrap">
   <form action="/Board/Write" method="POST" enctype="multipart/form-data" id="frmWrite">
   <table cellpadding="0" cellpadding="0" width="500" align="center" class="type10" >
   <tbody>
   <tr>
    <td width="100" align="center">
       작성자
    </td>
    <td width="400" >
       <input type="text" name="m_id" size="15"  style="width:100%;height:100%; font-size:15px;"/> 
    </td>
   </tr> 
   <tr>
    <td width="100" align="center">
       제목
    </td>
    <td width="400" >
       <input type="text" id="title" name="title" size="15" value="" style="width:100%;height:100%;font-size:15px;" /> 
    </td>
   </tr> 
   <tr>
    <td width="100" align="center">
       내용
    </td>
    <td width="400" >
       <textarea name="cont" id="cont" style="width:400px;height:150px;font-size:15px;"></textarea>        
    </td>
   </tr>
   
   <tr>
    <td width="500" align="center" colspan = "2">
        <input type="submit" value="질문 등록" id="btnSubmit" style="width:100%;height:100%;font-size:18px;font-weight:bold;background-color:#CCC;border: gray;"/>     
    </td>
   </tr>
   <tr>
    <td width="500" align="right" colspan = "2">           
        <a href="/Board/List?nowpage=${ map.nowpage }&pagegrpnum=${ map.pagegrpnum  }">목록</a>&nbsp;  
    </td>
   </tr>
   </tbody>
   </table>
   
   <!-- 받은 정보를 다음 페이지(/PDS/Write)로 전송 -->
   <input type="hidden" name="bnum"    value="<c:out value='${ map.bnum    }'/>" />
   <input type="hidden" name="lvl"     value="<c:out value='${ map.lvl     }'/>" />
   <input type="hidden" name="step"    value="<c:out value='${ map.step    }'/>" />
   <input type="hidden" name="nref"    value="<c:out value='${ map.nref    }'/>" />
   
   <input type="hidden" name="nowpage"     value="<c:out value='${ map.nowpage     }'/>" />
   <input type="hidden" name="pagegrpnum"  value="<c:out value='${ map.pagegrpnum  }'/>" />
   </form>
   </div>
   </div>
</body>
</html> --%>