<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>notice</title>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />


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
/* 	border-style : groove; */
	float: left;
/* 	border-radius: 20px; */
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

button{
padding:0; margin:0; font-size:12.5px; letter-spacing: 0px; border:0 none;
vertical-align:middle; overflow:visible; background:transparent; cursor:pointer;
}

.sidemenu {
	width: 15%;
	position: relative;
	top : 5%;
	left : 8%;
}

</style>
</head>
<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">
<!-- 	<h1>문의하기</h1> -->
</div>

<div id="left">		
<div class="sidemenu">
        <button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" >공지사항</span></button>
      	<button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'" >자주 묻는 질문</span></button>
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'" style="color: white !important;">1:1문의</span></button>
</div>
</div>


<div id="right">
<form action="" id="join">
<fieldset>
<table id="notice">
<tr><td>문의 번호</td><td>${inquiryDTO.i_num}</td></tr>
<tr><td>문의 제목</td><td>${inquiryDTO.i_title}</td></tr>
<tr><td>문의 작성자</td><td>${inquiryDTO.id}</td></tr>  
<tr><td>문의 내용</td><td>${inquiryDTO.i_content}</td></tr>
<tr><td>문의 작성날짜</td><td>${inquiryDTO.i_date}</td></tr>

</table>
<div id="table_search">
		<c:if test="${sessionScope.id != 'admin'}">
		<input type="button" value="문의 수정" class="btn" 
  			onclick="location.href='${pageContext.request.contextPath}/Admin/update?n_num=${inquiryDTO.i_num}'">
		<input type="button" value="문의 삭제" class="btn" 
  			onclick="location.href='${pageContext.request.contextPath}/Admin/delete?n_num=${inquiryDTO.i_num}'">
  		</c:if>
  		<c:if test="${sessionScope.id == 'admin'}">
		<input type="button" value="답변 쓰기" class="btn"  
  	onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry_update?i_num=${inquiryDTO.i_num}'">
		</c:if>
<input type="button" value="문의 목록" class="btn" 
  onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'">
</div>
</fieldset>
</form>
<div class="clear"></div>
</div>
</div>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>