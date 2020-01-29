<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<form action="reserve_ok_page.re" method="post">
	<input type="hidden" name="mem_key" value="${reserve.mem_key }" >
 	<input type="hidden" name="room_code" value="${reserve.room_code }" >
 	<input type="hidden" name="reserve_date" value="${reserve.reserve_date }" >
 	<input type="hidden" name="start_time" value="${reserve.start_time }" >
 	<input type="hidden" name="end_time" value="${reserve.end_time }" >
 	<input type="hidden" name="total_cost" value="${reserve.total_cost }" >
 	<input type="hidden" name="require" value="${reserve.require }" >
 	<input type="hidden" name="extra_num" value="${reserve.extra_num }" >
 	<input type="hidden" name="reserver_name" value="${reserve.reserver_name }" >
 	<input type="hidden" name="reserver_phone" value="${reserve.reserver_phone }" >
 	<input type="hidden" name="reserver_email" value="${reserve.reserver_email }" >
 	
 	<c:if test="${!empty food_code }">
 		<c:forEach var="codelist" items="${food_code}" varStatus="status">
 		<input type=hidden name='food_code' value="${codelist}">	
 		</c:forEach>
 	
 		<c:forEach var="countlist" items="${count}" varStatus="status">
 		<input type=hidden name='count' value="${countlist}">	
 		</c:forEach>
 	
 		<c:forEach var="food_total_costlist" items="${food_total_cost}" varStatus="status">
 		<input type=hidden name='food_total_cost' value="${food_total_costlist}">	
 		</c:forEach>
 	</c:if>
 	<button>전송</button>
</form>
 <!-- 	
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp77984390'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'STUDYBOOK',
            amount : '${room_food_total_price}' ,
            buyer_email : '${reserve.reserver_email }',
            buyer_name : '${reserve.reserver_name }' ,
            buyer_tel : '${reserve.reserver_phone }' ,
            buyer_addr : 'kh 정보 교육원',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='reserve_ok_page.re?'+$('form').serialize();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="main.net";
                alert(msg);
            }
        });
        
    });
    
    </script> -->
 	
</body>
</html>

