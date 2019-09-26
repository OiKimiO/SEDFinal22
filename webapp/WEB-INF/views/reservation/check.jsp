<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 보기</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/cReservationStyle.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(function() {
		$('#search').click(
				function() {
					var msg = $('#select option:selected').val();
					var check = $('#check').val();
					//option->제품명일 시 
					if (msg == '제품명') {
						$('#check').attr('name','p_name');
						$('#value').attr('action',"/Reservation/Check/Pname?pagegrpnum=1&nowpage=1");
						$('#value').submit();
						
					} else if (msg == '예약 번호') {
						
						$('#check').attr('name','r_id');
						$('#value').attr('action',"/Reservation/Check/Rid?pagegrpnum=1&nowpage=1");
						$('#value').submit();
						
					} else if (msg == '카테고리') {
						
						$('#check').attr('name','cate_name');
						$('#value').attr('action',"/Reservation/Check/CateName?pagegrpnum=1&nowpage=1");
						$('#value').submit();
					}
			
				});

		$('#check').keypress(function(e) {
			if (e.which == 13) {
				$('#search').click();
			}
		});
	})
</script>

</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/include/cheader.jspf"%>
		<section class="sec-reservation">

			<div id="intro-notice" class="intros">
				<h3>
					내 예약/결과 조회 <br> <span>내 예약/결과 조회</span>
				</h3>
			</div>


			<div class="inwrap">
				<form method="post" action="" id="value">
					<select id="select">
						<option>--선택--</option>
						<option>제품명</option>
						<option>예약 번호</option>
						<option>카테고리</option>
					</select> <input type="text" placeholder="특정 제품 예약/결과 조회가 가능합니다" id="check"
						width=200px> <input type="button" id="search" value="검색">
				</form>
			</div>

			<div class='inwrap'>
				<h1 style="text-align: center">${result }</h1><br/>
				<h2 style="text-align: center">${result2 }</h2><br/><br/>
			</div>


			<div class='inwrap'>
				<table id='tbl-noticeList'>
					<thead>
						<tr  class="th-title">
							<th>예약번호</th>
							<th>제품카테고리</th>
							<th>제품명</th>
							<th>수리일자</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${lists}">
							<tr>
							
							
								<c:choose>
									<c:when test="${list.r_result eq '0'}">
										<td><a
											href="/Reservation/Check/AppDetail?r_id=${list.r_id }&r_result=${list.r_result}">${list.r_id}</a></td>
									</c:when>
									<c:when test="${list.r_result eq '1'}">
										<td><a
											href="/Reservation/Check/AppDetail?r_id=${list.r_id }&r_result=${list.r_result}">${list.r_id}</a></td>
									</c:when>
									<c:when test="${list.r_result eq '2'}">
										<td><a
											href="/Reservation/Check/Detail?r_id=${list.r_id }&r_result=${list.r_result}">${list.r_id}</a></td>
									</c:when>
									</c:choose>
								

								<td>${list.cate_name }</td>
								<c:choose>
									<c:when test="${list.p_name eq null }">
										<td>사용자 제품 이름을 입력하지 않았습니다.</td>
									</c:when>
									<c:otherwise>
										<td>${list.p_name}</td>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${list.f_date eq null }">
										<td>아직 미정</td>
									</c:when>

									<c:otherwise>
										<td>${list.f_date}&nbsp;${list.com_val}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.r_result eq '0'}">
										<td><a
											href="/Reservation/Check/AppDetail?r_id=${list.r_id }&r_result=${list.r_result}">예약완료</a></td>
									</c:when>
									<c:when test="${list.r_result eq '1'}">
										<td><a
											href="/Reservation/Check/AppDetail?r_id=${list.r_id }&r_result=${list.r_result}">예약취소</a></td>
									</c:when>
									<c:when test="${list.r_result eq '2'}">
										<td><a
											href="/Reservation/Check/Detail?r_id=${list.r_id }&r_result=${list.r_result}">방문완료</a></td>
									</c:when>
									
									<c:otherwise>
										<td>다시 한번 확인해주세요</td>
										<td>${list.r_result}</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

	 
			<div class='inwrap'>
				<%@ include file="/WEB-INF/include/paging.jspf"%>
			</div>
	 		
		</section>
	</div>

</body>
</html>