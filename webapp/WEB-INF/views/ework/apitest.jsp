<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부품 찾기</title>
<link rel="stylesheet" href="/css/common.css" >
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 네이버쇼핑 api js  -->
<script>
	$(function() {
		  $('#searchBtn').click(function( e ) {
			  e.preventDefault();
			  e.stopPropagation();
			  $.ajax({
				  url      : '/FindParts', 
				  type     : 'GET',
				  data     : {text1 : $('[name=text]').val() },
				  dataType : 'json', 
				  success  : function(data) {
					  var items = data.items;
					  $.each(items, function(i, v){
						 // 
						 $('#title').html('부품명 : ' + v.title);
						 /* $('#lprice').html('최저가 : ' + v.lprice); */
						 $('#hprice').html('부품 가격 : ' + v.hprice);
						 /* $('#productId').html('제품ID : ' + v.productId); */
					  });
				
				  }
				 
			  });
		  });
	});
	

</script>


</head>
<body>
	<input type="text" id="text" name="text" placeholder="제품" />
		<div id="title"></div>
		<div id="lprice"></div>
		<div id="hprice"></div>
		<div id="productId"></div>
		
		<input type="button" id="searchBtn" value="제품찾기" />
	


</body>
</html>