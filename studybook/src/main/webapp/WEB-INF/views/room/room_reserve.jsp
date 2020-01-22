<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/room_reserve.css" />
<script>

	$(document).ready(function(){
		$('form').submit(function(){
			var phone_1=$("input[name=phone_1]").val();
			var phone_2=$("input[name=phone_2]").val();
			var phone_3=$("input[name=phone_3]").val();
			$("input[name=reserver_phone]").val(phone_1+phone_2+phone_3);
			
			var name=$("input[name=name]").val();
			$("input[name=reserver_name]").val(name);
			
			var email=$("input[name=email]").val();
			$("input[name=reserver_email]").val(email);
		})
	})
</script>
</head>
<body>
<form action="food_add_page.re" method="post">
	<input type="hidden" name="room_code" value="${room.ROOM_CODE }">
	<input type="hidden" name="mem_key" value="${member.key }">
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
					<img src='${room.FILE_NAME }'>
					</div>
					
					<div class="e_room_detail">
						<span>${room.ROOM_NAME }</span>
						<span>${room.ROOM_INFO }</span>
					</div>
					
				</div>
				<ul class="e_list_detail">
					<li><span class="e_tit">공간 유형</span> <span class="e_data">
							${room.ROOM_TYPE }
					</span></li>

					<li><span class="e_tit">예약시간</span> <span class="e_data">최소 1시간 부터 </span></li>

					<li><span class="e_tit">예약인원</span> <span class="e_data">최소 1명~최대 24명 </span></li>
				</ul>
			</div>
			
			<div class="e_reserve_room_info">
				
				<h2 class="e_head">예약 공간</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">${reserve.reserve_date } 
															  ${reserve.start_time } ~ ${reserve.end_time }시 </span></li>
						<input type="hidden" name="reserve_date" value="${reserve.reserve_date }">
						<input type="hidden" name="start_time" value="${reserve.start_time }">
						<input type="hidden" name="end_time" value="${reserve.end_time }">
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">${reserve.extra_num } 명</span></li>
						<input type="hidden" name="extra_num" value="${reserve.extra_num }">
				</ul> 
			</div>
			
			
			<div class="e_reserve_room_info">
				<div>
				<h2 class="e_head">예약자 정보 <span>* 필수 입력</span></h2>
				</div>
				
			<div class="e_info_div">
				<div class="e_user_info">
				<div class="e_info_name">예약자<span>*</span></div> 
				<div class="e_info_input"><input type="text" class="form-control" name="name" value="${member.name }"></div>
							<input type="hidden" name="reserver_name">
				</div>
				
				<div class="e_user_info">
				<div class="e_info_name">연락처<span>*</span></div>
				<div class="e_info_input"><input type="text" name="phone_1" value="${fn:substring(member.phone,0,3)}" class="form-control">
					<input type="text" name="phone_2" value="${fn:substring(member.phone,3,7)}" class="form-control">
					<input type="text" name="phone_3" value="${fn:substring(member.phone,7,11)}" class="form-control">
					<input type="hidden" name="reserver_phone">
				</div>
				</div>
				
				<div class="e_user_info">
				<div class="e_info_name">이메일<span>*</span></div>
				<div class="e_info_input"><input type="text" name="email" value="${member.email }" class="form-control"></div>
					<input type="hidden" name="reserver_email">
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
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">${reserve.reserve_date }</span></li>
					<li><span class="e_tit">예약 시간</span> <span class="e_data">${reserve.start_time } ~ ${reserve.end_time } 시</span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">${reserve.extra_num }명</span></li>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">공간 예약 금액</span>
					<span class="e_total_price">${reserve.total_cost }</span>
				</div>
				<input type="hidden" name="total_cost" value="${reserve.total_cost }">
				<button class="e_to_drink_page">다음</button>
			</div>
		</div>
		</div>
	</div>
</form>
</body>
</html>