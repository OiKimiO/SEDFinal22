<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>서비스센터안내</title>
<link rel="stylesheet" href="/css/common.css" >
<link rel="stylesheet" href="/css/cBoardStyle.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cd5d9c1bc4754c72f90c73e140345fb"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	window.onload = function(){
	// 사상서비스센터
		var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.163333, 128.980133), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.163333, 128.980133); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
	// 부산광복서비스센터
		var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.097699, 129.031773), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.097699, 129.031773); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
	// 광안서비스센터
		var mapContainer = document.getElementById('map3'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.147833, 129.110238), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.147833, 129.110238); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

	}
</script>

<style>
	
</style>
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
		    
		    <br><br><br><br><br><br><br><br><br><br>
		
		    <!-- 서비스센터 위치안내 table -->
		   	<div class="inwrap">
			    <table id="tbl-noticeList">
			        <tr><th colspan="2" style="font-size: 3rem;" ><h1 style=" margin-bottom:30px;">부산사상서비스센터</h1></th></tr>
			        <tr>
			        	<td colspan="2">
			        		<!-- 지도를 표시할 div 입니다 -->
							<div id="map1" style="width:99%;height:350px;margin:0 auto;"></div>
			        	</td>
			        </tr>
			        <tr style="font-weight: bold;">
			        	<td>주소 : 부산광역시 사상구 괘법동 532-36 </td>
			        	<td>전화번호 : 051-622-3343</td>
			        </tr>
			    </table>
			    <br><br><br><br><br><br>
			    
			    <table id="tbl-noticeList">
			        <tr><th colspan="2"style="font-size: 3rem" ><h1 style=" margin-bottom:30px;">부산광복서비스센터</h1></th></tr>
			        <tr>
			        	<td colspan="2">
			        		<!-- 지도를 표시할 div 입니다 -->
							<div id="map2" style="width:99%;height:350px;margin:0 auto;"></div>
			        	</td>
			        </tr>
			        <tr style="font-weight: bold;">
			        	<td>주소 : 부산광역시 중구 남포동4가 15-3 </td>
			        	<td>전화번호 : 051-624-9596</td>
			        </tr>
			    </table>
			    <br><br><br><br><br><br>
			    
			    <table id="tbl-noticeList">
			        <tr><th colspan="2"style="font-size: 3rem" ><h1 style=" margin-bottom:30px;">부산광안서비스센터</h1></th></tr>
			        <tr>
			        	<td colspan="2">
			        		<!-- 지도를 표시할 div 입니다 -->
							<div id="map3" style="width:99%;height:350px;margin:0 auto;"></div>
			        	</td>
			        </tr>
			        <tr style="font-weight: bold;">
			        	<td>주소 : 부산광역시 수영구 남천동 48-11</td>
			        	<td>전화번호 : 051-626-4724</td>
			        </tr>
			    </table>
			    <br><br><br><br><br><br>
		    </div>
		</section>
	<footer>
	</footer>
	</div>
</body>
</html>