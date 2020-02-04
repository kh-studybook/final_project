<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">
<style>
body {background-color: #f2f2f2;}	
/** 글자 관련!!!!*/
.pp_title{font-family: "맑은 고딕"; text-align: center !important; font-size: 32px; display:inline_block;
		margin-top:100px; margin-bottom:70px;}
/* #nocontent{font-size:24px; font-weight:bold; margin:10; color:#56D7D6; text-align:center} */

/** 페이지 네이션*/
.center-block {display: flex;justify-content: center}
li .current {background: #faf7f7;color: gray;}


/** 카드 관련*/
.p_room_name{font-weight:bold; font-size:16px;}
.reserve_card{border:0.5px solid darkgray; background-color:white; margin:20px; padding:20px; min-width:150px !important; max-height:170px; display:flex}
.room_picture{width:120px; height:120px; float:left; margin:10px;}
.reserve_card_contents{float:left; margin:10px}
.reserve_card_contents::after{clear:both;}

/** 버튼 관련*/
.p_reserve_no{background-color:"#F2F2F2"; padding:6px; border:none; outline:none; border-radius:10px}
.p_reserve_no1{background-color:#8c8c8c; padding:6px; color:white; border:none; outline:none; border-radius:10px}
.p_reserve_no3{background-color:#78EAFF; padding:6px; color:white; border:none; outline:none; border-radius:10px}
.registerReview{float:right;}
.registerReview::after{clear:both}
.registerReviewButton{z-index:10; background-color:white; border:none; outline: none; color:#7F56D2; padding:5px; border-radius:10px;}
.registerReviewButton2{z-index:10; background-color:white; border:none; outline: none; color:#56D7D6; padding:5px; border-radius:10px;}

/** 모달 관련 */
#registerReviewModal content {line-height: 24px;font-size: 12px;color: #555555;}
.#registerReviewModal {font-size: 12px; width: 140px;}


</style>
<script>
	$(function(data){
		
		//후기 등록 버튼 클릭시
		$(".registerReviewButton").click(function(){
			if (confirm("후기를 등록하시겠습니까?")) {
				$("#content").val('');
				$("#registerReviewModal").modal();
				
				//룸 이름 모달에 불러오기
				var roomName = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
				console.log(roomName);	
				$("#registerReviewModal  span[name=roomName]").text(roomName);
				
				//ajax 보낼 값 가져오기
				room_code = $(this).parent().next().val();
				review_date = $(this).parent().next().next().val();				
				mem_key = $("#mem_key").val();
				r_code = $(this).parent().next().next().next().val();
			}
		});//후기 등록 버튼 클릭시 end		
		
		
		//모달의 후기 등록 submit 할 때
		$("#registermodalSubmit").click(function(){
			console.log(" content : " +  $("#content").val());
			var content = $("#content").val();
			
			if (content.length == 0) {
				alert("내용을 입력해주세요.");
				return false;
			} else {
			console.log("room_code : " + room_code + " / review_date : " + review_date + " / content : " + content + " / mem_key : " + mem_key + " / r_code : " + r_code);
			
			$.ajax({
				type : "post",
				url : "ReviewRegister.re",
				data : {"room_code" : room_code,
						"review_date" : review_date,
						"content" : content,
						"mem_key" : mem_key,
						"r_code" : r_code},
				success : function(ok){
					if (ok == 1){
						alert("후기가 등록되었습니다.");
						$("#content").val('');
						//status 변경
						location.reload();
												
							
					} 						
				}					
			});//ajax end 
			}
		});
				
		
		//상세 페이지로 이동
		$(".p_reserve_no").click(function(){
			if (confirm("상세 예약 내역 페이지로 이동합니다.")) {
				var r_code = parseInt($(this).children().children().html());
				console.log(r_code);
				location.href = "reserve_check.re?r_code=" + r_code;				
			}			
		});
		
		$(".p_reserve_no1").click(function(){
			alert("이미 취소가 완료된 내역입니다.");
		});
		
		$(".p_reserve_no3").click(function(){
			alert("이미 사용이 완료된 내역입니다.");
		});
		
		$(".registerReviewButton2").click(function(){
			alert("이미 후기를 등록하셨습니다.");
		})
		
	});
</script>
</head>
<body>
	<div class = "container">
	<c:set var="today" value="<%=new java.util.Date()%>"/>
    <fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>
        	<p class = "pp_title">예약 내역 리스트<p>
			<input type="hidden" name="mem_key" id="mem_key" value="${mem_key}">
	    
		   <%-- 예약 내역이 있는 경우 --%>
		   <c:if test="${listcount > 0}">
				<div class = "row">
			
					<c:set var="num" value="${listcount - (page - 1)*10}" />
					<c:forEach var="b" items="${reservelist}">
						<!-- eventlist를 Bean의 형식으로 b에 담아 춢력 -->
						
						<div class="col-md-6">
							<div class = "reserve_card">
							<div class = "wrapper">
							    <!-- 사진 출력 부분 -->
      							<img class = "room_picture" name = "room_picture" src = "resources/image/room/${b.file_name}">        			
        					
        						<div class = "reserve_card_contents">
        						<!--  예약 완료시 -->
        						<c:if test = "${b.status  != 0}">      					
		        						<button class = "p_reserve_no">
		        							<span>&nbsp;예약 번호 : <span name = "r_code" style = "color : #7F56D2;">${b.r_code}&nbsp;</span></span>
		        						</button>
		        						<c:if test = "${b.reserve_date < now}" >	
        										<button class = "p_reserve_no3">&nbsp;사용 완료&nbsp;</button>
        								</c:if>
        								<c:if test = "${b.reserve_date >= now || b.status == 2}" >
        								</c:if>
        								<br>	
		        				</c:if>
		        				
		        				<!--  취소 완료시 -->
		        				<c:if test = "${b.status  == 0}">		
		        						<button class = "p_reserve_no1">
		        							<span>&nbsp;취소 완료&nbsp;</span>
		        						</button><br>
		        				</c:if>		
		        						
		        				<!--  사용 완료 -->		
		        						<span id = "p_reserve_status"></span><br> 								
        								<p class = "p_room_name">${b.room_name}</p>
        								<br>
        								<span>
        									${fn:substring(b.reserve_date,0,4)}. ${fn:substring(b.reserve_date,5,7)}. ${fn:substring(b.reserve_date,8,10)}
        									${b.start_time}시&nbsp;~&nbsp;${b.end_time}시,&nbsp;${b.end_time - b.start_time}시간
        								</span>
        								<br><br>
        								<input type = "hidden" name = "reserve_date" class = "reserve_date" value = "${b.reserve_date}">
        								<span><fmt:formatNumber value = "${b.total_cost}" pattern = "￦#,###"/></span>
        								
        								
        								<c:if test = "${b.reserve_date < now && b.status == 1}" >	
        									<span class = "registerReview">
        										<button class = "registerReviewButton">후기 등록 하기</button>
        									</span>
        								</c:if>	
										<c:if test = "${b.status == 2}">
											<span class = "registerReview">
        										<button class = "registerReviewButton2">후기 등록 완료</button>
        									</span>
										</c:if>      							
        									<input type = "hidden" value = "${b.room_code}" class = "room_code" name  = "room_code">
        									<input type = "hidden" value = "${b.reserve_date}" class = "reserve_date" name = "reserve_date">
        									<input type = "hidden" value = "${b.r_code}" class = "r_code" name = "r_code">        									
								</div>  
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
		<p id = "nocontent">예약 내역이 없습니다.</p>
	</c:if>	
	</div><!--  container end -->
	
	<!-- 후기 등록 모달 -->
	<div class="modal" id="registerReviewModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style = "font-weight:bold; font-size:16px; width:100%">후기 등록</h4>
					<button type="button" class="close" style = "width:50%"; data-dismiss="modal">&times;</button>
					<!--x부분 data-dismiss는 모달 종료할때 쓰는것 modal을 종료시키겠다. -->
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p><span name = "roomName"></span> 사용후기</p>
					<br>
						<textarea class="form-control" id="content" name = "content" rows="10"></textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">					
						<input type=hidden name="mem_key" value="${mem_key}" id="mem_key">
						<input type="submit" class="btn btn-dark" data-dismiss="modal" id=registermodalSubmit value=등록>					
					<input type="button" class="btn btn-light" data-dismiss="modal" value=취소>
					<!-- 닫기버튼 -->
				</div>
			</div>
		</div>
	</div>
</body>