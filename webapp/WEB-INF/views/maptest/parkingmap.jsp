<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주차장</title>
    <link rel="stylesheet" href="/css/common.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>

<style>
	#map img {
		width:50px;
		height:50px;
	}
</style>
</head>

<body>
<!-- <p style="margin-top:-12px">
    <b>Chrome 브라우저는 https 환경에서만 geolocation을 지원합니다.</b> 참고해주세요.
</p> -->
<%@ include file="/WEB-INF/include/eheader.jspf"%>
	<div id="map" style="width:100%;height:450px;"></div>

      <div id="search-box" class="inwrap">
          <div>
              <span>조회를 원하는 지역구를 선택하고, 검색 버튼을 눌러주세요.</span>
              <p>
                  <select id="select-free">
                      <option value="유료">유료</option>
                      <option value="무료">무료</option>
                  </select>
                  
                  <select id="select-pub">
                      <option value="공영">공영</option>
                      <option value="민영">민영</option>
                  </select>

                  <button id="search-btn">검색</button>
              </p>

          </div>
      </div>
		 <div class="inwrap">
	<div id="show-list-box" >
      <p class="inwrap font-normal">
         ※ 이미지나 이름을 클릭하면 설명창이 활성화됩니다.
     </p>
    
   
        <table id="show-list-table" border="1">

        </table>
  </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7118c675bb37c099011dd7ed9598b820"></script>
<script>
//$(document).ready(function(){
var rdnmadrs = new Array();//주소
var titles = new Array();//이름
var x = new Array(); //위도
var y = new Array(); //경도


// 	$(document).on('click', '#search-btn', function(){
	$.ajax({
		url:'/GetParkingMap',
		type:'GET',
		async : false,
		dataType : 'json',
		success:function(data){
			var msg = '';
			console.log(data);
			for(var i=0; i<data.response.body.items.length; i++){
				var rdnmadr = data.response.body.items[i].rdnmadr;
				var title = data.response.body.items[i].prkplceNm;
				var lat = data.response.body.items[i].latitude;
				var longi = data.response.body.items[i].hardness;
								
				rdnmadrs.push(rdnmadr);
				titles.push(title);
				x.push(lat);
				y.push(longi);

			}

		},
		error:function(xhr){
			alert(xhr.status + '' + xhr.statusText);
		}
	});
// 	});
	 var lat = 0, // 위도
     lon = 0; // 경도



var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.173816, 129.165824), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


if (navigator.geolocation) {
	
        $('.font-normal').html('여기1');
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        //$('.font-normal').html('여기????');
        lat = position.coords.latitude; // 위도
        lon = position.coords.longitude; // 경도
        //alert(lat);
        //alert(lon);
        //$('.font-normal').html(lat  + ' , ' + lon);
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:1rem;line-height:60px;font-size:2rem;background-color:#282c37;color:yellow;font-weight:bold">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} 

//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    

var positions = new Array();

for(var i=0; i<x.length; i++){
	var positions2 = 
		{
			title: titles[i],
			latlng: new kakao.maps.LatLng(x[i], y[i])
		};
	positions.push(positions2);
}
//console.log(positions);

// 마커 이미지의 이미지 주소입니다
var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png'; 
//alert(imageSrc);
var infowindowE = new Array();
for (var i = 0; i < positions.length; i ++) {
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    //alert('여기?');
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage('/img/markerStar.png', imageSize); 
    //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage, // 마커 이미지 
        clickable: true
    });
    //alert(marker);
    //marker.setMap(map);
    
 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:5px;width:320px;height:60px;font-size:24px;">'+titles[i]+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 인포윈도우를 생성합니다
    var infowindow =  new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
        
    infowindowE.push( infowindow);

    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
    
    //kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        
//     // 마커에 클릭이벤트를 등록합니다
//     kakao.maps.event.addListener(marker, 'click', function() {
//           // 마커 위에 인포윈도우를 표시합니다
//           infowindow.open(map, marker);  
//     });
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}


function setCenter() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function panTo(lat2, longi2) {
	
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat2, longi2);
    
    var marker = new kakao.maps.Marker({  
        position: moveLatLon
    }); 
    
    for(var i=0; i<x.length; i++){
    	if(lat2 == x[i]){
    		infowindowE[i].open(map, marker);
    	}
    }
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}
//검색버튼
$(document).on('click', '#search-btn', function(){
	var sfrees = $('#select-free option:selected').val();
	var spubs = $('#select-pub option:selected').val();
	$.ajax({
		url : '/GetParkingFree',
		data : {
			sfree : sfrees, spub : spubs
		},
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data){
			//alert('!');
			$('#show-list-table').empty();
			var msg = '';
			for(var i=0; i<data.response.body.items.length; i++){
				var rdnmadr = data.response.body.items[i].rdnmadr;
				var title = data.response.body.items[i].prkplceNm;				
				var parkingchrgeInfo = data.response.body.items[i].parkingchrgeInfo;
				var prkplceSe = data.response.body.items[i].prkplceSe;
				
				var lat = data.response.body.items[i].latitude;
				var longi = data.response.body.items[i].hardness;
								
				msg += '<tr>';
				msg += '<td><button onclick="panTo('+lat+','+longi+');">'+title+'</button></td>';
				msg += '<td>'+rdnmadr+'</td>';
				msg += '<td>'+parkingchrgeInfo+'</td>';
				msg += '<td>'+prkplceSe+'</td>';
				msg += '</tr>';
				//alert(msg);
			}
			$('#show-list-table').append(msg);
			
		},
		error : function(xhr){
			alert(xhr.status + ':' + xhr.statusText);
		}
	});
}); 

//});

</script>

</body>
</html>