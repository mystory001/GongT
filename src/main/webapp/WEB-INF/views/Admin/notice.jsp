<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">

<title>공지사항</title>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


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

</style>
</head>
<body>


<div id="border">
	</div>
	<div class="sidemenu-wrap" style="margin-left:-1660px; margin-top: 195px;">
    <div class="sidemenu">
    
       <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" style="color: white !important;">공지사항</span></button>
      	<button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'">자주 묻는 질문</span></button>
        <button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'">1:1문의</span></button>
   
    </div>
</div>
    <div class="modal modal-spinner" role="dialog" aria-hidden="true" style="display:none;"></div>
    <div class="resume-view-page">
        <div class="resumeHeader">
            
        </div>
        <div class="resume-view-wrapper" >
        <br><br>
            <div class="resume-view-container" style="height: 700px !important">
                <div class="resume-subject" style="text-align: center !important;">공지사항</div>


<div class="summary col-4"></div>
<div class="list list-education"></div>





<fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" >

	<table class="table">
  <tr style="background-color: transparent !important;">
    <th style=" font-size:20px !important; color: black;">번호</th>
    <th style=" font-size:20px !important; color: black;">제목</th>
    <th style=" font-size:20px !important; color: black;">작성자</th>
    <th style=" font-size:20px !important; color: black;">작성일</th>
    <th style=" font-size:20px !important; color: black;">조회수</th>
  </tr>
  <c:forEach var="nDTO" items="${noticeList }">
  <tr onclick="location.href='${pageContext.request.contextPath}/Admin/content?n_num=${nDTO.n_num}'">
    	<td style="text-align: center !important; font-size:15px !important; color: black;">${nDTO.n_num}</td>
    	<td class="left" style="text-align: center !important; font-size:15px !important; color: black;">${nDTO.n_title}</td>
    	<td style="text-align: center !important; font-size:15px !important; color: black;">${nDTO.admin_id}</td>
    	<td style="text-align: center !important; font-size:15px !important; color: black;"><fmt:formatDate value="${nDTO.n_date}" pattern="yyyy.MM.dd"/></td>
    	<td style="text-align: center !important; font-size:15px !important; color: black;">${nDTO.n_readcount}</td></tr>

    </c:forEach>
    
 </table>
				<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/Admin/notice?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${noticeDTO.search}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
	<a href="${pageContext.request.contextPath}/Admin/notice?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/Admin/notice?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${noticeDTO.search}">Next</a>
</c:if>


</div>

	<div id="table_search">			
<form action="${pageContext.request.contextPath}/Admin/notice" method="get">
<select name="select">
	<option value="p_title" selected>제목</option>
	<option value="p_content">내용</option>
</select>
	<input type="text" name="search" class="input_box">
	<input type="submit" value="검색" class="btn btn-primary">
	<input type="button" value="글목록" class="btn btn-primary"
 	 onclick="location.href='${pageContext.request.contextPath}/Admin/notice'">
	
							
<c:if test="${sessionScope.id == 'admin'}">
		<input type="button" value="글쓰기" class="btn btn-primary" 
  	onclick="location.href='${pageContext.request.contextPath}/Admin/write?n_num=${nDTO.n_num}'">

<!-- 		<input type="button" value="글수정" class="btn"  -->
<%--   			onclick="location.href='${pageContext.request.contextPath}/Admin/update?n_num=${nDTO.n_num}'"> --%>
<!-- 		<input type="button" value="글삭제" class="btn"  -->
<%--   			onclick="location.href='${pageContext.request.contextPath}/Admin/delete?n_num=${nDTO.n_num}'"> --%>
</c:if>
</form>
<%-- <form action="${pageContext.request.contextPath}/board/list" method="get"> --%>
<!-- <input type="text" name="search" class="input_box"> -->
<!-- <input type="submit" value="검색" class="btn"> -->
<!-- </form> -->

<!-- <input type="button" value="글목록" class="btn"  -->
<%--   onclick="location.href='${pageContext.request.contextPath}/Admin/notice'"> --%>
	</div>				
				




</fieldset>
 			</div>
        </div>
    </div>
 
 <br><br><br><br><br>

<jsp:include page="../inc/bottom.jsp" />
</body>
</html>