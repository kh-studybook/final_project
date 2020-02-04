<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/reserve_ok.css" />
<script>
		$(document).ready(function(){
			$("#reserve_cancel_btn").click(function(event){
					
		              var answer = confirm("정말 취소하시겠습니까?");
		              console.log(answer); //취소를 클릭한 경우 : false
		              
		              if(!answer) { //취소를 클릭한 경우
		                 event.preventDefault();
		              }else{
		            	  var r_code=$("input[name=r_code]").val();
		          		 location.href="reserve_cancel_action.re?r_code="+r_code;
		              }
				});
			
			
		});
	</script>
</head>
<body>

<input type="hidden" name="r_code" value="${reserve_check.r_code }">
	<div class="container">
		<div class="col-md-12 e_reserve_ok_title">
			<span>예약이 완료되었습니다.</span>
		</div>
		<div class="row">
			<div class="col-md-7">
				<div class="e_reserve_check_div">				
				<h2 class="e_head">예약 내용
					<div class="e_reserve_code_div">예약번호: <span class="e_reserve_code">${reserve_check.r_code }</span></div>
				</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">신청일</span> <span class="e_data">${reserve_check.pay_date }</span></li>
					<li><span class="e_tit">예약 공간</span> <span class="e_data">${reserve_check.room_name}</span></li>
					<li><span class="e_tit">예약 내용</span> <span class="e_data">${reserve_check.reserve_date } , ${reserve_check.start_time } ~ ${reserve_check.end_time }시 </span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">${reserve_check.extra_num }명</span></li>
					<li><span class="e_tit">요청 사항</span> <span class="e_data">${reserve_check.require }</span></li>
				</ul>
							
				</div>
				
				<div class="e_reserve_check_div">				
				<h2 class="e_head">예약자 정보</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약자 명</span> <span class="e_data">${reserve_check.reserver_name }</span></li>
					<li><span class="e_tit">연락처</span> <span class="e_data">${reserve_check.reserver_phone }</span></li>
					<li><span class="e_tit">이메일</span> <span class="e_data">${reserve_check.reserver_email }</span></li>
				</ul>
							
				</div>
			
			</div>
			<!-- col-md-7 끝 -->
		
			<div class="col-md-5">
				<div class="e_reserve_check_div">				
				<h2 class="e_head">공간 결제 금액</h2>
				<ul class="e_list_detail">
					<li><span class="e_tit">예약 날짜</span> <span class="e_data">${reserve_check.reserve_date}</span></li>
					<li><span class="e_tit">예약 시간</span> <span class="e_data">${reserve_check.start_time } ~ ${reserve_check.end_time }시 </span></li>
					<li><span class="e_tit">추가 예약 인원</span> <span class="e_data">${reserve_check.extra_num }명</span></li>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">공간 결제 금액</span>
					<span class="e_total_price">${reserve_check.total_cost}원</span>
				</div>			
				</div>
				
				<c:if test="${!empty food_reservelist }">
				
				<div class="e_reserve_check_div">				
				<h2 class="e_head">음료 결제 금액</h2>
				<ul class="e_list_detail">
					<c:forEach var="food" items="${food_reservelist }">
					<li><div class="e_food_price_div">
						<span class="e_tit">${food.food_name }</span><span class="e_drink_num">${food.count }</span> <span class="e_data">${food.food_total_cost }</span>
					</div></li>
					</c:forEach>
				</ul>
				
				<div class="e_total_price_div">
					<span class="e_total_name">음료 결제 금액</span>
					<span class="e_total_price">${foods_total}원</span>
				</div>			
				</div>
				
				</c:if>
				
				<div class="e_reserve_check_div">				
				
					<div class="e_total_price_div">
						<span class="e_total_name">총 결제 금액</span>
						<span class="e_total_price">${room_food_total }원</span>
					</div>			
				</div>
				
				  <c:set var="today" value="<%=new java.util.Date()%>"/>
   				 <fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>
   				 <c:if test = "${reserve_check.reserve_date > now}" >   
                                           
				<div class="e_reserve_cancel_div">
					<input type="button" id="reserve_cancel_btn" value="예약  취소 하기">
				</div>
				</c:if>
			</div>
			<!-- col-md-5 끝 -->
		</div>
		<!-- row 끝 -->
	</div>
	<!-- container 끝 -->
</body>
</html>