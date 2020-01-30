<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice view</title>

<style>

* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

body {
	background-color: #f2f2f2;
}

.contentwrap {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

.contentarea {
	background-color:white;
	width:55%;
	height:800px;
}

.s_title {
	margin-top: 30px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}
   
.title {
	font-size:24px
}

.date {
	font-size:14px;
}
   
.content {
	border:0px;
	font-size:14px;
}
   
th {
	text-align:center
}

.listbtn {
	width: 330px;
	height: 43px;
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 20px;
	border: none;
	cursor: pointer;
}

.listbtn:hover {
	opacity: 70%;
}

</style>

<script>
  
</script>
</head>


<body>

<div class=contentwrap>

<div class=contentarea>

<input type="hidden" id="memberkey" value="${key }" name="memberkey">
<p class=s_title></p>

   <div class="s_container">
      <table class="table">

         <tr>
            <td class=title>${noticedata.NOTICE_TITLE }</td>
         </tr>
         <tr>
            <td class=date>${noticedata.NOTICE_DATE }</td>
         </tr>
         <tr>
            <td><textarea class="content" rows="20" readOnly style="width:100%">${noticedata.NOTICE_CONTENT }</textarea></td>
         </tr>
         
         <tr>
            <td>
               
           <!-- 관리자만 수정/삭제 가능    
           <c:if test="${member.name== '관리자' }">
           
               <a href="NoticeModifyView.bo?num=${noticedata.NOTICE_NUM }">
                  <button class="modifybtn">수정</button>
               </a>
               
               <a href="#">
                  <button class="deletebtn" data-toggle="modal" 
                  				data-target="#myModal">삭제</button>
               </a>
            </c:if> 
           	 여기까지 -->
            
               <a href="NoticeList.bo"><button class="listbtn">리스트</button></a>
               </td>
         </tr>
      </table> 
      

	
   </div>
</div>
</div>   
</body>
</html>