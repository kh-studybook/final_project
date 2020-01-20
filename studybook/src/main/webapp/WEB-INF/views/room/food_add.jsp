<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/food_add.css" />
<script>
$(document).on('click', '.number-spinner button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.number-spinner').find('input').val().trim(),
		newVal = 0;
	
	if (btn.attr('data-dir') == 'up') {
		newVal = parseInt(oldValue) + 1;
	} else {
		if (oldValue > 1) {
			newVal = parseInt(oldValue) - 1;
		} else {
			newVal = 0;
		}
	}
	btn.closest('.number-spinner').find('input').val(newVal);
	
	return false;
});

</script>
</head>
<body>
<form action="reserve_ok_page.re">
	<div class="container">
		<div class="col-md-12 e_food_page_title">
			<span>음료 추가 페이지</span>
		</div>
		<div class="row">
			<div class="col-md-7">
				<div class="e_food_add_div">
					<h2 class="e_head">메뉴</h2>
					
					<!-- 음료 종류  카드 -->
					<div class="e_food_info">

							<div class="e_product-img">
								<img src="http://bit.ly/2tMBBTd" height="420" width="327">
							</div>
							<div class="e_product-info">
								<div class="e_product-text">
									<h1>아이스 아메리카노</h1>		
								</div>
								<div class="e_product-price-btn">
									<p>
										<span>3000</span>\
									</p>
									
									<div class="input-group number-spinner">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="dwn">
											<span class="glyphicon glyphicon-minus">-</span>
										</button>
									</span> <input type="text" class="form-control text-center" value="0">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="up">
											<span class="glyphicon glyphicon-plus">+</span>
										</button>
									</span>
								</div>
								
								</div>
							</div>
					</div>
					<!-- e_food_info 끝 -->
					<!-- 음료 종류  카드 -->
					<div class="e_food_info">

							<div class="e_product-img">
								<img src="http://bit.ly/2tMBBTd" height="420" width="327">
							</div>
							<div class="e_product-info">
								<div class="e_product-text">
									<h1>아이스 아메리카노</h1>		
								</div>
								<div class="e_product-price-btn">
									<p>
										<span>3000</span>\
									</p>
									
									<div class="input-group number-spinner">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="dwn">
											<span class="glyphicon glyphicon-minus">-</span>
										</button>
									</span> <input type="text" class="form-control text-center" value="0">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="up">
											<span class="glyphicon glyphicon-plus">+</span>
										</button>
									</span>
								</div>
								
								</div>
							</div>
					</div>
					<!-- e_food_info 끝 -->
					<!-- 음료 종류  카드 -->
					<div class="e_food_info">

							<div class="e_product-img">
								<img src="http://bit.ly/2tMBBTd" height="420" width="327">
							</div>
							<div class="e_product-info">
								<div class="e_product-text">
									<h1>아이스 아메리카노</h1>		
								</div>
								<div class="e_product-price-btn">
									<p>
										<span>3000</span>\
									</p>
									
									<div class="input-group number-spinner">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="dwn">
											<span class="glyphicon glyphicon-minus">-</span>
										</button>
									</span> <input type="text" class="form-control text-center" value="0">
									<span class="input-group-btn">
										<button class="btn btn-default" data-dir="up">
											<span class="glyphicon glyphicon-plus">+</span>
										</button>
									</span>
								</div>
								
								</div>
							</div>
					</div>
					<!-- e_food_info 끝 -->

				</div>
			</div>
			<!-- col-md-7 끝 -->

			<div class="col-md-5">
				
			<div class="e_food_add_div">				
				<h2 class="e_head">공간 결제 예정금액</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">2020.01.01 (수)</span></li>
					<li><span class="e_tit">예약 시간</span> <span class="e_data">11 ~ 13시, 2시간</span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">1명</span></li>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">공간 예약 금액</span>
					<span class="e_total_price">22,000</span>
				</div>			
			</div>
			
			<div class="e_food_add_div">				
				<h2 class="e_head">음료 결제 예정금액</h2>
				<ul class="e_list_detail">
					<li><div class="e_food_price_div">
						<span class="e_tit">아이스 아메리카노</span><span class="e_drink_num">1</span> <span class="e_data">4000</span>
					</div></li>
					
					<li><div class="e_food_price_div">
						<span class="e_tit">아이스 카라멜 마끼야또</span><span class="e_drink_num">1</span> <span class="e_data">3500</span>
					</div></li>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">음료 결제 금액</span>
					<span class="e_total_price">22,000</span>
				</div>			
			</div>
			
			<div class="e_food_add_div">				
				<div class="e_total_price_div">
					<span class="e_total_name">총 결제 금액</span>
					<span class="e_total_price">22,000</span>
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