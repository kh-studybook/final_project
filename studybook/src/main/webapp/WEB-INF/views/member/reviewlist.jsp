<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

body {
	background-color: #f2f2f2;
}

.w_div {
	display: inline-block;
}

.w_title {
	margin-top: 100px;
	margin-bottom: 70px;
	font-size: 32px;
	text-align: center;
}

.w_card {
	border: 1px solid #C1C1C1;
	padding: 20px;
	background: white;
	margin-bottom: 25px;
}

.w_img {
	width: 140px;
}

.w_content {
	line-height: 24px;
	font-size: 12px;
	color: #555555;
}

.w_badge {
	font-size: 12px;
	margin-bottom: 13px;
}

.w_padding {
	padding-left: 20px;
}

.w_name {
	font-size: 24px;
	color: #333333;
}

.w_time {
	font-size: 24px;
	color: #333333;
	font-size: 12px;
}

.w_btn {
	line-height: 24px;
	font-size: 12px;
}

.w_center-block {
	display: flex;
	justify-content: center; /* 가운데 정렬 */
	margin-bottom: 20px;
}

.w_topmargin {
	margin-top: 30px;
}

.w_margin-top {
	margin-top: 50px;
}

.w_modal {
	font-size: 18px;
	width: 140px;
}

#contents {
	font-size: 14px;
}
.event_btn{color:black !important;}
.event_btn:hover{cursor: pointer; color: #3EF4F3 !important; text-decoration:none;}
.event_btn:visited{color:black !important; }
</style>

</head>
<body>
	<p class=w_title>후기 관리</p>
	<div class=container>
		<%--후기 데이터가 있는 경우 --%>
		<c:if test="${listcount>0}">
			<c:forEach var="m" items="${reviewlist}">
				<div class="w_card">
					<div class="row">
						<div class="col-md-2">
							<a href="room_detail.ro?room_code=${m.room_code}"
								class="thumbnail"> <img class="card-img-top w_img"
								src="resources/image/room/${m.FILE_NAME}">
							</a>
						</div>
						<div class="col-md-6 w_padding">
							<span class="badge badge-secondary w_badge">예약번호:
								${m.r_code}</span>
							<p class="w_name">${m.ROOM_NAME}</p>
							<br>
							<p class="w_time">
								${fn:substring(m.reserve_date,0,4)}.
								${fn:substring(m.reserve_date,5,7)}.
								${fn:substring(m.reserve_date,8,10)}

								${m.start_time}~${m.end_time}시,
								<c:set var="start" value="${m.start_time}" />
								<c:set var="end" value="${m.end_time}" />
								<c:set var="result" value="${end-start}" />
								<c:out value="${result}" />
								시간
							</p>

						</div>
						<div class="col-md-2">
							<p class="w_content">후기 등록 날짜</p>
							<p>${fn:substring(m.review_date,0,4)}.
								${fn:substring(m.review_date,5,7)}.
								${fn:substring(m.review_date,8,10)}
							</p>
						</div>
						<div class="col-md-2">
							<p class="pull-right w_btn">
								<a id="modify_${m.review_code}" class="modify event_btn">수정</a> | <a
									id="delete_${m.review_code}" class="delete event_btn" data-toggle="modal"
									data-target="#deletemodal">삭제</a>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<hr>
							<p class="w_content">${m.content}</p>

						</div>
					</div>
				</div>
			</c:forEach>
			<div class="row">
				<div class="col">
					<div class="w_center-block w_topmargin">
						<div class="row">
							<div class="col">
								<ul class="pagination">
									<c:if test="${page <= 1 }">
										<li class="page-item"><a class="page-link current"
											href="#">이전&nbsp;</a></li>
									</c:if>
									<c:if test="${page > 1 }">
										<li class="page-item"><a
											href="myReviewList.re?page=${page-1}&key=${member.key}"
											class="page-link">이전</a>&nbsp;</li>
									</c:if>

									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<c:if test="${a == page }">
											<li class="page-item"><a class="page-link current"
												href="#">${a}</a></li>
										</c:if>
										<c:if test="${a != page }">
											<li class="page-item"><a
												href="myReviewList.re?page=${a}&key=${member.key}"
												class="page-link">${a}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${page >= maxpage }">
										<li class="page-item"><a class="page-link current"
											href="#">&nbsp;다음</a></li>
									</c:if>
									<c:if test="${page < maxpage }">
										<li class="page-item"><a
											href="myReviewList.re?page=${page+1}&key=${member.key}"
											class="page-link ">&nbsp;다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<%--후기 리스트가 없는 경우 --%>
		<c:if test="${listcount==0}">
			<p class="w_p w_margin-top">작성된 후기가 없습니다.</p>
		</c:if>

	</div>
	<!-- 삭제모달 -->
	<div class="modal" id="deletemodal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title w_modal">후기 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!--x부분 data-dismiss는 모달 종료할때 쓰는것 modal을 종료시키겠다. -->
				</div>

				<!-- Modal body -->
				<div class="modal-body">정말로 삭제하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="button" class="btn btn-light" data-dismiss="modal"
						value=취소>
					<form id=deletemodalForm action="ReviewDelete.re" method="post">
						<input type=hidden name=review_code value="" id=deleteReview>
						<input type=hidden name=key value="${member.key}" id="mem_key">
						<input type="submit" class="btn btn-dark" data-dismiss="modal"
							id=deletemodalSubmit value=삭제>
					</form>

					<!-- 닫기버튼 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 수정 모달 -->
	<div class="modal" id="modifymodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id=modifymodalForm action="ReviewModify.re" method="post">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title w_modal">후기 수정</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<!--x부분 data-dismiss는 모달 종료할때 쓰는것 modal을 종료시키겠다. -->
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<p>
							<span id="room_name"></span> 사용후기
						</p>
						<br>
						<textarea class="form-control" name="contents" id="contents"
							rows="10">
				</textarea>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">

						<input type=hidden name=review_code value="" id=modifyReview>
						<input type=hidden name="key" value="${member.key}" id="key">
						<input type="submit" class="btn btn-dark" data-dismiss="modal"
							id=ModifymodalSubmit value=수정> <input type="button"
							class="btn btn-light" data-dismiss="modal" value=취소>
						<!-- 닫기버튼 -->
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
		//삭제하기 버튼 클릭
		$(".delete").click(function() {
			var deletecode = $(this).attr("id");
			var review_code = deletecode.split("_")[1];
			console.log(review_code);
			$("#deleteReview").val(review_code);

		})

		$("#deletemodalSubmit").click(function() {
			$("#deletemodalForm").submit();
		})
		//수정하기 버튼
		$(".modify").click(function(event) {
			event.preventDefault();
			var modifycode = $(this).attr("id");
			var review_code = modifycode.split("_")[1];
			console.log(review_code);
			$("#modifyReview").val(review_code);
			$.ajax({
				type : "post",
				url : "reviewDetail.re",
				data : {
					"review_code" : review_code
				},
				dataType : "json",
				success : function(resp) {
					console.log(resp);
					$("#contents").text(resp.content);
					$("#room_name").text(resp.room_NAME);
				}
			})
			$("#modifymodal").modal();

		})

		//수정 모달- 수정 버튼
		$("#ModifymodalSubmit").click(function() {
			$("#modifymodalForm").submit();
		})
	</script>
</body>
</html>
