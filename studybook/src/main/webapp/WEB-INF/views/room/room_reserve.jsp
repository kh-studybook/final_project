<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/room_reserve.css" />
</head>
<body>
	<form action="food_add.re">
	<div class="container">
		<div class="col-md-12 e_reserve_page_title">
		<span>예약 페이지</span>
		</div>
		<div class="row">
		<div class="col-md-7">
			<div class="e_reserve_room_info">
				<h2 class="e_head">예약 공간</h2>
				<div class="e_room_info">
					
					<div class="e_room_pic">
					<img src="resources/image/profile/default.png">
					</div>
					
					<div class="e_room_detail">
						<span>512호</span>
						<span>512호 상세설명 입니다닫다다다ㅏ다</span>
					</div>
					
				</div>
				<ul class="e_list_detail">
					<li><span class="e_tit">공간 유형</span> <span class="e_data">
							<span>회의실</span> <span>세미나실</span> <span>스터디룸</span>
					</span></li>

					<li><span class="e_tit">예약시간</span> <span class="e_data">최소 1시간 부터 </span></li>

					<li><span class="e_tit">예약인원</span> <span class="e_data">최소 1명~최대 24명 </span></li>
				</ul>
			</div>
			
			<div class="e_reserve_room_info">
				
				<h2 class="e_head">예약 공간</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">2020.01.01 (수) 11~13시 </span></li>

					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">1명</span></li>
				</ul>
			</div>
			
			
			<div class="e_reserve_room_info">
				<div>
				<h2 class="e_head">예약자 정보 <span>* 필수 입력</span></h2>
				</div>
				
			<div class="e_info_div">
				<div class="e_user_info">
				<div class="e_info_name">예약자<span>*</span></div> 
				<div class="e_info_input"><input type="text" class="form-control" name="name" value="${name }"></div>
				</div>
				
				<div class="e_user_info">
				<div class="e_info_name">연락처<span>*</span></div>
				<div class="e_info_input"><input type="text" name="phone_1" value="${phone_1 }" class="form-control">
					<input type="text" name="phone_2" value="${phone_2 }" class="form-control">
					<input type="text" name="phone_3" value="${phone_3 }" class="form-control">
				</div>
				</div>
				
				<div class="e_user_info">
				<div class="e_info_name">이메일<span>*</span></div>
				<div class="e_info_input"><input type="text" name="email" value="${email }" class="form-control"></div>
				</div>
				
				<div class="e_user_info">
				<div class="e_info_name">요청사항</div>
				<div class="e_info_input"><textarea name="require" rows="8" placeholder="남기고 싶은 말을 적어주세요" class="form-control"></textarea></div>		
				</div>
			</div>
			</div>
			
			<div class="e_reserve_room_info">
				<h2 class="e_head">예약시 주의사항</h2>
				<ul class="e_list_detail_notice">
					<li><span class="e_tit">1</span> <span class="e_data">8인까지 추가비용 없이 사용하실 수 있습니다. </span></li>

					<li><span class="e_tit">2</span> <span class="e_data">선결제하신 인원외에 추가인원이 더 있으실 경우 사전에 문의주시기 바랍니다. </span></li>
				</ul>
			</div>
			
		</div>
		
		<div class="col-md-5">
			<div class="e_reserve_room_info">
				
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
				
				<button class="e_to_drink_page">다음</button>
			</div>
		</div>
		</div>
	</div>
</form>
</body>
</html>