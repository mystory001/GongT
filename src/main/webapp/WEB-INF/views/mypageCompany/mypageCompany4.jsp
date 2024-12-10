<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<title>공티 마이페이지</title>
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
button {
	padding: 0;
	margin: 0;
	font-size: 12.5px;
	letter-spacing: 0px;
	border: 0 none;
	vertical-align: middle;
	overflow: visible;
	background: transparent;
	cursor: pointer;
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

tr:hover {
	background-color: #748dd3;
}
</style>
</head>
<body>


	<div id="border"></div>
	<div class="sidemenu-wrap"
		style="margin-left: -1660px; margin-top: 195px;">
		<div class="sidemenu">

			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany1'">
				<span>회원정보 수정</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany2'">
				<span>나의 프로젝트</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/project/projectWrite'">
				<span>프로젝트 등록</span>
			</button>
			<button type="button" class="button button-update"
				style="background-color: #1842B6;">
				<span style="color: white;">관심 프리랜서(찜)</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany5'">
				<span>채팅 내역</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany6'">
				<span>회원탈퇴</span>
			</button>

		</div>
	</div>
	<div class="modal modal-spinner" role="dialog" aria-hidden="true"
		style="display: none;"></div>
	<div class="resume-view-page">
		<div class="resumeHeader"></div>
		<div class="resume-view-wrapper">
			<br>
			<br>
			<div class="resume-view-container" style="height: 700px !important">
				<div class="resume-subject" style="text-align: center !important;">마이
					페이지(기업)</div>


				<div class="summary col-4"></div>
				<div class="list list-education"></div>

				<fieldset
					style="text-align: center; font-size: 20px; width: 100%; height: 80%;">
					<%-- 	<c:forEach var="Scrap_resumeDTO" items="${Scrap_resumeDTOList}"> --%>
					<!-- <div> -->
					<!-- <label style="color: blue; font-weight: bold;">프리랜서 이름 :  &nbsp;&nbsp;</label> -->
					<%-- <label>${Scrap_resumeDTO.name} &nbsp;&nbsp; / &nbsp;&nbsp; </label> --%>
					<!-- <label style="color: blue; font-weight: bold;">이력서 제목 : &nbsp;&nbsp; </label> -->
					<%-- <label>${Scrap_resumeDTO.r_name}</label><br><br> --%>
					<!-- </div> -->
					<%-- </c:forEach> --%>
					<table class="table">
						<tr style="background-color: transparent !important;">
							<th style="font-size: 20px !important; color: black;">프리랜서
								이름</th>
							<th style="font-size: 20px !important; color: black;">이력서 제목</th>

						</tr>
						<c:forEach var="Scrap_resumeDTO" items="${Scrap_resumeDTOList}">

							<tr
								onclick="location.href='${pageContext.request.contextPath}/resume/resume?r_num=${Scrap_resumeDTO.r_num }'">
								<td
									style="text-align: center !important; font-size: 20px !important;">${Scrap_resumeDTO.name}</td>
								<td
									style="text-align: center !important; font-size: 20px !important;">${Scrap_resumeDTO.r_name}</td>



							</tr>
						</c:forEach>

					</table>

				</fieldset>




			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>