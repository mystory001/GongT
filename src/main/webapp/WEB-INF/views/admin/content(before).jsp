<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>notice</title>
<style>
#border{
	height: 1000px;
}
#up {
	margin-top : 75px;
	text-align: center;
	width: 100%;
/* 	background-color: lightgray; */
	height: 100px;
	line-height: 100px;
}

#left {
	height: 300px;
	width: 15%;
	border-style : groove;
	float: left;
	border-radius: 20px;
	text-align: center;
	margin-left: 10%;
}

#right {
 	height: 50%; 
	width: 60%;
	float: left;
	text-align: center;
	margin-right: 10%;
}


table {
	width: 100%;
/* 	height: 200px; */
/* 	border-collapse: collapse; */
	margin-bottom: 20px;
	float:left;
	line-height:30px;
	text-align:left;
	margin-left:20px;
}

th, td {
	border: 1px solid black;
/* 	text-align: center; */
	padding: 4px;
	height: 1px;
	
}
a {
  text-decoration-line: none;
}
#footer {
    position: relative; 
    transform: translatY(100%);
}

</style>
</head>
<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">
	<h1>공지사항</h1>
</div>
<div id="left">		
<ul>
<li style="font-weight: bold;">
<a href="${pageContext.request.contextPath}/Admin/notice">공지사항</a></li>
<li><a href="${pageContext.request.contextPath}/Admin/FAQ">자주 묻는 질문</a></li>
<li><a href="${pageContext.request.contextPath}/Admin/inquiry">1:1문의</a></li>
</ul>
</div>
<div id="right">
<form action="" id="join">
<fieldset>
<table id="notice">
<tr><td>글번호</td><td>${noticeDTO.n_num}</td></tr>
<tr><td>제목</td><td>${noticeDTO.n_title}</td></tr>
<tr><td>작성자</td><td>${noticeDTO.admin_id}</td></tr>  
<tr><td>글내용</td><td>${noticeDTO.n_content}</td></tr>
<tr><td>작성날짜</td><td>${noticeDTO.n_date}</td></tr>
<tr><td>조회수</td><td>${noticeDTO.n_readcount}</td></tr> 
</table>
<div id="table_search">
	<c:if test="${sessionScope.id == 'admin'}">
		<input type="button" value="글수정" class="btn" 
  			onclick="location.href='${pageContext.request.contextPath}/Admin/update?n_num=${noticeDTO.n_num}'">
		<input type="button" value="글삭제" class="btn" 
  			onclick="location.href='${pageContext.request.contextPath}/Admin/delete?n_num=${noticeDTO.n_num}'">
  			</c:if>
<input type="button" value="글목록" class="btn" 
  onclick="location.href='${pageContext.request.contextPath}/Admin/notice'">
</div>
</fieldset>
</form>
<div class="clear"></div>
</div>
</div>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>