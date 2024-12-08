<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<title>공티 마이페이지</title>
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400"
	rel="stylesheet" type="text/css" />

</head>
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
</style>
<body>


	<div id="border"></div>
	<div class="sidemenu-wrap"
		style="margin-left: -1660px; margin-top: 195px;">
		<div class="sidemenu">

			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer1'">
				<span>회원정보 수정</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer2'">
				<span>나의 이력서</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/resume/resumeWrite'">
				<span>이력서 등록</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer4'">
				<span>관심 프로젝트(찜)</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer5'">
				<span>쪽지 내역</span>
			</button>
			<button type="button" class="button button-update"
				style="background-color: #1842B6;">
				<span style="color: white;">회원탈퇴</span>
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
					페이지(프리랜서)</div>


				<div class="summary col-4"></div>
				<div class="list list-education"></div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<form action="${pageContext.request.contextPath}/deletePro"
					method="post">
					<fieldset
						style="text-align: center; font-size: 20px; width: 100%; height: 80%;">
						<label>비밀번호</label><br> <input type="password" name="pw"
							style="font-size: 20px;"><br>
						<br> <input type="submit" value="탈퇴하기"
							style="background-color: #1842B6; width: 100px; color: white; font-size: 20px;">
					</fieldset>
				</form>



			</div>
		</div>
	</div>

	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>