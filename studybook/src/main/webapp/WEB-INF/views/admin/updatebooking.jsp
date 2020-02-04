<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
* {
	font-family: "맑은 고딕";
	font-size: 14px;
}

.w_wrap {
	font-size: 14px;
}

.card-default {
	color: #333;
	background: linear-gradient(#fff, #ebebeb) repeat scroll 0 0 transparent;
	font-weight: 600;
	border-radius: 6px;
}

.w_title {
	font-size: 32px;
	font-weight: bold;
}

.w_p {
	font-size: 18px;
}

.w_img {
	width: 150px;
	display: inline-block;
}

.w_stext {
	font-size: 12px;
}

.w_margin {
	margin-top: 20px;
}

.w-right {
	margin-right: 5px;
}
</style>
<script>
	$(function() {
		$("input:text[numberOnly]").on("focus", function() {
			var x = $(this).val();
			x = removeCommas(x);
			$(this).val(x);
		}).on("focusout", function() {
			var x = $(this).val();
			if (x && x.length > 0) {
				if (!$.isNumeric(x)) {
					x = x.replace(/[^0-9]/g, "");
				}
				$(this).val(x);
			}
		}).on("keyup", function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		})

		//모든 콤마 제거
		function removeCommas(x) {
			if (!x || x.length == 0)
				return "";
			else
				return x.split(",").join("");
		}

		function compare() {
			var max = $("#max_member").val();
			var min = $("#min_member").val();
			if (parseInt(max) < parseInt(min)) {
				alert("예약 끝시간은 시작 시간보다 큰 수를 입력해주세요. ");
			}
		}

		$("#max_member").on('blur', function() {
			compare();
		})

		//폼전송 전 폼이름이 유효한지 확인
		$('form').submit(function() {
			var max = $("#max_member").val();
			var min = $("#min_member").val();
			if (parseInt(max) < parseInt(min)) {
				alert("예약 끝시간은 시작 시간보다 큰 수를 입력해주세요.");
				return false;
			}
		})

	})
</script>
</head>
<div class="container w_wrap">
	<form action="ReserveModifyAction.re" id="frm" name="frm" method="post"
		enctype="multipart/form-data">

		<div class="row">
			<div class="col">
				<p class="w_title">예약 정보 수정</p>
				<br>(*) 필수입력<br> <br>
			</div>
		</div>

		<div class="card card-default">
			<div class="card-header">
				<h4 class="card-title">
					<b class="w_p">1. 예약 정보</b>
				</h4>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">예약 번호</label> <input type="text"
								name="r_code" id="r_code" maxlength="10" class="form-control"
								value="${reservedata.r_code}" readOnly /> <c:if test="${reservedata.status==1}">정상</c:if>
								<c:if test="${reservedata.status==0}">취소된 예약 </c:if>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">룸 이름</label> <input type="text"
								name="room_name" id="room_name" maxlength="13"
								class="form-control" placeholder="룸이름 입력"
								value="${reservedata.room_name}" readOnly />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">예약 날짜 *</label> <input type="text"
								name="reserve_date" id="reserve_date" maxlength="20"
								class="form-control" placeholder="예약 날짜 입력"
								value="${fn:substring(reservedata.reserve_date,0,10)}" required readOnly />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">시작 시간 *</label> <input type="text"
								name="start_time" id="min_member" maxlength="2"
								class="form-control" placeholder="시작 시간입력"
								value="${reservedata.start_time}" required numberOnly />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">끝 시간 *</label> <input type="text"
								name="end_time" id="max_member" maxlength="2"
								class="form-control" placeholder="끝 시간입력"
								value="${reservedata.end_time}" required numberOnly />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">결제 금액 *</label> <input type="text"
								name="total_cost" id="total_cost" maxlength="10"
								class="form-control" placeholder="결제 금액 입력"
								value="${reservedata.total_cost}" required />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">결제 날짜 *</label> <input type="text"
								name="pay_date" id="pay_date" maxlength="20"
								class="form-control" placeholder="결제 날짜 입력"
								value="${reservedata.pay_date}" required readOnly />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">추가 인원 </label> <input type="text"
								name="extra_num" id="extra_num" maxlength="2"
								class="form-control" placeholder="추가 인원 입력"
								value="${reservedata.extra_num}" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">예약자 이름 *</label> <input type="text"
								name="reserver_name" id="reserver_name" maxlength="12"
								class="form-control" placeholder="예약자 이름 입력"
								value="${reservedata.reserver_name}" required />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">예약자 전화번호 *</label> <input
								type="text" name="reserver_phone" id="reserver_phone"
								maxlength="11" class="form-control" placeholder="예약자 전화번호 입력"
								value="${reservedata.reserver_phone}" required />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">예약자 이메일 *</label> <input type="text"
								name="reserver_email" id="reserver_email" maxlength="40"
								class="form-control" placeholder="예약자 이메일 입력"
								value="${reservedata.reserver_email}" required />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="control-label">요구사항 </label>
							<textarea rows="6" name="require" id="require" maxlength="1300"
								class="form-control" placeholder="요구사항 입력" required>${reservedata.require}</textarea>
						</div>
					</div>
				</div>

			</div>
		</div>
		<br>
		<c:if test="${!empty food_reservelist}">
			<div class="card card-default">
				<div class="card-header">
					<h4 class="card-title">
						<b class="w_p">2. 음료 예약 정보</b>
					</h4>
				</div>
				<div class="card-body">

					<div class="row">
						<div class="col-md-4">
							<p>메뉴</p>
						</div>
						<div class="col-md-4">
							<p>수량</p>
						</div>
						<div class="col-md-4">
							<p>금액</p>
						</div>
					</div>
					<c:forEach var="food" items="${food_reservelist }">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<input type="text" name="food_name" class="form-control"
										value="${food.food_name}" required readOnly />
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<input type="text" name="food_count" class="form-control"
										value="${food.count}" required readOnly />
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<input type="text" name="total_cost" class="form-control"
										value="${food.food_total_cost}" required readOnly />
								</div>
							</div>
						</div>
					</c:forEach>
					<br />
				</div>
			</div>
		</c:if>

		<br />
 
		<div class="row">
			<div class="col-lg-12">
				<div class="container"
					style="display: inline-block; text-align: center;">
					<button type=reset class="btn btn-info" id="cancel"
						onclick="history.back();">취소</button>
					<button type=submit class="btn btn-success" id="btnSubmit">
						<i class="fa fa-save"></i>수정
					</button>
						<c:if test="${reservedata.status==1}">
					<a href="CancelAdReserve.re?r_code=${reservedata.r_code}">
					<button type=button class="btn btn-warning pull-right w-right"
						id="btnCancle">예약 취소</button>
						</a>
						</c:if>

				</div>
			</div>
		</div>
	</form>
	<br>
</div>
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
