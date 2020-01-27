<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">
<style>	
/** 글자 관련!!!!*/
.p_title {font-family: "맑은 고딕"; text-align: center; font-size: 32px;}
#nocontent{font-size:24px; font-weight:bold; margin:10; color:#56D7D6; text-align:center}

/** 페이지 네이션*/
.center-block {display: flex;justify-content: center}

/** 카드 관련*/
.p_room_code{font-weight:bold; font-size:16px;}
.reserve_card{background-color:#EBF5FF; margin:20px; padding:10px; max-height:150px;display:inline_block}
.room_picture{width:100px; height:100px; border:1px solid black; float:left; margin:10px;}
.reserve_card_contents{float:left; margin:10px}
.reserve_card_contents:after{clear:both;}
/** 폼 관련 */
.row{margin-right:0px}

</style>
</head>
<body>
	<div class = "container">
		<div class = "row">
		<div class = "pp">	
			<div class="col-md-12">
      			<a href = "main.net" style = "text-decoration:none">메인 페이지로 돌아가기</a><span>
				<br> <br>
				<p class="p_title">예약 내역 리스트</p>
				<br> <br>

				<input type="hidden" name="mem_key" id="mem_key" value="${mem_key}">
			</div>

	
	<%-- 예약 내역이 있는 경우 --%>
	<c:if test="${listcount > 0}">
				<div class="p_reserveList">

				<div class="row">
					<c:set var="num" value="${listcount - (page - 1)*10}" />
					<c:forEach var="b" items="${reservelist}">
						<!-- eventlist를 Bean의 형식으로 b에 담아 춢력 -->

						<div class="reserve_card col-md-5">
								<input type = "hidden" value = "${b.r_code}" name  = "r_code">								
							    
      							<img class = "room_picture" name = "room_picture" src = "${room_picture}">        			
        					
        						<div class = "reserve_card_contents">
		        						<span id = "p_reserve_no">예약 번호 : ${b.r_code}</span><span id = "p_reserve_status"></span>  								
        								<p class = "p_room_code">${b.room_code}</p>
        								<br>
        								<span>${fn:substring(b.reserve_date,0,4)}년 ${fn:substring(b.reserve_date,5,7)}월 ${fn:substring(b.reserve_date,8,10)}일</span>
        								<br>
        								${b.start_time}시&nbsp;~&nbsp;${b.end_time}시,&nbsp;${b.end_time - b.start_time}시간
        								<br><br>
        								<span><fmt:formatNumber value = "${b.total_cost}" pattern = "￦#,###"/></span>
								</div>  

						</div>
						<br><br>
					</c:forEach>
				</div>
				</div>
				</div>
		</div>

	
	
	
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
	</div>
</body>