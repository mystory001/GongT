<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				style="background-color: #1842B6;">
				<span style="color: white;">나의 프로젝트</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/project/projectWrite'">
				<span>프로젝트 등록</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany4'">
				<span>관심 프리랜서(찜)</span>
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
				<br>
				<!-- <fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" > -->
				<!-- <div style="color: blue; font-weight: bold;"> -->
				<!-- <label>프로젝트 제목 &nbsp;&nbsp;&nbsp;&nbsp;  / &nbsp;&nbsp;&nbsp;&nbsp;  </label> -->
				<!-- <label> 작성일 &nbsp;&nbsp; &nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;  </label> -->
				<!-- <label>필요인원</label><br><br> -->
				<!-- </div> -->

				<%-- 	<c:forEach var="ProjectDTO" items="${ProjectDTOList}"> --%>
				<!-- <div> -->
				<%-- <label>${ProjectDTO.p_title} &nbsp; / &nbsp; </label> --%>
				<%-- <label>${ProjectDTO.p_writedate} &nbsp;/ &nbsp; </label> --%>
				<%-- <label>${ProjectDTO.p_member}</label><br><br> --%>
				<!-- </div> -->
				<%-- 	</c:forEach> --%>
				<!-- </fieldset> -->

				<!--  <table class="table"> -->
				<!--   <thead> -->
				<!--     <tr> -->
				<!--       <th scope="col">프로젝트 제목</th> -->
				<!--       <th scope="col">작성일</th> -->
				<!--       <th scope="col">필요인원</th> -->
				<!--       <th scope="col">Handle</th> -->
				<!--     </tr> -->
				<!--   </thead> -->
				<!--   <tbody> -->
				<!--     <tr> -->
				<!--       <th scope="row">1</th> -->
				<!--       <td>Mark</td> -->
				<!--       <td>Otto</td> -->
				<!--       <td>@mdo</td> -->
				<!--     </tr> -->
				<!--     <tr> -->
				<!--       <th scope="row">2</th> -->
				<!--       <td>Jacob</td> -->
				<!--       <td>Thornton</td> -->
				<!--       <td>@fat</td> -->
				<!--     </tr> -->
				<!--     <tr> -->
				<!--       <th scope="row">3</th> -->
				<!--       <td colspan="2">Larry the Bird</td> -->
				<!--       <td>@twitter</td> -->
				<!--     </tr> -->
				<!--   </tbody> -->
				<!-- </table> -->

				<fieldset
					style="text-align: center; font-size: 20px; width: 100%; height: 80%;">

					<table class="table">
						<tr style="background-color: transparent !important;">
							<th style="font-size: 20px !important; color: black;">프로젝트
								제목</th>
							<th style="font-size: 20px !important; color: black;">작성일</th>
							<th style="font-size: 20px !important; color: black;">필요인원</th>
						</tr>
						<c:forEach var="ProjectDTO" items="${ProjectDTOList}">

							<tr
								onclick="location.href='${pageContext.request.contextPath}/project/project?p_num=${ProjectDTO.p_num }'">
								<td
									style="text-align: center !important; font-size: 20px !important;">${ProjectDTO.p_title}</td>
								<td
									style="text-align: center !important; font-size: 20px !important;">${ProjectDTO.p_writedate}</td>
								<td
									style="text-align: center !important; font-size: 20px !important;">${ProjectDTO.p_member}</td>


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