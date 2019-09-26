<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /* 웹 폰트 */
     @font-face {
         font-family: 'GoyangIlsan';
         src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff") format('woff');
         font-weight: normal;
         font-style: normal;
            }
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
	 /* Mdiv */
	#Mdiv{width : 1024px; }
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
	section{ width : 79%; height : 500px; margin-left : 210px;}
	#managerIdDiv{border-bottom:2px solid #282c37; width : 60%; margin : 0 auto; text-align : center; font-size : 20px; height : 50px; margin-top : 80px;line-height:40px;  }
</style>
</head>
<body>
<div id = "Mdiv">
	<!-- header -->
		<%@ include file="/WEB-INF/include/mheader.jspf" %>
  	<!-- section  -->
		<section>
			<div id = "managerIdDiv">관리자님 환영합니다.</div>
		</section>
</div>
</body>
</html>