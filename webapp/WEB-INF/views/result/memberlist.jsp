<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>업무 진행 사항</title>
    <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        /* 웹 폰트 */
        @font-face { font-family: 'GoyangIlsan'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); 
        font-weight: normal; font-style: normal; }

        /* default 설정 */
      * {padding:0; margin:0; box-sizing: border-box; text-decoration: none; list-style: none; color:#282c37; font-family: 'GoyangIlsan'}
     /* Mdiv */
   #mDiv{width : 1024px; }
     /* body */
    body{margin : 0px; padding : 0px;}
   
    /* header */
   #header{height:100px; background-color : #2b90d9; text-align : center; line-height:100px;  }
   #underHeader{height : 20px; background-color : #d9e1e8;}
   h2{margin : 0 ;}
   
   /*nav ul */
   nav{float: left;}
   ul{ list-style-type: none;  width : 200px; background-color : #9baec8; padding : 0; margin : 0; }
   ul#navbar li{ height: 50px; font-size : 15px; line-height : 50px; text-align : center; font-size : 18px; border: 1px solid #282c37;    }
   .classA{text-decoration : none;}
   
   /* section */
   section{width : 79%; height : 500px; margin-left : 240px;}
   #managerIdDiv{border:1px solid #9baec8; width : 80%; margin : 0 auto; text-align : center; height : 50px; margin-top : 80px; background-color :#2b90d9; }
       

        /* table */
    .inwrap table {width:100%;border-spacing:0px;}
    #result th, td {line-height:50px; font-size:15px; border-bottom:1px solid black; text-align : center;}
    #result th {background-color:#d9e1e8;}
    #result tr td:first-child {text-align: center}
    #result tr td:nth-child(2) {font-weight: bold}
    #result tr td:nth-child(3) {text-align: center;}
    div#hDiv h2{padding : 30px 0; color : black;}
    #result{width:100%;}
    </style>
    <script>
 /*    $(document).on('click', '#btnEng', function(e){
    	e.preventDefault();
		var e_name = document.getElementById("e_name");
		var url = "/Result/Eng";

		url = url + "?e_name= " + $( 'input#e_name' ).val();

		location.href = url;

		console.log(url);

    });    
    $(document).on('click', '#btnCli', function(e){
    	e.preventDefault();
		var c_name = document.getElementById("c_name");
		var url = "/Result/Cli";

		url = url + "?c_name= " + $( 'input#c_name' ).val();
		
		location.href = url;

		console.log(url);

    });  */   
    $(document).on('click', '#date', function(e){
    	e.preventDefault();
    	
		var s_date = document.getElementById("s_date");
		var f_date = document.getElementById("f_date");
		var ss_date = s_date.value.replace('-','');
		var sss_date = ss_date.replace('-','');
		var ff_date = f_date.value.replace('-','');
		var fff_date = ff_date.replace('-','');
		var url = "/Result/Date";
		url +="?s_date=" + sss_date;
		url +="&f_date=" + fff_date;
		console.log(url);
		location.href = url;

    }); 

    </script>
</head>
<body>
<div id = "mDiv">
  	<%@ include file="/WEB-INF/include/mheader.jspf" %>
     <!-- section  -->
      <section>
    <!-- table -->
    <div class="inwrap">
    <div id = "hDiv"><h2>업무 진행 사항 관리</h2></div>
    

   **검색하고 싶은 항목을 클릭하세요<br/><br/>
    <form  action="/Result/List" method="post">
	    <input type="radio" name="r_result" value="2"  checked="checked"/> 방문완료된 예약조회
		<input type="radio" name="r_result" value="0"  /> 예약완료된 예약조회
		<input type="radio" name="r_result" value="1"  /> 예약취소된 예약조회
		<input type="hidden" name="nowpage" value="1"  /> 
		<input type="hidden" name="pagegrpnum" value="1"  /> 
		
		<input type="submit" id="searchId" value="예약별 검색"/>
	<br/><br/>
	</form>
	
	
	<form action = "/Result/Cli" method="post">
	회원별 조회 *회원님 성함을 입력하세요
	<input type="text" name="c_name" id="c_name" /> <input type="submit" id="btnCli" value="회원별검색"/><br/><br/>
	</form>
	
	
	<form action = "/Result/Eng" method="post">
	기사별 조회 *기사님 성함을 입력하세요
	<input type="text" name="e_name" id="e_name"  /> <input type="submit" id="btnEng" value="기사별검색"/><br/><br/>
	</form>
	
	<form action="/Result/Date">
	시작날짜<input type="date" name="start" id="s_date" value="2019-08-06"/> 끝날짜<input type="date" name="end" id="f_date"value="2019-08-22"/>
	
	<input type="button" id ="date" value="예약날짜별 조회"/>
	
	</form>
   <br/>       
<div class="inwrap">
     <table id="result" style="width: 95%;">
      <thead>
         <tr>
           <th style="width:8%;height:22px;text-align:center;font-size:15px;">예약번호</th>
           <!-- <th style="width:10%;height:22px;text-align:center;font-size:15px;">예약번호</th> -->
           <th style="width:8%;height:22px;text-align:center;font-size:15px;">고객아이디</th>
           <th style="width:8%;height:22px;text-align:center;font-size:15px;">기사아이디</th>
           <th style="width:7%;height:22px;text-align:center;font-size:15px;">기사이름</th>
           <!-- <th style="width:10%;height:22px;text-align:center;font-size:15px;">제품아이디</th> -->
           <th style="width:10%;height:22px;text-align:center;font-size:15px;">제품이름</th>
           <th style="width:15%;height:22px;text-align:center;font-size:15px;">완료날짜</th>
           <th style="width:8%;height:22px;text-align:center;font-size:15px;">완료시각</th>
           <th style="width:10%;height:22px;text-align:center;font-size:15px;">결과</th>
         </tr>
		

   <c:forEach var="result" items="${ resultList }" >
   <tr>
    <td> ${result.r_id } </td>
    <%-- <td> ${result.s_num } </td> --%>
    <td> ${result.m_id } </td>
    <td> ${result.e_id } </td>
    <td> ${result.e_name } </td>
    <%-- <td> ${result.p_id } </td> --%>
    <td> ${result.p_name } </td>
    <td> ${result.fin_date } </td>
    <td> ${result.fin_time } </td>
    <td> 
    	<c:choose>
         <c:when test = "${result.r_result == 0 }">
            예약완료
         </c:when>
         <c:when test = "${result.r_result == 1 }">
            예약취소
         </c:when>
         <c:otherwise>
            방문완료
         </c:otherwise>
      </c:choose>
    </td>
 	
   </tr>
   </c:forEach>

  
 </table>
 
 <!-- 여기서 부터 추가 -->
 <table style="width : 90%; height : 25px; align : center;" > 
	<tr>
		<td  style="height:25px; align : center; border : 0px; ">
		
		<c:set var="showprev" 		value="${pageResultVo.isshowpageprev }" />
		<c:set var="shownext" 		value="${pageResultVo.isshowpagenext }" />
		
		<c:set var="startnum" 		value="${pageResultVo.pagestartnum }" />
		<c:set var="endnum" 		value="${pageResultVo.pageendnum }" />
		<c:set var="pagegrpnum" 	value="${pageResultVo.pagegrpnum }" />
		
		<c:set var="totalpagecount" value="${pageResultVo.totalpagecount }" />
		<c:set var="totalcount" 	value="${pageResultVo.totalcount }" />
		<c:set var="pagecount" 		value="${pageResultVo.pagecount }" />
		
		<c:set var="nowpage" 		value="${pageResultVo.nowpage }" />
		<c:set var="prevnowpage" 	value="${pageResultVo.prevnowpage }" />
		<c:set var="nextnowpage" 	value="${pageResultVo.nextnowpage }" />
		<c:set var="m_name" 	    value="${m_name}" />
		
		<!-- --------------------------------------------------- -->
		<c:if test="${ showprev eq true }">
			<a href="${page}?nowpage=${prevnowpage}&pagecount=${pagecount}&pagegrpnum=${pagegrpnum-1}&c_name=${m_name}" style="text-decoration: none;">
				<b>[이전 ${ totalpagecount } 개]</b>
			</a>
		</c:if>
		<!-- --------------------------------------------------- -->
		
			<c:forEach var="pagenum" begin="${ startnum }" end="${ endnum }" step="1">
				&nbsp;&nbsp;
				
					<c:choose>
						<c:when test="${pagenum eq nowpage }">
						<a href="${page}?nowpage=${pagenum}&pagecount=${pagecount}&pagegrpnum=${pagegrpnum}&c_name=${m_name}" style="text-decoration: none;">
							<b>${ pagenum }</b>
						</a>
						</c:when>					
						<c:otherwise>          			
         					<c:choose>
         						<c:when test = "${pagenum == 0 }">
            						목록을 검색해주세요!
         						</c:when>
         						<c:otherwise>
         						<a href="${page}?nowpage=${pagenum}&pagecount=${pagecount}&pagegrpnum=${pagegrpnum}&c_name=${m_name}" style="text-decoration: none;">
         							<b>${ pagenum }</b>
         						</a>
         						</c:otherwise>	       
      						</c:choose>          					
         				</c:otherwise>
					</c:choose>				
				&nbsp;&nbsp;
			</c:forEach>
			
		<!-- --------------------------------------------------- -->
		<c:if test="${ shownext eq true }">
			<a href="${page}?nowpage=${nextnowpage}&pagecount=${pagecount}&pagegrpnum=${pagegrpnum+1}&c_name=${m_name}" style="text-decoration: none;">
			<b>[다음 ${ totalpagecount } 개]</b>
			</a>
		</c:if>
		<!-- --------------------------------------------------- -->
		</td>
	</tr>
</table>
 <!-- 여기까지  -->
 </div>
    </div>
   </section> 
</div>    
</body>
</html>