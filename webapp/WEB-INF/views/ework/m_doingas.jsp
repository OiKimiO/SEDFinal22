<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <script>
  $( function() {
    $( "input" ).checkboxradio({
      icon: false
    });
  } );
  </script> -->
<script>
$( document ).ready(function() {
	
	$('input').click(function(){
		  $(this).val('');
	  });
	
	//alert('!'); 
	$('#btnSearchParts').on('click',function( e ) { // pc
		//$('.inwrap').html('!!!!');
			  e.preventDefault(); 
			  e.stopPropagation();
			  alert('!');
			  var p_name = $('.iptPname').val();
			  
			  $.ajax({
				  url      : '/GetPartsList', 
				  type     : 'GET',
				  data     : { p_name : $('.td_p_name input').val() },
				  dataType : 'json', 
				  success  : function(partsList) {
					  //alert('성공');
					  //alert(typeof partsList);
					  console.log(partsList);
					  
					  for(var j = 0; j<partsList.length; j++) {
						  $.ajax({
							  url      : '/FindParts', 
							  type     : 'GET',
							  data     : { text1 : partsList[j] },
							  dataType : 'json', 
							  async    :false,
							  success  : function(data) {
								  var items = data.items;
								  $.each(items, function(i, v){
									 $("#ul-estimate").css({"padding-top":"30px", "padding-bottom":"30px", "border-bottom":"1px solid #ddd"});
									 //$('#ul-estimate').css("padding-top":"30px"); 
					 				 //$('#ul-estimate').append('<li style="padding:1rem">' + v.title + '</li>' + '<li style="text-align:right" style="background-color:#eee;padding:1rem">' + '<b>' + '<input type="checkbox" value="' + '">' + ' ' + AddComma((Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10) + '원' +  '</b>' +'</li>');
									 
					 				 //$('#ul-estimate').append('<li style="padding:1rem"><label for="checkbox-1">' + v.title + '<span style="display:block; float:right">가격</span>' + '</label>' + '<input type="checkbox" name="' + 'checkbox-1' + '" id="' + 'checkbox-1' + '">');
					 				 
					 				 $('#ul-estimate').append('<li style="padding:1rem"><label for="checkbox' + j + '" style="display:block;">' + '<span class="partsname">'   + v.title + '</span>'   +'<input type="checkbox" name="checkboxes' + '" style="float:right;" id="checkbox' + j + '" value="' + (Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10 + '">'   + '<span style="display:block; float:right">'+ AddComma((Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10) +  '원'   +    '</span>'       +      '</label>'  );
					 				//실제 $('#ul-estimate').append('<li style="padding:1rem"><label for="checkbox' + j + '" style="display:block;">' + v.title + '<span style="display:block; float:right">'+ AddComma((Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10) +  '원'   +    '</span>'       +  '<input type="checkbox" name="checkboxes' + '" id="checkbox' + j + '" value="' + (Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10 + '">'    +      '</label>'  );

					 				 
					 				 
									 //var nData = AddComma(nData);

								  });
							
							  },
							  error   : function(xhr) {
								  alert(xhr.status + ':' + xhr.statusText);
							  }
							 
						  });
					  }
					  $('#ul-estimate').after('<ul style="width:100%; height:50px;margin-bottom:30px" id="totPrice";><li style="width:60%;float:left;font-weight:bold;line-height:50px">부품 총액</li><li id="totalPrice" style="width:40%;float:right;text-align:right;font-weight:bold;line-height:50px">' + '원</li></ul>');
					  //$('#ul-estimate').after('<input type="button" value="총 견적 조회" id="btnEstimate">');
					  $('#totPrice').after('<input type="button" value="결제" id="pay" style="display:block;width:35%;height:40px;background-color:#DC0505;color:#fff;margin:0 auto;font-size:1.5rem;font-weight:bold">');
				  	  /* $('#fin_msg').click(function(){
				  		  $(this).val('');
				  	  }); */
				  },
				  error   : function(xhr) {
					  alert(xhr.status + ':' + xhr.statusText);
				  }
				 
			  }); 
			  
			  //alert('!');
			  //alert($('.iptPname').val());
			  
		  });
	
	$('#btnSearchParts').bind('touchstart',function( e ) { // mobile
		//$('.inwrap').html('!!!!');
		e.preventDefault(); 
		  e.stopPropagation();
		  alert('!');
		  var p_name = $('.iptPname').val();
		  
		  $.ajax({
			  url      : '/GetPartsList', 
			  type     : 'GET',
			  data     : { p_name : $('.td_p_name input').val() },
			  dataType : 'json', 
			  success  : function(partsList) {
				  //alert('성공');
				  //alert(typeof partsList);
				  console.log(partsList);
				  
				  for(var j = 0; j<partsList.length; j++) {
					  $.ajax({
						  url      : '/FindParts', 
						  type     : 'GET',
						  data     : { text1 : partsList[j] },
						  dataType : 'json', 
						  async    :false,
						  success  : function(data) {
							  var items = data.items;
							  $.each(items, function(i, v){
								 $("#ul-estimate").css({"padding-top":"30px", "padding-bottom":"30px", "border-bottom":"1px solid #ddd"});
								 //$('#ul-estimate').css("padding-top":"30px"); 
				 				 //$('#ul-estimate').append('<li style="padding:1rem">' + v.title + '</li>' + '<li style="text-align:right" style="background-color:#eee;padding:1rem">' + '<b>' + '<input type="checkbox" value="' + '">' + ' ' + AddComma((Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10) + '원' +  '</b>' +'</li>');
								 
				 				 //$('#ul-estimate').append('<li style="padding:1rem"><label for="checkbox-1">' + v.title + '<span style="display:block; float:right">가격</span>' + '</label>' + '<input type="checkbox" name="' + 'checkbox-1' + '" id="' + 'checkbox-1' + '">');
				 				 
				 				 $('#ul-estimate').append('<li style="padding:1rem"><label for="checkbox' + j + '" style="display:block;">' 
				 				                        + '<span class="partsname">'   + v.title + '</span>'   +
				 				                        '<input type="checkbox" name="checkboxes' + '" style="float:right;" id="checkbox' + j + '" value="' + (Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10 + '">'  
				 				                        + '<span style="display:block; float:right">'+ AddComma((Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10) +  '원'   +    '</span>'       +      '</label>'  );
				 				//실제 $('#ul-estimate').append('<li style="padding:1rem"><label for="checkbox' + j + '" style="display:block;">' + v.title + '<span style="display:block; float:right">'+ AddComma((Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10) +  '원'   +    '</span>'       +  '<input type="checkbox" name="checkboxes' + '" id="checkbox' + j + '" value="' + (Math.ceil(((Number(v.hprice) + Number(v.lprice)) / 2)/10))*10 + '">'    +      '</label>'  );

				 				 
				 				 
								 //var nData = AddComma(nData);

							  });
						
						  },
						  error   : function(xhr) {
							  alert(xhr.status + ':' + xhr.statusText);
						  }
						 
					  });
				  }
				  $('#ul-estimate').after('<ul style="width:100%; height:50px;margin-bottom:30px" id="totPrice";><li style="width:60%;float:left;font-weight:bold;line-height:50px">부품 총액</li><li id="totalPrice" style="width:40%;float:right;text-align:right;font-weight:bold;line-height:50px">' + '원</li></ul>');
				  //$('#ul-estimate').after('<input type="button" value="총 견적 조회" id="btnEstimate">');
				  $('#totPrice').after('<input type="button" value="결제" id="pay" style="display:block;width:35%;height:40px;background-color:#DC0505;color:#fff;margin:0 auto;font-size:1.5rem;font-weight:bold">');
			  	  /* $('#fin_msg').click(function(){
			  		  $(this).val('');
			  	  }); */
			  },
			  error   : function(xhr) {
				  alert(xhr.status + ':' + xhr.statusText);
			  }
			 
		  }); 
		  
		  //alert('!');
		  //alert($('.iptPname').val());
		  
	  
		  });
	
	
	
	
		  }); // document ready


</script>
<script>
$( document ).ready(function() {
	
		var price = 0;
		var arrNum = 0;
		var product_names = [];
	$(document).on('click','input[name=checkboxes]',function(){
		if($(this).is(":checked")){
	        price += Number($(this).val());
	        //alert($(this).parent().find('span').html());
	        product_names[arrNum] = $(this).parent().find('span').html();
	        arrNum++;
	        console.log(product_names);
	        console.log(arrNum);
	    }else{
	        price -= Number($(this).val());
	        //alert($(this).parent().find('span').html());
	        var cnt = 0;
	        //let a = [1, 2, 3, 4]; 
	        const idx = product_names.indexOf($(this).parent().find('span').html()) ;
	        if (idx > -1) {
	        	product_names.splice(idx, 1);
	        	arrNum--;
	        	};
	        console.log(product_names);
	        console.log('실제 배열 길이 : ' );
	        console.log(product_names.length);
	    }
		console.log('totalprice : ' + price);
		$('#totalPrice').html(AddComma(price) + '원');
		
		
		$('#pay').on('click',function(){//결제 버튼
			//alert('!!!!');
			$('#herepay').html('<span style="float:right;font-weight:bold">' + AddComma(price) + '원' + '</span>' + '<input type="hidden" name="fin_pri" value="' + AddComma(price) + '원' + '" id="inputtotalprice">');
			//alert(inputtotalprice);
			var usedParts = '';
			for(var h = 0; h<product_names.length; h++) {
				usedParts += product_names[h]  + ', ';
			}
			usedParts = usedParts.substr(0, usedParts.length -2);
				$('#usedparts').html(usedParts + '<input type="hidden" id="pa_txt" name="pa_txt" value=" '+ usedParts +' ">');
				//$('#pa_txt').val(usedParts);
			//alert(product_names);
		});
	})
	
	//alert($("input:checkbox[name=checkboxes]:checked").val());
	
});
 
	//alert($("input:checkbox[name=checkboxes]:checked").val());
   // $("input:checkbox[name=checkboxes]:checked").val();
    /* .on('change', function(){
    	alert('???');
        if($("#checkBoxId").is(":checked")){
            alert("체크박스 체크했음!");
        }else{
            alert("체크박스 체크 해제!");
        }
    }); */

$(function(){
	$(document).on('click','#FNsearch',function(){
		$.ajax({
			  url      : '/SearchFreeOrNot', 
			  type     : 'POST',
			  data     : { 
				  s_num : $('input[name=snum]').val() 
				  , r_id :  '${ reservationInfo.r_id }' 
			  },
			  dataType : 'json', 
			  success  : function(partsList) {
				  if(partsList == 0){
					  $('#fin_gbn').text('무상');
				  }else{
					  $('#fin_gbn').text('유상');
				  }
				  $('.FNsearchDiv').html('<input type = "button" id="FNsearch" value ="유/무상 조회"/>')
				  
				 /*  console.log(partsList); */
			  },
			  error   : function(xhr) {
				  alert(xhr.status + ':' + xhr.statusText);
			  }
		})// ajax end
	})// button end	
})//function end



</script>
<script>
function AddComma(num)
{
var regexp = /\B(?=(\d{3})+(?!\d))/g;
return num.toString().replace(regexp, ',');
}
</script>
<style>
#FNsearchDiv{float:left;}
.floatDiv{float:left;}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/eheader.jspf"%>
		<section id="sec-AS">
		<p class="mintro">
		AS 진행
		</p>
		<div class="inwrap">
		<form action="/FinishService" method="POST">
		<table id="tbl-doingAS">
			<tr>
			<td colspan="2" class="bg-grey">예약번호</td>
			</tr>
			<tr>
			<td colspan="2">${ reservationInfo.r_id }<input type="hidden" name="r_id" value="${ reservationInfo.r_id }"></td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">수리 예약 일시</td>
			</tr>
			<tr>
			<td colspan="2">${ reservationInfo.f_date } ${ reservationInfo.f_time }</td>
			</tr>
			<tr>
			<td class="bg-grey">고객명</td><td>${ reservationInfo.m_name }님</td>
			</tr>
			<tr>
			<td class="bg-grey">고객 연락처</td><td>${ reservationInfo.m_tel }</td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">고객 주소</td>
			</tr>
			<tr>
			<td colspan="2">${ reservationInfo.m_city} ${ reservationInfo.m_gugun}
			<br>
			 ${ reservationInfo.m_addr}</td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey" >제품명</td>
			</tr>
			<tr>
			<c:if test="${empty productFreeInfo.p_name}">
			<td colspan="2"  class="td_p_name"><input type="text" name="p_name" class="iptPname" value="PK 24V570"></td>
			</c:if>
			<c:if test="${not empty productFreeInfo.p_name}">
			<td colspan="2" class="td_p_name tdPname" >
			<input type="hidden" name="p_name" value="${ productFreeInfo.p_name }" class="iptPname"/>
			${ productFreeInfo.p_name }</td>
			</c:if>
			</tr>
			<tr>  
			<td colspan="2" class="bg-grey">Serial Number</td>
			</tr>
		
			<tr>
			<c:if test="${empty productFreeInfo.s_num}">
			<td colspan="2"><div class ="floatDiv"><input type="text" name="s_num" value="SN00000013"><!-- <a href="#">구매 내역 조회</a> -->
			</div> <div class ="FNsearchDiv"><input type = "button" id="FNsearch" value ="유/무상 조회"/></div></td>
			</c:if>
			<c:if test="${not empty productFreeInfo.s_num}">
			<td colspan="2">${ productFreeInfo.s_num }<input type="hidden" name="s_num" id="s_num" value="${ productFreeInfo.s_num }"><div class ="FNsearchDiv"><input type = "button" id="FNsearch" value ="유/무상 조회"/></div></td>
			</c:if>
			</tr>
			
			<tr>
			<td colspan="2" class="bg-grey">유/무상 수리 여부</td>
			</tr>
			<tr>
			<td colspan="2" id="fin_gbn">
			<input type="hidden" name="fin_gbn" value="${productFreeInfo.freeornot }"></td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">제품 이상 증상</td>
			</tr>
			<tr>
			<td colspan="2">${ reservationInfo.f_lname } > ${ reservationInfo.f_sname }</td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">전달사항</td>
			</tr>
			<tr>
			<td colspan="2">${ reservationInfo.r_msg }</td>
			</tr>
			<tr id="beforePartsList">
			<td colspan="2">
			<a href="#" id="btnSearchParts" style="background-color:#fff;display:block;width:100%;text-align:center;line-height:10vh;font-size:2rem;font-weight:bold;border:6px solid #DC0505;color:#DC0505">부품 조회</a>
			
 	        <!-- <input type="button" value="부품 조회" id="btnSearchParts" style="background-color:#fff;display:block;width:100%;height:10vh;font-size:2rem;font-weight:bold;border:6px solid #DC0505;color:#DC0505"> -->
			<div id="estimateBox">
			<ul id="ul-estimate">
			
			</ul>
			</div>
			</td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">총 결제액</td>
			</tr>
			<tr>
			<td colspan="2" id="herepay"></td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">사용 부품</td>
			</tr>
			<tr>
			<td colspan="2" id="usedparts"></td>
			</tr>
			<tr>
			<td colspan="2" class="bg-grey">수리 내용</td>
			</tr>
			<tr>
			<td colspan="2"><input type="text" id="fin_msg" name="fin_msg" placeholder="수리 내용을 입력해주세요." style="padding:1rem;width:100%;height:100px"></td>
			</tr>
			
			</table>
			<p id="smtBox" style="width:40%;line-height:9vh;margin:0 auto;background-color:#DC0505;margin-bottom:50px">
			<input type="submit" value="저장" id="smt-as">
			</p>
		</form>
			</div>
		</section>
		<%@ include file="/WEB-INF/include/efooter.jspf"%>
	</div>
</body>
</html>