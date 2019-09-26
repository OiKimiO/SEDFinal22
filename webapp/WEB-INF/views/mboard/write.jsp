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
<script src="/js/WriteForm.js"></script>
</head>
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
    .inwrap table {width:100%; border-spacing:0px;}
    #tbl-noticeWrite th, td {line-height:30px;font-size:13pt; }
    #tbl-noticeWrite th {background-color:#d9e1e8;}
    #tbl-noticeWrite tr th:first-child {text-align: center; width:20%; }
    #tbl-noticeWrite tr td:nth-child(2) {font-weight: bold; text-align : center;}
  	#cont{height : 300px; width : 100%;}
	
	 /* wrap */
	#wrap{width : 1024px;}
	
 	 /* body */
 	body{margin : 0px; padding : 0px;}
	
	 /* header */
	#header{height:100px; background-color : #2b90d9; text-align : center; line-height:100px;  }
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
	#tbl-noticeWrite {border : 1px solid #d9e1e8; border-collapse : collapse;  text-align : center;}
	#tbl-noticeWrite td{border : 1px solid #d9e1e8;}
	#tdId{width : 10px;}
	#menuEmpty{height: 20px;}
	div#hDiv h2{padding : 30px 0; color : black;}
	.emptyClass{height:15px;}
	#emptySpan{width: 10px; display : inline-block;}
	 
	.inwrap #btnNoticeBox {
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
	
	#subBtn{
	background-color : white;
	border : 0px;
	}
</style>
<body>
   <div id="wrap">
   <%@ include file="/WEB-INF/include/mheader.jspf" %>
    <section class="sec-board">
    <div id = "hDiv"><h2>게시판 조회</h2></div>	
 
   <div class="inwrap">
   <form action="/Management/Board/Write" method="POST" enctype="multipart/form-data" id="frmWrite">
   <table id="tbl-noticeWrite">
   <tbody>
   <tr>
    <th class="td-title">
       작성자
    </th>
    <td class="td-title">
       <input type="text" name="m_id" size="15"  style="width:100%;height:100%; font-size:15px;" value="M001" readonly/> 
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
    <td >
       <textarea name="cont" id="cont"></textarea>        
    </td>
   </tr>
   
   </tbody>
   </table>
   <div class ="btnListBox">
   		<!-- 수정 필요 -->
   		<input type ="submit" value="공지사항 등록" id ="subBtn" />	
   </div>
   
    <input type="hidden" value="공지사항 등록" id="btnSubmit"/>     
   <div id="btnNoticeBox">
   <a href="/Management/Board/List?nowpage=${ map.nowpage }&pagegrpnum=${ map.pagegrpnum  }" id="btnNoticeList">목록</a>
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


