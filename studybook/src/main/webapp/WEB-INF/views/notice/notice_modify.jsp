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
	$(document).ready(function() {
		$('input[type=file]').on('change', preview);

		function preview(e) {
			//선택한 그림의 File 객체를 취득
			//파일 여러개 넘어올 수 있으니 인덱스 0을 함
			var file = e.target.files[0];

			//file.type :파일의 형식(MIME타입-예) text/html)
			if (!file.type.match('image.*')) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			//파일을 읽기 위한 객체 생성
			var reader = new FileReader();

			//DataURL 형식으로 파일을 읽어옵니다.
			//읽어 온 결과는 reader 객체의 result 속성에 저장됩니다.
			reader.readAsDataURL(file);

			//읽기에 성공했을 때 실행되는 이벤트 핸들러
			reader.onload = function(e) {
				//result: 읽기 결과가 저장됩니다.
				//reader.result 또는 e.target.result
				$(".w_food").attr('src', e.target.result);
			}
		}
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

	})
</script>
</head>
<div class="container w_wrap">
	<form action="FoodModifyAction.re" id="frm" name="frm" method="post"
		enctype="multipart/form-data">
		<div class="row">
			<div class="col">
				<p class="w_title">공지사항 수정</p>
				
			</div>
		</div>

		<div class="card card-default">
			<div class="card-header">
				<h4 class="card-title">
					<b class="w_p">공지사항 리스트</b>

				</h4>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">제목</label> <input type="text"
								name="food_code" id="food_code" maxlength="5"
								class="form-control" value="${noticedata.title}" readOnly />
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
