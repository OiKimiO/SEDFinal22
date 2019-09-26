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
    #tbl-noticeList tr td:first-child {text-align: center  }
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
	
	input[type=text]{}
	
    </style>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

</head>
<body>
<div id="wrap">
    <%@ include file="/WEB-INF/include/mheader.jspf" %>
   		<section class="sec-board">
 			<div id = "hDiv"><h2>게시판 조회</h2></div>	
   				<div class="inwrap">
   					 <form action="/Management/Board/Update" method="POST" enctype="multipart/form-data" id="updateForm">
						   <table id = "tbl-noticeList" cellpadding="0" cellpadding="0" width="500" align="center" class="type10">
						   <tbody>
						   <tr>
						    <td width="100"  align="center" style="background-color:#d9e1e8; height: 50px;">
						       작성자
						    </td>
						    <td width="400" style="" >
						       <input type="text" name="m_id" size="15" value="${ boardVo.m_id }" readonly="readonly" style="width:100%; padding-left:20px;  height: 50px; font-size:15px;"/> 
						    </td>
						   </tr> 
						   <tr>
						    <td width="100" align="center" style="background-color:#d9e1e8; height: 50px;">
						       제목
						    </td>
						    <td width="400" >
						       <input type="text" name="title" id="title" size="15" value="${ boardVo.title }" style="width:100%; padding-left:20px; height: 50px; font-size:15px;"/> 
						    </td>
						   </tr> 
						   <tr>
						    <td width="100" align="center" style="background-color:#d9e1e8; ">
						       내용
						    </td>
						    <td  >
						       <textarea name="cont" id="cont" style="width:100% ; height: 150px; padding-left:20px; padding-top : 10px; font-size:15px;">${ boardVo.cont }</textarea>        
						    </td>
						   </tr>
						   
						   <tr>
						    <td width="500" align="center" colspan = "2">
						        <input type="submit" value="질문 등록" id="btnSubmit" style="width:100%;height:100%;font-size:18px;font-weight:bold;background-color : white;border:0px;"/>     
						    </td>
						   </tr>
						   <tr>
						    <td width="500" align="right" colspan = "2">           
						        <!-- <a href="/Board/List?nowpage=1&pagecount=1&pagegrpnum=1">목록</a>&nbsp;  
 -->						        <a href="/Management/Board/List?nowpage=1&pagecount=1&pagegrpnum=1">목록</a>&nbsp;  
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
   		</section>
</div>
   				
   				
  
   
</body>
</html>