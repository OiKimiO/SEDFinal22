<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common.css">
<style>
            /* section */
            #mainSlide {
                width: 100%;
                height: 350px;
                background-color: #ddd;
                margin-bottom: 50px;
            }
            #mainSlide img {
                width : 100%;
                height : 100%
            }

            #menusBox {
                border-top:1px solid #eee;
                padding-top:50px;
                width: 100%;
                margin-bottom:100px;
                background-color:#F2F4F6;
            }
            #menusBox h2 {
                font-size: 2.5vw;
                font-weight: normal;
                text-align: center;
                margin-bottom: 50px;
            }
            #menusUl {width:100%;padding-bottom:50px;}
            #menusUl::after {
                display: block;
                content: '';
                clear: both;
            }
            #menusUl > li {box-sizing:border-box;width:33.3%;height:230px; float:left;text-align: center; font-size: 20pt}
            #menusUl > li:hover {border-bottom:3px solid #282c37}
            #menusUl > li > a {display: block; width:100%; padding-bottom:50px}
            #menusUl > li > a > span {display:block;width:120px;height:120px;margin: 0 auto;margin-bottom:30px;}
            #menusUl > li > a > span > img {width:100%;height:100%}
            

            /* footer */
            #footer {width:100%; height:200px; padding-top:50px; background-color:#282c37; color:#fff}
            #footer .inwrap {position:relative;height:100%}
            #footer #managerArea {position:absolute; bottom:50px;right:0px;font-weight: bold; }
            #man_log {color:#fff}
        </style>
        
</head>
<body>
<div id="wrap">
            <%@ include file="/WEB-INF/include/cheader.jspf" %>
            <section>
                <div id="mainSlide">
                    <img src="/img/slide1.png">
                </div>
                <div id="menusBox">
                    <div class="inwrap">
                        <h2>고객 지원 메뉴 바로가기</h2>
                        <ul id="menusUl">
                            <li>
                                <a href="/Reservation/RWriteForm">
                                    <span><img src="/img/slide1.png"></span>
                                    예약하기
                                </a>
                            </li>
                            <li>
                                <a href="/Reservation/Check?nowpage=1&pagegrpnum=1">
                                    <span><img src="/img/slide1.png"></span>
                                    예약확인
                                </a>
                            </li>
                            <li>
                                <a href="/Board/List?nowpage=1&pagegrpnum=1">                          
                                    <span><img src="/img/slide1.png"></span>
                                    공지사항
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <footer id="footer">
                <div class="inwrap">
                footer영역입니다.
                <p id="managerArea">
                    <a href="/Admin/Login" id="man_log">관리자 로그인</a>
                    <a href="/Mobile/Index" id="man_log">기사 로그인</a>
                </p>
                 </div>
              
            </footer>
        </div>
</body>
</html>