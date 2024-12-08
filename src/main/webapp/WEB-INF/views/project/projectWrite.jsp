<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공티 프로젝트 작성</title>
<style>
button {
	padding: 0;
	margin: 0;
	border: 0 none;
	vertical-align: middle;
	overflow: visible;
	background: transparent;
	cursor: pointer;
}

input {
	height: 45px;
	width: 400px;
}

.wrappe {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100dvh;
}

.conten {
	padding: 1rem;
	/*   font-size: 2rem; */
	border-radius: 1rem;
}

#button {
	background-color: #1842B6;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100px;
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />


	<br>
	<br>
	<br>
	<div class="wrappe">
		<div class="conten">
			<h1>프로젝트 공고 작성</h1>
			<p>프로젝트 공고를 등록하고 프리랜서들의 신청을 받아보세요!</p>

			<form
				action="${pageContext.request.contextPath}/project/projectWritePro"
				id="join" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${sessionScope.id }">
				<input type="hidden" name="name" value="${sessionScope.name }">
				<fieldset>
					<legend>
						<h5>정해진 양식에 맞게 작성해주십시오.</h5>
					</legend>
					<h3>프로젝트 공고 제목</h3>

					<input type="text" width="300" name="p_title" class="id"
						maxlength="50" required autofocus><br>
					<br>



					<h3>필요 인원</h3>
					<input type="number" name="p_member" placeholder="1" min="1"
						style="font-size: 120%; width: 60px; height: 30px;" required>명<br>
					<br>
					<h3>직종</h3>
					<select name="field_num" style="width: 100px; height: 30px;">
						<option value="1">개발자</option>
						<option value="2">퍼블리셔</option>
						<option value="3">디자이너</option>
						<option value="4">기타</option>
					</select><br>
					<br>
					<h3>지역</h3>
					<select name="region_num" style="width: 100px; height: 30px;">
						<option value="1">전체</option>
						<option value="2">서울특별시</option>
						<option value="3">부산광역시</option>
						<option value="4">인천광역시</option>
						<option value="5">대전광역시</option>
						<option value="6">대구광역시</option>
						<option value="7">울산광역시</option>
						<option value="8">광주광역시</option>
						<option value="9">세종특별자치시</option>
						<option value="10">경기도</option>
						<option value="11">강원도</option>
						<option value="12">충청북도</option>
						<option value="13">충청남도</option>
						<option value="14">경상북도</option>
						<option value="15">경상남도</option>
						<option value="16">전라북도</option>
						<option value="17">전라남도</option>
						<option value="18">제주특별자치도</option>
					</select><br>
					<br>
					<h3>모집 마감 기한</h3>
					<input type="datetime-local" name="p_deadline"><br> <sub>※모집
						마감할 시간을 선택해 주세요.</sub><br>
					<br>

					<h3>프로젝트 시작 예정일</h3>
					<input type="date" name="p_start"><br> <sub>※프로젝트
						시작 예정일을 선택해 주세요.</sub><br>
					<br>

					<h3>프로젝트 종료 예정일</h3>
					<input type="date" name="p_end"><br> <sub>※프로젝트
						종료 예정일을 선택해 주세요.</sub><br>
					<br>

					<h3>첨부 파일</h3>
					<input type="file" name="file"><br> <sub>※첨부할
						파일이 있다면 등록해주세요. (판촉물, 광고지 등)</sub><br>
					<br>

					<h3>프로젝트 공고 내용</h3>
					<textarea name="p_content" placeholder="내용" maxlength="1000"
						cols="50" rows="20"></textarea>
					<br>
					<br>

					<center>
						<button type="submit" value="" id="button" class="submit"
							style="background-color: #1842B6;">등록하기</button>
						<button type="reset" value="" id="button" class="cancel"
							style="background-color: #1842B6;" onclick="history.back()">돌아가기</button>
					</center>
				</fieldset>
			</form>


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