<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">

<title>문의</title>
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
    
       <button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" >공지사항</span></button>
      	<button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'" >자주 묻는 질문</span></button>
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'" style="color: white !important;">1:1문의</span></button>
    </div>

</div>
    <div class="modal modal-spinner" role="dialog" aria-hidden="true" style="display:none;"></div>
    <div class="resume-view-page">
        <div class="resumeHeader">
            
        </div>
        <div class="resume-view-wrapper" >
        <br><br>
            <div class="resume-view-container" style="height: 700px !important">
                <div class="resume-subject" style="text-align: center !important;">문의 내역</div>



<div class="summary col-4"></div>
<div class="list list-education"></div>
<br>

<fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" >



<table class="table">
  <tr style="background-color: transparent !important;">
    <th style=" font-size:20px !important; color: black;">번호</th>
    <th style=" font-size:20px !important; color: black;">제목</th>
    <th style=" font-size:20px !important; color: black;">작성자</th>
        <th style=" font-size:20px !important; color: black;">작성일</th>
  </tr>
 <c:forEach var="irDTO" items="${inquiryList }">
<tr onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry_content?i_num=${irDTO.i_num}'">
	<td style="text-align: center !important; font-size:15px !important; color: black;">${irDTO.i_num}</td>
	<td style="text-align: center !important; font-size:15px !important; color: black;" >${irDTO.i_title}</td>
	<td style="text-align: center !important; font-size:15px !important; color: black;">${irDTO.id}</td>
    <td style="text-align: center !important; font-size:15px !important; color: black;"><fmt:formatDate value="${irDTO.i_date}" pattern="yyyy.MM.dd"/></td>
  </tr>
    </c:forEach>

</table>
<div id="table_search">
					<c:if test="${sessionScope.id != 'admin'}">
						<input type="button" value="문의글 쓰기" class="btn btn-primary"
  	onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry_write'">
			</c:if>

	</div> 
</fieldset>
 			</div>
        </div>
    </div>
 
 <br><br><br><br><br>

<jsp:include page="../inc/bottom.jsp" />
</body>
</html>