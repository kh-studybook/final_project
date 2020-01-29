<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<html>
<head>

<meta charset="UTF-8">
<title>notice list</title>

<style>

* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

body {
	background-color: #f2f2f2;
}

.contentarea {
	background-color:white;
	width:80%;
	height:80%
}

.s_title {
	margin-top: 230px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}

.table {
	width:60%;
}

.center-block {
	display: flex;
	justify-content: center; /*가운데 정렬*/
}

select.form-control {
	width: auto;
	margin-bottom: 2em;
	display: inline-block;
}

.rows {
	text-align: right;
}

.row {
	height: 0
}

.gray {
	color: gray
}

.pagination {
	border: 1px solid white;
}
</style>


<script>
	function go(page) {
		var limit = $('#viewcount').val();
		var data = "limit=" + limit + "&state=ajax&page=" + page;
		ajax(data);
	}

	function setPaging(href, digit) {
		output += "<li class=page-item>";
		gray = "";
		if (href == "") {
			gray = "gray";
		}
		anchor = "<a class='page-link " + gray + "'" 
	           + href + ">"
				+ digit + "</a></li>";
		output += anchor;
	}

	function ajax(data) {

		console.log(data)
		output = "";
		$
				.ajax({
					type : "POST",
					data : data,
					//url: 'NoticeList.bo', //요청 전송 url - 처리해야할 주소
					url : 'NoticeListAjax.bo', //ajax로 바꾸기
					dataType : "json",
					cache : false,
					success : function(data) {
						$("#viewcount").val(data.limit);
						$("table").find("font")
								.text("글 개수 : " + data.listcount);

						if (data.listcount > 0) { // 총갯수가 0개이상인 경우
							$("tbody").remove();
							var num = data.listcount - (data.page - 1)
									* data.limit;
							console.log(num)
							output = "<tbody>";

							$(data.noticelist)
									.each(
											function(index, item) {
												output += '<tr><td>' + (num--)
														+ '</td>'
												img = "";

												output += "<td><div>" + blank
														+ img
												output += ' <a href="./NoticeDetailAction.bo?num='
														+ item.NOTICE_NUM
														+ '&page='
														+ data.page
														+ '">'
												output += item.NOTICE_TITLE
														+ '</a></div></td>'
												output += '<td><div>'
														+ item.NOTICE_DATE
														+ '</div></td></tr>'
											})
							output += "</tbody>"
							$('table').append(output)//table 완성

							$(".pagination").empty(); //페이징 처리
							output = "";

							digit = '이전&nbsp;'
							href = "";
							if (data.page > 1) {
								href = 'href=javascript:go(' + (data.page - 1)
										+ ')';
							}
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
								href = 'href=javascript:go(' + (data.page + 1)
										+ ')';
							}
							setPaging(href, digit);

							$('.pagination').append(output)
						}//if(data.listcount) end

						else {
							$(".container table").remove();
							$(".center-block").remove();
							$('.container').append(
									"<font size=5>등록된 글이 없습니다.</font>");
						}
					}, //success end
					error : function() {
						console.log('에러')
					}
				})// ajax end
	} // fucntion ajax end

	$(function() {
		$("#viewcount").change(function() {
			go(1);//보여줄 페이지를 1페이지로 설정합니다.
		});// change end

		$("button").click(function() {
			location.href = "NoticeWrite.bo";
		})
	})
</script>
</head>
<body>

<div class=contentarea>
	<p class=s_title>공 지 사 항</p>
	
	<div class="container_wrap">
	
	<div class=s_container>
	
		<%-- 게시글이 있는 경우 --%>
		<c:if test="${listcount > 0 }">

			<table class="table">
				<thead></thead>
				<tbody>
					<c:set var="num" value="${listcount-(page-1)*10 }" />
					<c:forEach var="b" items="${noticelist }">
						<tr>
							<td><c:out value="${num }" /> 
								<c:set var="num"
									value="${num-1 }" /></td>
							<td>
								<div>
									<a href="NoticeDetailAction.bo?num=${b.NOTICE_NUM }">${b.NOTICE_TITLE }</a>
								</div>

								<div>${b.NOTICE_DATE }</div>
								
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page<=1 }">
								<li class="page-item"><a class="page-link" href="#">◀
										&nbsp;</a></li>
							</c:if>
							
							<c:if test="${page>1 }">
								<li class="page-item"><a
									href="NoticeList.bo?page=${page-1 }" class="page-link">◀</a>
									&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${startpage }" end="${endpage }">
								<c:if test="${a==page }">
									<li class="page-item"><a class="page-link" href="#">${a }</a>
									</li>
								</c:if>
								
								<c:if test="${a!=page }">
									<li class="page-item"><a href="NoticeList.bo?page=${a}"
										class="page-link">${a }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page>=maxpage }">
								<li class="page-item"><a class="page-link" href="#">&nbsp;
										▶</a></li>
							</c:if>
							<c:if test="${page<maxpage }">
								<li class="page-item"><a class="page-link"
									href="NoticeList.bo?page={page+1}">&nbsp; ▶</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

		</c:if>
		
		<!--  게시글이 없는 경우 -->
		<c:if test="${listcount== 0 }">
			<font size=5>등록된 공지사항이 없습니다.</font>
		</c:if>
		<br>
		<c:if test="${member.name== '손연수' }">
		<button type="button" class="writebtn float-right">글 쓰 기</button>
		</c:if>
		
	</div>
	
</div>	
</body>
</html>