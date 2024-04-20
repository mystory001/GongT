<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<title>공T 마이페이지</title>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
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
<body>

<div id="border">
	</div>
	<div class="sidemenu-wrap" style="margin-left:-1660px; margin-top: 195px;">
    <div class="sidemenu">
    
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer1'"><span>회원정보 수정</span></button>
        <button type="button" class="button button-update"  style="background-color: #1842B6;"><span style="color: white;">나의 이력서</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/resume/resumeWrite'"><span>이력서 등록</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer4'"><span>관심 프로젝트(찜)</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer5'"><span>쪽지 내역</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer6'"><span>회원탈퇴</span></button>
   
    </div>
</div>
    <div class="modal modal-spinner" role="dialog" aria-hidden="true" style="display:none;"></div>
    <div class="resume-view-page">
        <div class="resumeHeader">
            
        </div>
        <div class="resume-view-wrapper" >
        <br><br>
            <div class="resume-view-container" style="height: 700px !important">
                <div class="resume-subject" style="text-align: center !important;">마이 페이지(프리랜서)</div>


<div class="summary col-4"></div>
<div class="list list-education"></div>
<br>
<fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" >


<table class="table">
  <tr style="background-color: transparent !important;">

    <th style=" font-size:25px !important; color: black;">이력서 제목</th>
    <th style=" font-size:25px !important; color: black;">희망 급여</th>

  </tr>
  	<c:forEach var="ResumeDTO" items="${ResumeDTOList}">

  <tr onclick="location.href='${pageContext.request.contextPath}/resume/resume?r_num=${ResumeDTO.r_num }'">
    <td style="text-align: center !important; font-size:20px !important;">${ResumeDTO.r_name}</td>
    <td style="text-align: center !important; font-size:20px !important;">${ResumeDTO.r_salary}</td>

  </tr>
  </c:forEach>

</table>

<!-- <label>이력서 제목 &nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp; </label> -->
<!-- <label>공개여부</label><br><br><br> -->
<!-- </div> -->
<%-- 	<c:forEach var="ResumeDTO" items="${ResumeDTOList}"> --%>
<!-- <div> -->
<%-- <label>${ResumeDTO.r_name} &nbsp; / &nbsp;</label> --%>
<%-- <c:if test="${ResumeDTO.r_io eq 0}"> --%>
<!-- <label>비공개 &nbsp;</label> -->
<%-- </c:if> --%>
<%-- <c:if test="${ResumeDTO.r_io eq 1}"> --%>
<!-- <label>공개 &nbsp;</label> -->
<%-- </c:if> --%>
<%-- <c:if test="${ResumeDTO.r_head eq 0}"> --%>
<!-- <br><br> -->
<%-- </c:if> --%>
<%-- <c:if test="${ResumeDTO.r_head eq 1}"> --%>
<!-- <label style="color: blue; ">대표이력서</label><br><br> -->
<%-- </c:if> --%>
<!-- </div> -->
<%-- 	</c:forEach> --%>
</fieldset>
        


 			</div>
        </div>
    </div>
 
 <br><br><br><br><br>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>