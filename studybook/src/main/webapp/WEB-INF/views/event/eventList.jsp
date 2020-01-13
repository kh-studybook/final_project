<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<style>
	/** 글자 관련!!!!*/
	.p_evenList.jsp > h2{font-family:"맑은 고딕"; text-align:center;}
	.p_evenList.jsp > .p_p_title{font-family:"맑은 고딕"; text-align:center;}
	
	/** 버튼 관련*/
	#p_register_event{border:none; background-color: #7F56D2; color:white; width:20%; padding: 12px; }
</style>
<script>
	$("#p_register_event").click(function(){
		location.href = "EventAddAction.eve";
	});
</script>
</head>
<body>
	<container class = "p_evenList.jsp">
	<br><br>
	<h2 class = "p_title">이벤트 등록</h2><br>
	<p class = "p_p_title">여러분의 이벤트를 등록해주시면 메인에 홍보해드립니다.</p>
	<div class = "">
	
	
	</div>
	<button id = "p_register_event">글등록</button>
	</container>
</body>
