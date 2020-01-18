<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>notice list</title>

<style>

body { 
	margin-top:200px;
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
</style>

<script>

function go(page) {
	   var limit = $('#viewcount').val();
	   var data = "limit=" + limit + "&state=ajax&page=" + page;
	   ajax(data);
	}

	function setPaging(href, digit){
	   output += "<li class=page-item>";
	   gray="";
	   if(href=="") {
	      gray="gray";
	   }
	   anchor = "<a class='page-link " + gray + "'" 
	           + href + ">"+ digit + "</a></li>";
	   output += anchor;
	}

	function ajax(data) {

	   console.log(data)
	   output = "";
	   $.ajax({
	      type : "POST",
	      data : data,
	      url:'NoticeListAjax.bo',  //ajax로 바꾸기
	      dataType : "json",
	      cache : false,
	      success : function(data) {
	         $("#viewcount").val(data.limit);
	         $("table").find("font").text("글 개수 : " + data.listcount);

	         if (data.listcount > 0) { 
	            $("tbody").remove();
	            var num = data.listcount - (data.page - 1) * data.limit;
	            console.log(num)
	            output = "<tbody>";
	            
	            $(data.boardlist).each(
	               function(index, item) {
	                     
	                  output +=  "<tr><td><div>" + blank + img
	                  output += ' <a href="./NoticeDetailAction.bo?num='
	                          + item.NOTICE_NUM + '&page='
	                         + data.page + '">'
	                  output += item.NOTICE_SUBJECT + '</a></div></td>'
	                  output += '<td><div>' + item.board_NAME + item.board_DATE+'</div></td></tr>'
	               })
	            output += "</tbody>"
	            $('table').append(output)//table 완성
	            
	            $(".pagination").empty(); //페이징 처리
	            output = "";
	            
	            digit = '◀&nbsp;'
	            href="";   
	            if (data.page > 1) {
	               href = 'href=javascript:go(' + (data.page - 1) + ')';
	            }
	            setPaging(href, digit);
	            
	            for (var i = data.startpage; i <= data.endpage; i++) {
	               digit = i;
	               href="";
	               if (i != data.page) {
	                  href = 'href=javascript:go(' + i + ')';
	               } 
	               setPaging( href, digit);
	            }
	            
	            digit = '▶&nbsp;';
	            href="";
	            if (data.page < data.maxpage) {
	               href = 'href=javascript:go(' + (data.page + 1) + ')';
	            } 
	            setPaging( href, digit);

	            $('.pagination').append(output)
	         }//if(data.listcount) end
	         
	         else {
	            $(".container table").remove();
	            $(".center-block").remove();
	            $('.container').append("<font size=5>등록된 글이 없습니다.</font>");
	         }
	      }, //success end
	      error : function() {
	         console.log('에러')
	      }
	   })// ajax end
	 } // fucntion ajax end

</script>

</head>

<body>
	<div class="container">
		<!-- 게시글이 있는 경우 -->
		<c:if test="${listcount > 0 }">
			<div class="rows"></div>

			<c:set var="num" value="${listcount-(page-1)*10 }" />
			<c:forEach var="n" items="${noticelist }">
				<div>
					<a href="NoticeDetailAction.n?num=${n.NOTICE_NUM }">${n.NOTIVE_SUBJECT }</a>
				</div>
				<div>${n.NOTICE_NAME }${n.NOTICE_DATE }</div>

			</c:forEach>


			<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page<=1 }">
								<li class="page-item"><a class="page-link" href="#">◀&nbsp;</a>
								</li>
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
								<li class="page-item"><a class="page-link" href="#">&nbsp;▶</a>
								</li>
							</c:if>
							<c:if test="${page<maxpage }">
								<li class="page-item"><a class="page-link"
									href="NoticeList.bo?page={page+1}">&nbsp;▶</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

		</c:if>
		<!--  게시글이 없는 경우 -->
		<c:if test="${listcount == 0 }">
			<font size=5>등록된 글이 없습니다.</font>
		</c:if>

	</div>

</body>
</html>