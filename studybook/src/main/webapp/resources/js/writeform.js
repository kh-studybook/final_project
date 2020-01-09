$(document).ready(function(){
	
	$("form").submit(function(){
		if ($.trim($("#board_pass").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#board_pass").focus();
			return false;
		}
		if ($.trim($("#board_subject").val()) == "") {
			alert("제목을 입력하세요.");
			$("#board_subject").focus();
			return false;
		}
		if ($.trim($("textarea").val()) == "") {
			alert("내용을 입력하세요.");
			$("textarea").focus();
			return false;
		}
	});//submit end
	
	show();
	function show(){
		//파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우 보이지 않게 합니다.
		if ($("#filevalue").text() == "") {
			$(".remove").css("display", "none");
		} else {
			$(".remove").css("display", "inline-block");
		}
	}
		
	$("#upfile").change(function(){
		var inputfile = $(this).val().split('\\');
		$("#filevalue").text(inputfile[inputfile.length-1]);
		show();
	});	//upfile end
	
	//remove 이미지를 클릭하면 파일명을 ''로 변경하고 remove 이미지를 보이지 않게 합니다.
	$(".remove").click(function(){
		$("#filevalue").text('');
		$(this).css('display', 'none');
		$("input[name=BOARD_ORIGINAL]").val('');
		$("input[name=BOARD_FILE]").val('');
	});
});//ready end