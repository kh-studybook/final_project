<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/reserve_ok.css" />
</head>
<body>
	<div class="container">
		<div class="col-md-12 e_reserve_ok_title">
			<span>예약이 완료되었습니다.</span>
		</div>
		<div class="row">
			<div class="col-md-7">
				<div class="e_reserve_check_div">				
				<h2 class="e_head">예약 내용
					<div class="e_reserve_code_div">예약번호: <span class="e_reserve_code">120312949</span></div>
				</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">신청일</span> <span class="e_data">2019.12.30 (월)</span></li>
					<li><span class="e_tit">예약 공간</span> <span class="e_data">스터디룸A</span></li>
					<li><span class="e_tit">예약 내용</span> <span class="e_data">2020.01.01 (수) 11 ~ 13시 , 2시간</span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">1명</span></li>
					<li><span class="e_tit">요청 사항</span> <span class="e_data">당일날 추가 인원이 3명 정도 늘어날 수 있습니다~~<br>당일에 지불하겟습니다.</span></li>
				</ul>
							
				</div>
				
				<div class="e_reserve_check_div">				
				<h2 class="e_head">예약자 정보</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약자 명</span> <span class="e_data">은지</span></li>
					<li><span class="e_tit">연락처</span> <span class="e_data">01012341234</span></li>
					<li><span class="e_tit">이메일</span> <span class="e_data">eunji3262@gmail.com</span></li>
				</ul>
							
				</div>
			
			</div>
			<!-- col-md-7 끝 -->
		
			<div class="col-md-5">
				<div class="e_reserve_check_div">				
				<h2 class="e_head">공간 결제 금액</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">2020.01.01 (수)</span></li>
					<li><span class="e_tit">예약 시간</span> <span class="e_data">11 ~ 13시, 2시간</span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">1명</span></li>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">공간 결제 금액</span>
					<span class="e_total_price">22,000</span>
				</div>			
				</div>
				
				<div class="e_reserve_check_div">				
				<h2 class="e_head">음료 결제 금액</h2>
				<ul class="e_list_detail">
					<li><div class="e_food_price_div">
						<span class="e_tit">아이스 아메리카노</span><span class="e_drink_num">1</span> <span class="e_data">4000</span>
					</div></li>
					<li><div class="e_food_price_div">
						<span class="e_tit">아이스 아메리카노</span><span class="e_drink_num">1</span> <span class="e_data">4000</span>
					</div></li>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">음료 결제 금액</span>
					<span class="e_total_price">8,000</span>
				</div>			
				</div>
				
				<div class="e_reserve_check_div">				
				
					<div class="e_total_price_div">
						<span class="e_total_name">총 결제 금액</span>
						<span class="e_total_price">30,000</span>
					</div>			
				</div>
				
				<div class="reserve_cancel_div">
					<input type="button" value="예약  취소 하기">
				</div>
				
			</div>
			<!-- col-md-5 끝 -->
		</div>
		<!-- row 끝 -->
	</div>
	<!-- container 끝 -->

</body>
</html>