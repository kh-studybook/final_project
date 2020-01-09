function go(page){
	var limit = $("#viewcount").val();
	var data = "limit=" + limit + "&state=ajax&page=" + page;
	ajax(data);
}

function setPaging(href, digit){
	output += "<li class = page-item>";
	gray = "";
	if (href  == "") {
		gray="gray";//현재 페이지에 회색이 나오도록 하기 위함
	}
	anchor = "<a class = 'page-link " +  gray + "'" + href + ">" + digit + "</a></li>";
	output += anchor;
}

function ajax(data){
	//1줄보기 선택시 리턴된 데이터
	console.log(data)
	output = "";
	
	/*
	{"page":2, "maxpage":5, "startpage":1, "endpage":5, "listcount":15,
 	"limit":3, "boardlist":[
                    {"BOARD_NUM":11,"BOARD_NAME":"admin","BOARD_SUBJECT":"Re: 매일 어려워요...","BOARD_CONTENT":"정말로...","BOARD_RE_REF":10,"BOARD_RE_LEV":1,"BOARD_RE_SEQ":1,"BOARD_READCOUNT":7,"BOARD_DATE":"2019-11-28"},
                    {"BOARD_NUM":13,"BOARD_NAME":"admin","BOARD_SUBJECT":"Re: Re: 저도요.","BOARD_CONTENT":"ㅇㅇ","BOARD_RE_REF":10,"BOARD_RE_LEV":2,"BOARD_RE_SEQ":2,"BOARD_READCOUNT":6,"BOARD_DATE":"2019-11-28"},
                    {"BOARD_NUM":12,"BOARD_NAME":"admin","BOARD_SUBJECT":"Re: Re: 찬성입니다.","BOARD_CONTENT":"ㅇㅇ","BOARD_RE_REF":10,"BOARD_RE_LEV":2,"BOARD_RE_SEQ":3,"BOARD_READCOUNT":9,"BOARD_DATE":"2019-11-28"}
                  ]}
	콤마로 나누므로, []안의 {}안에는 세 줄이 있는 것이다.
	*/	
	
	$.ajax({
		type : "POST",
		data : data,
		url : "BoardListAjax.bo",//위의 데이타를 들고 BoardList.bo로 간다.
		dataType : "json", //String을 object 형으로 가져옴
		cache : false,
		success : function(data){
			$("#viewpoint").val(data.limit);//응답으로 온 limit 값
			$("table").find("font").text("글 개수 : " + data.listcount);
			
			if (data.listcount > 0 ) {//총 개수가 0개 이상인 경우
				$("tbody").remove();
				var num = data.listcount - (data.page - 1)*data.limit;
				console.log(num)
				output = "<tbody>";
				$(data.boardlist).each(
						function(index, item){//넘어오는 값이 배열이므로 each로 받는다.
						/*qna_board_list의 <c:set var = "num" value = "${listcount - (page - 1)*10}"/>
						<c:forEach var = "b" items = "${boardlist}">*/
						output += '<tr><td>' + (num--) + '</td>';
						blank_count = item.board_RE_LEV * 2 + 1;//답변 앞에 공백 넣어주기
						blank = '&nbsp;';
						for (var i = 0; i < blank_count; i++) {
							blank += '&nbsp;&nbsp;';
						}
						img = "";
						if (item.board_RE_LEV > 0) {
							img = "<img src = 'resources/image/AnswerLine.gif'>";
						}
						output += "<td><div>" + blank + img
						output += ' <a href ="/BoardDetailAction.bo?num='
							+ item.board_NUM + '&page=' + data.page + '">'
						output += item.board_SUBJECT + '</a></div></td>'
						output += '<td><div>' + item.board_NAME + '</div></td>'
						output += '<td><div>' + item.board_DATE + '</div></td>'
						output += '<td><div>' + item.board_READCOUNT + '</div></td></tr>'
						})//F12로 보면 board가 소문자로 넘어온다. 이와 일치시키기 위해 board를 소문자로 변경한다.
				
				output += '</tbody>';
				$('table').append(output)//table 완성
				
				$(".pagination").empty();//페이징 처리
				output = "";//기존의 것을 지운다.
				
				digit = '이전&nbsp;'
				href = ""
				if (data.page > 1) {
					href = 'href=javascript:go(' + (data.page - 1) + ')';
				}//현재보다 한 페이지 적은 곳으로 이동
				setPaging(href, digit);
				
				for (var i = data.startpage; i <= data.endpage; i++) {
					digit = i;
					href = "";
					if (i != data.page) {
						href = 'href=javascript:go(' + i + ')';
					}
					setPaging(href, digit);
				}
				
				digit = '다음&nbsp;';
				href = "";
				if (data.page < data.maxpage) {
					href = 'href=javascript:go(' + (data.page + 1) + ')';
				}
				setPaging(href, digit);
				
				$('.pagination').append(output)		
			}//if end
			else {
				$(".container table").remove();//기존의 자료를 다 지움
				
				$(".center-block").remove();
				$(".container").append("<font size=5>등록된 글이 없습니다.</font>");
			}
		},//success end
		error : function(){
			console.log('에러')
		}
	});//ajax end	
}//function ahax end

$(function(){
	$("#viewcount").change(function(){
		go(1);//보여줄 페이지를 1페이지로 설정합니다. 함수 호출
	});//change end
	
	$("button").click(function(){
		location.href = "BoardWrite.bo";
	});//click end
})