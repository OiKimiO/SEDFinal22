<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차충전소</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>

<style>
	img {
		width:50px;
		height:50px;
	}
</style>
</head>

<body>
<!-- <p style="margin-top:-12px">
    <b>Chrome 브라우저는 https 환경에서만 geolocation을 지원합니다.</b> 참고해주세요.
</p> -->
	<div id="map" style="width:100%;height:650px;"></div>

      <div id="search-box" class="inwrap">
          <div>
              <span>조회를 원하는 지역구를 선택하고, 검색 버튼을 눌러주세요.</span>
              <p>
                  <select id="select-gu">
                      <option value="강서구">강서구</option>
                      <option value="금정구">금정구</option>
                      <option value="기장군">기장군</option>
                      <option value="남구">남구</option>
                      <option value="동구">동구</option>
                      <option value="동래구">동래구</option>
                      <option value="부산진구">부산진구</option>
                      <option value="북구">북구</option>
                      <option value="사상구">사상구</option>
                      <option value="사하구">사하구</option>
                      <option value="서구">서구</option>
                      <option value="수영구">수영구</option>
                      <option value="연제구">연제구</option>
                      <option value="영도구">영도구</option>
                      <option value="중구">중구</option>
                      <option value="해운대구">해운대구</option>
                  </select>

                  <button id="search-btn">검색</button>
              </p>

          </div>
      </div>
		
	<div id="show-list-box" >
      <p class="inwrap font-normal">
         ※ 이미지나 이름을 클릭하면 설명창이 활성화됩니다.
     </p>
        <table id="show-list-table" class="inwrap" border="1">

        </table>

    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c648606822caea2f80619b889520366d"></script>
<script>
//$(document).ready(function(){
var addrs = new Array();//주소
var titles = new Array();//이름
var x = new Array(); //위도
var y = new Array(); //경도


// 	$(document).on('click', '#search-btn', function(){
	$.ajax({
		url:'/GetMap',
		type:'GET',
		async : false,
		dataType : 'json',
		success:function(data){
			var msg = '';
			for(var i=0; i<data.response.body.items.item.length; i++){
				var addr = data.response.body.items.item[i].addr;
				var title = data.response.body.items.item[i].csNm;
				var lat = data.response.body.items.item[i].lat;
				var longi = data.response.body.items.item[i].longi;
								
				addrs.push(addr);
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
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        lat = position.coords.latitude; // 위도
        lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;width:250px;height:60px;font-size:25px;">현위치ㅇㅅㅇ</div>'; // 인포윈도우에 표시될 내용입니다
        
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
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

var infowindowE = new Array();
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage, // 마커 이미지 
        clickable: true
    });
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
	var gunum = $('#select-gu option:selected').val();
	$.ajax({
		url : '/GetGu',
		data : {
			gu : gunum
		},
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data){
			$('#show-list-table').empty();
			var msg = '';
			for(var i=0; i<data.response.body.items.item.length; i++){
				var addr = data.response.body.items.item[i].addr;
				var title = data.response.body.items.item[i].csNm;				
				var chargeTp = data.response.body.items.item[i].chargeTp;
				var chargeTpstr = '';
				
				var lat = data.response.body.items.item[i].lat;
				var longi = data.response.body.items.item[i].longi;
				
				if(chargeTp == 1){
					chargeTpstr = '완속';
				}else if(chargeTp == 2){
					chargeTpstr = '급속';
				}
								
				msg += '<tr>';
				msg += '<td><button onclick="panTo('+lat+','+longi+');">'+title+'</button></td>';
				msg += '<td>'+addr+'</td>';
				msg += '<td>'+chargeTpstr+'</td>';
				msg += '</tr>';
				
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