<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>notice</title>
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


/* th, td { */
/* 	border: 1px solid black; */
/* 	text-align: center; */
/* 	padding: 4px; */
/* 	height: 1px; */
/* } */


/* input { */
/* 	width: 473px; */
/* 	margin-bottom: 10px; */
	

/* } */
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


</style>
</head>

<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">

<!-- 	<h1>커뮤니티</h1> -->

</div>

<div id="left">		


<div class="sidemenu">
        <button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" >공지사항</span></button>
      	<button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'" >자주 묻는 질문</span></button>
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'" style="color: white !important;">1:1문의</span></button>
</div>


</div>

<div id="right">



<h2 style="margin-left: 120px;">문의 하기</h2>








<c:if test="${sessionScope.id ne 'admin'}">

<form action="${pageContext.request.contextPath}/Admin/inquiry_writePro" method="post">
<table>
<tr>
	<td>문의 작성자</td>
	<td><input type="text" name="id" id = "write" value="${sessionScope.id}" style ="width:473px;" readonly></td>
</tr>
<tr>
	<td>문의 제목</td>
	<td><input type="text" id = "write" name="i_title"  style ="width:473px;"></td>
</tr>
<tr>
	<td>문의 내용</td>
	<td><textarea name="i_content" rows="20" cols="50" id = "write" style ="width:473px;"></textarea></td>
</tr>
<tr>
<td></td>

<td style="text-align: center;"><input type="submit" value="글쓰기" class="btn btn-primary"></input></td>

</tr>

</table>
</form>


</c:if>






<c:if test="${sessionScope.id == 'admin'}">
<form action="${pageContext.request.contextPath}/Admin/inquiry_answerPro" method="post">
<table>
<tr>
	<td>답변 수신자</td>
	<td><input type="text" name="id" id = "write" value="${inquiryDTO.id}" readonly style ="width:473px;"></td>
	</tr>
<tr>
	<td>답변 작성자</td>
	<td><input type="text" name="admin_id" id = "write" value="${sessionScope.id}" readonly style ="width:473px;" ></td>
</tr>
<tr>
<td>답변 제목</td>
	<td><input type="text" id = "write" name="asw_title"  style ="width:473px;"></td>
</tr>
<tr>
<td>문의 답변내용</td>
	<td><textarea name="asw_content" rows="20" cols="50" id = "write" style ="width:473px;"></textarea></td>
</tr>

<input type="hidden" name="i_num" value="${inquiryDTO.i_num}">
<tr>
<td></td>
<td style="text-align: center;"><input type="submit" value="글쓰기" class="btn btn-primary"  ></input></td>
</tr>
</table>
</form>
</c:if> 


</div>



</div>
		
<div class="clear"></div>




<jsp:include page="../inc/bottom.jsp" />
</body>
</html>