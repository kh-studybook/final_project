<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/food_add.css" />
<script src="resources/js/food_add.js"></script>
<script>

</script>
</head>
<body>
<form action="GoPayment.re" action="post">
	<input type="hidden" name="mem_key" value="${reserve.mem_key }">
	<input type="hidden" name="room_code" value="${reserve.room_code }">
	<input type="hidden" name="reserver_name" value="${reserve.reserver_name }">
	<input type="hidden" name="reserver_phone" value="${reserve.reserver_phone }">
	<input type="hidden" name="reserver_email" value="${reserve.reserver_email }">
	<input type="hidden" name="require" value="${reserve.require }">
	<div class="container">
		<div class="col-md-12 e_food_page_title">
			<span>음료 추가 페이지</span>
		</div>
		<div class="row">
			<div class="col-md-7">
				<div class="e_food_add_div">
					<h2 class="e_head">메뉴</h2>
					<c:forEach var="food" items="${foodlist}" varStatus="status">
					<!-- 음료 종류  카드 -->
					<div class="e_food_info">

							<div class="e_product-img">
								<img src="resources/image/food/${food.food_pic }" height="420" width="327">
							</div>
							<div class="e_product-info">
								<input type="hidden" name="food_code_info" value="${status.index}">
								<div class="e_product-text">
									<h1 name="product_text">${food.food_name }</h1>		
								</div>
								<div class="e_product-price-btn">
									<p>
										<span name="product_price">${food.food_cost }</span>\
									</p>
									
									<div class="input-group number-spinner">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="dwn">
											<span class="glyphicon glyphicon-minus">-</span>
										</button>
									</span> <input type="text" class="form-control text-center" id="${food.food_code }" value="0">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="up">
											<span class="glyphicon glyphicon-plus">+</span>
										</button>
									</span>
								</div>
								
								</div>
							</div>
					</div>
					</c:forEach>
					<!-- e_food_info 끝 -->

				</div>
			</div>
			<!-- col-md-7 끝 -->

			<div class="col-md-5">
				
			<div class="e_food_add_div">				
				<h2 class="e_head">공간 결제 예정금액</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">${reserve.reserve_date }</span></li>
					<li><span class="e_tit">예약 시간</span> <span class="e_data">${reserve.start_time } ~  ${reserve.end_time }시</span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">${reserve.extra_num }명</span></li>
				</ul>
					<input type="hidden" name="reserve_date" value="${reserve.reserve_date }">
					<input type="hidden" name="start_time" value="${reserve.start_time }">
					<input type="hidden" name="end_time" value="${reserve.end_time }">
				
				<div class="e_total_price_div">
					<span class="e_total_name">공간 예약 금액</span>
					<span class="e_total_price">${reserve.total_cost }</span>
					<input type="hidden" name="total_cost" value="${reserve.total_cost }">
				</div>			
			</div>
			
			<div class="e_food_add_div">				
				<h2 class="e_head">음료 결제 예정금액</h2>
				<ul class="e_list_detail food_list">
					
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">음료 결제 금액</span>
					<span class="e_total_price"></span>
					
				</div>			
			</div>
			
			<div class="e_food_add_div">				
				<div class="e_total_price_div">
					<span class="e_total_name">총 결제 금액</span>
					<span class="e_total_price"></span>
				</div>
				
				<button class="e_to_payment_page">결제 하기</button>
			</div>
			
			</div>
			<!-- col-md-5 끝 -->

		</div>
		<!-- row 끝 -->
	</div>
	<!-- container 끝 -->
</form>

</body>
</html>