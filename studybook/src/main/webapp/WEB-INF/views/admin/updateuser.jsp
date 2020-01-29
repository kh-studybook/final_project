<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.w_food {
	width: 200px;
}

.w_img {
	width: 200px;
	display: inline-block;
}
</style>
<script>
	
</script>
</head>
<div class="container w_wrap">
	<form action="memberModifyAction.mem" id="frm" name="frm" method="post"
		enctype="multipart/form-data">
		<div class="row">
			<div class="col">
				<p class="w_title">회원 정보 수정</p>
				<br>(*) 필수입력<br> <br>
			</div>
		</div>

		<div class="card card-default">
			<div class="card-header">
				<h4 class="card-title">
					<b class="w_p">회원 정보</b>

				</h4>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">멤버키</label> <input type="text"
								name="key" id="key" maxlength="5" class="form-control"
								value="${userdata.key}" readOnly />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">회원 이름 *</label> <input type="text"
								name="name" id="name" maxlength="16" class="form-control"
								placeholder="이름 입력" required value="${userdata.name}" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">이메일 *</label> <input type="text"
								name="email" id="email" maxlength="60" class="form-control"
								placeholder="이메일 입력" required value="${userdata.email}" readOnly />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">비밀번호</label> <input type="password"
								name="password" id="password" maxlength="15"
								class="form-control" value="${userdata.password}" required readOnly />
						</div>
					</div>
					</div>
					<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">전화번호</label> <input type="text"
								name="phone" id="phone" maxlength="11" class="form-control"
								value="${userdata.phone}" />
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
						<i class="fa fa-save"></i>수정
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
