$(function(){
	$("#comment table").hide();
	
	function getList(){
		$.ajax({
			type : "post",//전송 방식
			url : "CommentList.bo",//요청 주소
			data : {"BOARD_RE_REF" : $("#BOARD_RE_REF").val()},//보내는 데이타
			dataType : "json",//결과물을 json으로 변화시킨다. 없으면 그냥 String으로 넘어온다.
			success : function(rdata){//성공하면 function을 실행시키는데, 넘어오는 값이 dataType으로 넘어온 rdata 객체이다.
				if (rdata.length > 0) {
					$("#comment table").show();
					$("#comment thead").show();
					$("#comment tbody").empty();
					$("#message").text('');
					output = '';
					$(rdata).each(function(){
						img = '';
						if($("#loginid").val() == this.id){//로그인한 아이디와 글쓴 사람의 아이디가 같을 때
							img = "<img src = 'resources/image/pencil2.png' width='15px' " 
								+ "class='update'>"
							+ "<img src = 'resources/image/remove.png' width='15px' "
							 	+ "class='remove'>"
							+ "<input type = 'hidden' value = '" + this.num
							+ "' > ";									 
						} 
						output += "<tr><td>" + this.id + "</td>";
						output += "<td>" + this.content + "</td>";
						output += "<td>" + this.reg_date + img + "</td></tr>";
					});
					$("#comment tbody").append(output);
				} else {
					$("#message").text("등록된 댓글이 없습니다.");
					$("#comment thead").hide();
					$("#comment tbody").empty();
				}
				$("#count").text(rdata.length);
			}
		});
	}//getList end
	
	$("form").submit(function(){
		if($("#board_pass").val() == ''){
			alert("비밀번호를 입력하세요");
			$("#board_pass").focus();
			return false;
		}
	});//비밀번호 입력 이벤트 end
	
	$(".start").click(function(){
		getList();
	});//click end
	//댓글 버튼을 눌렀을 때 댓글 목록 가져오기
	
	//글자수 50개 제한
	$("#content").on('input', function(){
		length = $(this).val().length;
		if (length > 50) {
			lenght = 50;
			content = content.substring(0, length);
		}
		$(".float-left").text(length + "/50");
	});//content input end
	
	//등록 또는 수정완료 버튼을 클릭한 경우
	//버튼의 라벨이 '등록'인 경우는 댓글을 추가하는 경우
	//버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우
	$("#write").click(function(){
		buttonText = $("#write").text();
		content = $("#content").val();
		$(".float-left").text('총 50자까지 가능합니다.');
		if (buttonText == "등록") {//댓글을 추가하는 경우
			url = "CommentAdd.bo";
			data = {"content" : content,
					"id" : $("#loginid").val(),
					"BOARD_RE_REF" : $("#BOARD_RE_REF").val()};		
		} else {//댓글을 수정하는 경우
			url = "CommentUpdate.bo";
			data = {"num" : num, "content" : content};
			$("#write").text("등록");//다시 등록으로 변경
		}

		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function(result){
				$("#content").val('');
				if (result == 1) {
					getList();
				}
			}
			
		});//ajax end
	});//write end
	
	//pencil2.png를 클릭하는 경우(수정)
	$("#comment").on('click', '.update', function(){
		before = $(this).parent().prev().text();
		$("#content").focus().val(before);
		num = $(this).next().next().val();//수정할 댓글번호를 저장
		$("#write").text("수정완료");//등록 버튼의 라벨을 '수정완료'로 변경
		$(this).parent().parent().css('background', 'lightgray');
	});//pendil2 end
	
	//remove.png를 클릭하는 경우
	$("#comment").on('click', '.remove', function(){
		var num = $(this).next().val();//댓글 번호
		
		$.ajax({
			type : "post",
			url : "CommentDelete.bo",
			data : {"num" :  num},
			success : function(result){
				if (result == 1) {
					getList();
				}
			}
		})
	})//remove end
});//전체 end