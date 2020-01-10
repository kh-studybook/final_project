<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
	margin-top: 50px;
}

.w_p {
	font-size: 18px;
}
</style>
<script>
	
</script>
</head>
<div class="container w_wrap">
	<form action="RoomAddAction.ro" id="frm" name="frm" method="post"
		enctype="multipart/form-data">
		<!-- 여기에 enctype=multipart써있어야 액션에서 multipart request쓸 수 있음 -->

		<div class="row">
			<div class="col">
				<p class="w_title">공간 등록</p>
				<br>
			</div>
		</div>

		<div class="card card-default">
			<div class="card-header">
				<h4 class="card-title">
					<b class="w_p">1. 공간기본정보</b>

				</h4>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">룸 이름</label> <input type="text"
								name="ROOM_NAME" id="room_name" maxlength="16"
								class="form-control" placeholder="룸이름 입력" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">룸 소개</label> <input type="text"
								name="ROOM_INFO" id="room_info" maxlength="60"
								class="form-control" placeholder="룸소개 입력" />
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label">해시태그(#으로 구분)</label> <input
								type="text" name="HASHTAG" id="hashtag" maxlength="20"
								class="form-control" placeholder="해시태그 입력" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label">공간소개</label>
							<textarea rows="6" name="ROOM_INTRO" id="room_intro"
								maxlength="1300" class="form-control" placeholder="공간소개 입력"></textarea>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label">시설소개</label>
							<textarea rows="6" name="FAC_INTRO" id="FAC_intro"
								maxlength="1300" class="form-control" placeholder="시설소개 입력"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div class="card card-default">
			<div class="card-header">
				<h4 class="card-title">
					<b class="w_p">2. 요약정보</b>
				</h4>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">공간유형 (60자 이하)</label> <input
								type="text" name="ROOM_TYPE" id="room_type" maxlength="60"
								class="form-control" placeholder="공간유형 입력" class="form-control" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">최소인원(숫자 입력)</label> <input
								type="text" name="MIN_MEMBER" id="min_member" maxlength="2"
								class="form-control" placeholder="최소인원 입력" class="form-control" />
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">최대인원(숫자 입력)</label> <input
								type="text" name="MAX_MEMBER" id="max_member" maxlength="3"
								class="form-control" placeholder="최대인원 입력" class="form-control" />
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">시간당 가격(숫자 입력)</label> <input
								type="text" name="HOUR_COST" id="hour_cost" maxlength="5"
								class="form-control" placeholder="시간당 가격 입력"
								class="form-control" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<label class="control-label">아이콘 정보 세팅</label>

						<table class="table table-primary">
							<tbody>
								<tr>
									<td>주류 반입</td>
									<td>마이크/음향</td>
									<td>의자/테이블</td>
									<td>음식물 반입</td>
								</tr>
								<tr>
									<td><label class="control-label"> <input
											type="checkbox" name="ALCOHOL" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="MIC" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="CHAIR" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="FOOD" value="1">
									</label></td>
								</tr>

								<tr>
									<td>내부 화장실</td>
									<td>금연</td>
									<td>주차</td>
									<td>TV/빔 프로젝터</td>
								</tr>
								<tr>
									<td><label class="control-label"> <input
											type="checkbox" name="TOILET" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="SMOKING" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="PARKING" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="TV" value="1">
									</label></td>
								</tr>

								<tr>
									<td>화이트보드</td>
									<td>인터넷</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><label class="control-label"> <input
											type="checkbox" name="BOARD" value="1">
									</label></td>
									<td><label class="control-label"> <input
											type="checkbox" name="WIFI" value="1">
									</label></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br />
			</div>
		</div>
		<br>
		<!-- 여기서부터 이미지 업로드 -->
		<div class="card card-default">
			<div class="card-header">
				<h4 class="card-title">
					<b class="w_p">3. 이미지등록</b>

				</h4>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-12">
						<div class="body">
							<!-- 첨부 버튼 -->
							<div>
								<input multiple="multiple" type="file" name="filename" /> 
							</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />

		<div class="row">
			<div class="col-lg-12">
				<div class="container"
					style="display: inline-block; text-align: center;">
					<button type=reset class="btn btn-info" id="cancel"
						onclick="history.back();">취소</button>
					<button type=submit class="btn btn-success" id="btnSubmit">
						<i class="fa fa-save"></i>등록
					</button>
				</div>
			</div>

		</div>
	</form>
	<br>
</div>
<script>
	
</script>

<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
