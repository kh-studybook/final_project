<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">
<style>	
/** 글자 관련!!!!*/
.pp_title{font-family: "맑은 고딕"; text-align: center !important; font-size: 32px; display:inline_block}
#nocontent{font-size:24px; font-weight:bold; margin:10; color:#56D7D6; text-align:center}

/** 페이지 네이션*/
.center-block {display: flex;justify-content: center}

/** 카드 관련*/
.p_room_name{font-weight:bold; font-size:16px;}
.reserve_card{background-color:#DCEBFF; margin:20px; padding:20px; min-width:150px !important; max-height:170px; display:flex}
.room_picture{width:120px; height:120px; float:left; margin:10px;}
.reserve_card_contents{float:left; margin:10px}
.reserve_card_contents::after{clear:both;}

/** 폼 관련 */
.row{margin:0 auto;}

/** 버튼 관련*/
#p_reserve_no{background-color:white; padding:10px; border:none; outline:none; border-radius:20px}
.registerReview{float:right}
.registerReview::after{clear:both}
.registerReviewButton{visibility:hidden; background-color : #56D7D6; color:white; padding:6px; border:none; outline:none; border-radius:20px; z-index:10;}

/** 모달 관련 */
.w_div {display: inline-block;}
.w_title {margin-top: 100px; margin-bottom: 70px; font-size: 32px; text-align: center;}
.w_card {border: 1px solid #C1C1C1; padding: 20px; background: white; margin-bottom: 25px;}
.w_img {width: 140px;}
.w_content {line-height: 24px;font-size: 12px;color: #555555;}
.w_badge {font-size: 12px; margin-bottom: 13px;}
.w_padding {padding-left: 20px;}
.w_name {font-size: 24px; color: #333333;}
.w_time {font-size: 24px; color: #333333; font-size: 12px;}
.w_btn {line-height: 24px; font-size: 12px;}
.w_center-block {display: flex; justify-content: center; /* 가운데 정렬 */
	margin-bottom: 20px;}
.w_topmargin {margin-top: 30px;}
.w_margin-top {margin-top: 50px;}
.w_modal {font-size: 18px; width: 140px;}

</style>
<script>
	$(function(rdata){
		function formatDate(date) {
			  	var weekName = ["일", "월", "화", "수", "목", "금", "토"];
					    var d = new Date(date),
					        month = '' + (d.getMonth() + 1),
					        day = '' + d.getDate(),
					        year = d.getFullYear(),
					        hour = d.getHours(),
					        E = d.getDay();

					    if (month.length < 2) 
					        month = '0' + month;
					    if (day.length < 2) 
					        day = '0' + day;

					    return [year, month, day].join('.')+"("+ weekName[E]+")";
		}
		
		for (var i = 0; i < rdata.length; i++) {	
			var today = new Date();		
			if(formatDate($(".reserve_date").eq(i).val()) < formatDate(today)){
				console.log("오늘 : "+$(".reserve_date").eq(i).val() + " / 예약 날짜 : "+formatDate($(".reserve_date").val()));
				console.log($(".reserve_date").val() < formatDate(today));
				$(".registerReviewButton").eq(i).css('visibility', 'visible');
			}//if end			
		}//for end
		
		//후기 등록 버튼 클릭시
		$(".registerReviewButton").click(function(){
			if (confirm("후기를 등록하시겠습니까?")) {
				$("#registerReviewModal").modal();
				var room_code = $(this).parent().next().val();
				var review_date = $(this).parent().next().next().val();
				console.log("room_code : " + room_code + " / review_date : " + review_date);
				$("#registermodalSubmit").click(function(){
					$.ajax({
						type : "post",
						url : "ReviewRegister.re",
						data : {"room_code" : room_code,
								"review_date" : review_date,
								"content" : $("#content").html(),
								"mem_key" : mem_key},
						dataType : "json",
						success : function(){
								alert("후기가 등록되었습니다.");
								$("#content").text('');	
						}					
					});//ajax end 					
				});
			}
		});//후기 등록 버튼 클릭시 end
		
		
		
	});
</script>
</head>
<body>
	<div class = "container">
		<div class = "row">
	      <a href = "main.net" style = "text-decoration:none">메인 페이지로 돌아가기</a>
    	  <div class="col-md-4"></div>
   		</div>
      	<br>
		<div class = "row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<p class = "pp_title">예약 내역 리스트<p>
			</div>
			<div class="col-md-4">
				<input type="hidden" name="mem_key" id="mem_key" value="${mem_key}">
			</div>
	    </div>
					<br>
		   <%-- 예약 내역이 있는 경우 --%>
		   <c:if test="${listcount > 0}">
				<div class = "row">
			
					<c:set var="num" value="${listcount - (page - 1)*10}" />
					<c:forEach var="b" items="${reservelist}">
						<!-- eventlist를 Bean의 형식으로 b에 담아 춢력 -->
						
						<div class="col-md-6">
							<div class = "reserve_card">
							    <!-- 사진 출력 부분 -->
      							<img class = "room_picture" name = "room_picture" src = "resources/image/room/${b.file_name}">        			
        					
        						<div class = "reserve_card_contents">
        						<!--  예약 번호 -->
		        						<button id = "p_reserve_no"><span>예약 번호 : <span style = "color : #7F56D2;">${b.r_code}</span></span></button><br>
		        				<!--  사용 완료 -->		
		        						<span id = "p_reserve_status"></span><br> 								
        								<p class = "p_room_name">${b.room_name}</p>
        								<br>
        								<span>${fn:substring(b.reserve_date,0,4)}. ${fn:substring(b.reserve_date,5,7)}. ${fn:substring(b.reserve_date,8,10)}
        									<c:set var = "E" value = "<%= new java.util.Date() %>"/>
        									(<fmt:formatDate value = "${E}" pattern = "E"/>)</span>
        					
        								${b.start_time}시&nbsp;~&nbsp;${b.end_time}시,&nbsp;${b.end_time - b.start_time}시간
        								<br><br>
        								<input type = "hidden" name = "reserve_date" class = "reserve_date" value = "${b.reserve_date}">
        								<span><fmt:formatNumber value = "${b.total_cost}" pattern = "￦#,###"/></span>
        								<span class = "registerReview"><button class = "registerReviewButton">후기 등록</button></span>
        								<input type = "hidden" value = "${b.room_code}" name  = "room_code">
        								<input type = "hidden" value = "${b.reserve_date}" name = "review_date">	
								</div>  
							</div>
						</div>
						<br><br>
					</c:forEach>
				</div><!--  row end -->
	
	
	
	<!--  페이지네이션 -->
				<div id = "center-block" class="center-block">
					<div class="row">
						<div class="col">
							<ul class="pagination">
								<c:if test="${page <= 1}">
									<li class="page-item"><a class="page-link" href="#">이전&nbsp;</a>
									</li>
								</c:if>
								<c:if test="${page >1}">
									<li class="page -item"><a href="reservePage.re?page = ${page-1}" class="page-link">이전</a>&nbsp;
									</li>
								</c:if>

								<!-- 중간에 숫자 부분 -->
								<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<c:if test="${a == page}">
										<li class="page-item"><a class="page-link current" href="#">${a}</a></li>
									</c:if>
									<c:if test="${a != page}">
										<li class="page-item">
											<a href="reservePage.re?page=${a}" class="page-link">${a}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${page >= maxpage}">
									<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a></li>
								</c:if>
								<c:if test="${page < maxpage}">
									<li class="page-item"><a href="reservePage.re?page=${page+1}" class="page-link">&nbsp;다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<br><br>
			</c:if>
	
	<%-- 게시글이 없는 경우 --%>
	<c:if test="${listcount == 0}">
		<br><br><br><br>
		<p id = "nocontent">예약 내역이 없습니다.</p><br>
		<br><br><br><br><br><br>
	</c:if>	
	</div><!--  container end -->
	
	<!-- 후기 등록 모달 -->
	<div class="modal" id="registerReviewModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title w_modal">후기 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!--x부분 data-dismiss는 모달 종료할때 쓰는것 modal을 종료시키겠다. -->
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>사용후기</p>
					<br>
					<textarea class="form-control" id="content" name = "content" rows="10"></textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<form id=deletemodalForm action="ReviewModify.re" method="post">
						<input type=hidden name="mem_key" value="${mem_key}" id="mem_key">
						<input type="submit" class="btn btn-dark" data-dismiss="modal" id=registermodalSubmit value=등록>
					</form>
					<input type="button" class="btn btn-light" data-dismiss="modal" value=취소>
					<!-- 닫기버튼 -->
				</div>
			</div>
		</div>
	</div>
</body>