<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice_write</title>

<%-- <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="${pageContext.request.contextPath}/resources/css/subpage.css" rel="stylesheet" type="text/css"> --%>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />


<style>
#border{
	height: 1130px;
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
	height: 400px;
	width: 180px;
/* 	border-style : groove; */
	float: left;
/* 	border-radius: 20px; */
	text-align: center;
	margin-left: 10%;
}

#right {
 	height: 700px; 
	width: 700px;
	float: left;
	text-align: center;
	margin-right: 10%;
		position: relative;
		left : 8%;
}


table {
	width: 100%;
/* 	height: 200px; */
	border-collapse: collapse;
	margin-bottom: 20px;
	padding-left:50px;
}

 th, td { 

 	padding: 4px; 
 
}
a {
  text-decoration-line: none;
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

#notice{
	margin-left:200px;
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

</head>
<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">
	
</div>

<div id="left">		

<!-- <ul> -->
<%-- <%-- <jsp:include page="../top.jsp" /> --%> 
<%-- <li style="font-weight: bold;"><a href="${pageContext.request.contextPath}/Admin/notice">공지사항</a></li> --%>

<%-- <li><a href="${pageContext.request.contextPath}/Admin/FAQ">자주 묻는 질문</a></li> --%>
<%-- <li><a href="${pageContext.request.contextPath}/Admin/inquiry">1:1문의</a></li> --%>

<!-- </ul> -->
<div class="sidemenu">
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" style="color: white !important;">공지사항</span></button>
      	<button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'">자주 묻는 질문</span></button>
        <button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'">1:1문의</span></button>

</div>
</div>

<div id="right">
<h2 style="margin-left: 120px;">공지사항 수정하기</h2>

<form action="${pageContext.request.contextPath}/Admin/updatePro" method="post">
<input type="hidden" name="n_num" value="${noticeDTO.n_num}">
<table>
<tr>
	<td>공지사항 작성자</td>
	<td><input type="text" name="id" id = "write" value="${sessionScope.id}"  style ="width:473px;" readonly></td>
</tr>
<tr>
	<td>공지사항 제목</td>
	<td><input type="text" id = "write" name="n_title"  style ="width:473px;"></td>
</tr>
<tr>
	<td>공지사항 내용</td>
	<td><textarea name="n_content" rows="20" cols="50" id = "write" style ="width:473px;"></textarea></td>
</tr>
<tr>
<td></td>
<td style="text-align: center;"><input type="submit" value="수정하기"  class="btn btn-primary" ></input></td>
</tr>

</table>
</form>
<div class="clear"></div>



	

	
</div>

</div>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>