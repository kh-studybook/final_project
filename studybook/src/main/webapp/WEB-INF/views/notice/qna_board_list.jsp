<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<title>notice list</title>

	<style>
		.center-block{
			display:flex;
			justify-content:center; /*가운데 정렬*/
		}
		select.form-control{width:auto;margin-bottom:2em;display:inline-block;}
         .rows{text-align:right;}
         .row{height:0}
         .gray{color:gray}
	</style>
<script src="resources/js/list.js"></script>
</head>

<body>	
	<div class="container">
		<%-- 게시글이 있는 경우 --%>
		<c:if test="${listcount > 0 }" >
			<div class="rows"></div>
	
			<c:set var="num" value="${listcount-(page-1)*10 }"/>
			<c:forEach var="n" items="${noticelist }">
				<div>
					<a href="NoticeDetailAction.n?num=${n.NOTICE_NUM }">${n.NOTIVE_SUBJECT }</a>
				</div>

				<div>${n.NOTICE_NAME } ${n.NOTICE_DATE }</div>
					
			</c:forEach>
			
		
		<div class="center-block">
			<div class="row">
				<div class="col">
					<ul class="pagination">
					<c:if test="${page<=1 }">
						<li class="page-item">
						<a class="page-link" href="#">◀&nbsp;</a>
						</li>
					</c:if>
					<c:if test="${page>1 }">
						<li class="page-item">
						<a href="BoardList.bo?page=${page-1 }" class="page-link">◀</a> &nbsp;
						</li>
					</c:if>
					
					<c:forEach var="a" begin="${startpage }" end="${endpage }">
						<c:if test="${a==page }">
						<li class="page-item">
						<a class="page-link" href="#">${a }</a>
						</li>
						</c:if>
						<c:if test="${a!=page }">
						<li class="page-item">
						<a href="BoardList.bo?page=${a}" class="page-link">${a }</a>
						</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage }">
						<li class="page-item">
							<a class="page-link" href="#">&nbsp;▶</a>
						</li>
					</c:if>
					<c:if test="${page<maxpage }">
						<li class="page-item">
							<a class="page-link" href="BoardList.bo?page={page+1}" >&nbsp;▶</a>
							
						</li>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
		
		</c:if>
		<!--  게시글이 없는 경우 -->
		<c:if test="${listcount== 0 }">
			<font size=5>등록된 글이 없습니다.</font>
		</c:if><br>
		<button type="button" class="btn btn-info float-right">글 쓰 기</button>
	</div>

</body>
</html>