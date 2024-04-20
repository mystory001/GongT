<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공T 프리랜서 찾기</title>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<style>
button{
padding:0; margin:0; font-size:12.5px; letter-spacing: 0px; border:0 none;
vertical-align:middle; overflow:visible; background:transparent; cursor:pointer;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color: #748dd3;}

#left2 {
	height: 150px;
	width: 160px;
/* 	border-style : groove; */
/* 	float: inherit; */
/* 	border-radius: 20px; */
	text-align: left;
/* 	margin-left: 5%; */
	
}

#left3 {
	height: 500px;
	width: 160px;
/* 	border-style : groove; */
/* 	float: inherit; */
/* 	border-radius: 20px; */
	text-align: left;
/* 	margin-left: 5%; */
}
</style>
</head>
<body>


<div id="border">
<div class="sidemenu-wrap" style="margin-left:-1660px; margin-top: 90px;">
    <div class="sidemenu">

<div id="left2">

<h4 style="font-weight: bold !important;">직종</h5><br>
개발자, 퍼블리셔, 디자이너, 기타

</div><br>

<div id="left3">

<h4 style="font-weight: bold !important;">지역</h5><br>
 전체, 서울, 부산, 인천, 대전, 대구, 울산, 광주, 세종, 경기도, 강원도, 충청북도, 충청남도, 경상북도, 경상남도, 전라북도, 전라남도, 제주


</div>
   </div>
</div>
    <div class="modal modal-spinner" role="dialog" aria-hidden="true" style="display:none;"></div>
    <div class="resume-view-page">
        <div class="resumeHeader">
            
        </div>
        <div class="resume-view-wrapper" >
        <br><br>
            <div class="resume-view-container" style="height: 700px !important">
                <div class="resume-subject" style="text-align: center !important;">프리랜서 찾기</div>


<div class="summary col-4"></div>
<div class="list list-education"></div>
<br>

<fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" >
<div class="btn-group" role="group" aria-label="Basic example">
<form action="${pageContext.request.contextPath}/board/searchFree" method="get">

<input type="hidden" name="search" value="${pageDTO.search}">
<input type="hidden" name="select" value="${pageDTO.select}">
  <label><button name="sort" value="sortM" type="submit" class="btn btn-primary" id="sortMatching" style="background-color: #1842B6 !important;">매칭순</button>
  <button name="sort" value="sortS" type="submit" class="btn btn-primary" id="sortSalary" style="background-color: #1842B6 !important;">급여순</button></label>
</form>
</div>

	<table class="table">
  <thead>
    <tr style="background-color: transparent !important;">
<th scope="col" style=" font-size:20px !important; color: black;">글번호</th>
<th scope="col" style=" font-size:20px !important; color: black;">제목</th>
<th scope="col" style=" font-size:20px !important; color: black;">이름</th>
<th scope="col" style=" font-size:20px !important; color: black;">매칭횟수</th>
<th scope="col" style=" font-size:20px !important; color: black;">희망급여</th>
</tr>
</thead>

<c:forEach var="resumeDTO" items="${resumeBoardList }">
    	<tr onclick="location.href='${pageContext.request.contextPath}/resume/resume?r_num=${resumeDTO.r_num }'">
    		<td style="text-align: center !important; font-size:15px !important;" >${resumeDTO.r_num}</td>
    	    <td style="text-align: center !important; font-size:15px !important;">${resumeDTO.r_name}</td>
    		<td style="text-align: center !important; font-size:15px !important;">${resumeDTO.name}</td>
    		<td style="text-align: center !important ; font-size:15px !important;">${resumeDTO.matching }</td>
    		<td style="text-align: center !important; font-size:15px !important;">${resumeDTO.r_salary}</td>
    	</tr>
    </c:forEach>

</table>
<form action="${pageContext.request.contextPath}/board/searchFree" method="get">
	<select name="select">
	<option value="r_name" selected style="font-size: 15px !important;">제목</option>
	<option value="r_content" style="font-size: 15px !important;">내용</option>
	<option value="name123" style="font-size: 15px !important;">이름</option>
	<option value="field" style="font-size: 15px !important;">직종</option>
	<option value="region" style="font-size: 15px !important;">지역</option>
	</select>
	<input type="text" class="search" name="search">
	<input type="submit" value="검색" class="btn btn-primary" style="background-color: #1842B6 !important;">
	</form>
	
<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">

	<a href="${pageContext.request.contextPath}/board/searchFree?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">[이전]</a>

</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">

<a href="${pageContext.request.contextPath}/board/searchFree?pageNum=${i}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">${i}</a>

</c:forEach>

<c:if test="${pageDTO.pageCount > pageDTO.endPage}">

	<a href="${pageContext.request.contextPath}/board/searchFree??pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">[다음]</a>

</c:if>
</div>
	</div>
</div>


 			</div>
        </div>

 
 <br><br><br><br><br>
<jsp:include page="../inc/bottom.jsp" />
<script type="text/javascript">
$(function(){
	
});
</script>
</body>
</html>