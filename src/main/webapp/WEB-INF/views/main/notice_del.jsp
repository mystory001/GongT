<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사용하지 않는 페이지</title>
<style>
#border {
	height: 1000px;
}

#up {
	margin-top: 75px;
	text-align: center;
	width: 100%;
	/* 	background-color: lightgray; */
	height: 100px;
	line-height: 100px;
}

#left {
	height: 300px;
	width: 15%;
	border-style: groove;
	float: left;
	border-radius: 20px;
	text-align: center;
	margin-left: 10%;
}

#right {
	height: 50%;
	width: 60%;
	float: left;
	text-align: center;
	margin-right: 10%;
}

table {
	width: 100%;
	/* 	height: 200px; */
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid black;
	text-align: center;
	padding: 4px;
	height: 1px;
}
</style>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	<div id="border">
		<div id="up">
			<h1>커뮤니티</h1>
		</div>

		<div id="left">
			<ul>
				<li style="font-weight: bold;">공지사항</li>

				<li>자주 묻는 질문</li>
				<li>1:1문의</li>

			</ul>
		</div>

		<div id="right">
			<form action="" id="join">
				<fieldset>
					<h2>공지사항</h2>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<tr>
							<td>7</td>
							<td class="left">공지합니다.</td>
							<td>관리자 김동희</td>
							<td>2024.02.01</td>
							<td>15</td>
						</tr>
						<tr>
							<td>6</td>
							<td class="left">공민지합니다.</td>
							<td>관리자 박재환</td>
							<td>2024.02.01</td>
							<td>5</td>
						</tr>
						<tr>
							<td>5</td>
							<td class="left">공지합니다. 제 여친 노래 잘합니다.</td>
							<td>관리자 박제현</td>
							<td>2024.02.01</td>
							<td>15</td>
						</tr>
						<tr>
							<td>4</td>
							<td class="left">공지합니다. 오늘 저녁 제가 쏩니다.</td>
							<td>관리자 이상엽</td>
							<td>2024.02.01</td>
							<td>15</td>
						</tr>
						<tr>
							<td>3</td>
							<td class="left">공지합니다. 앗싸리 다 없앱시다.</td>
							<td>관리자 박순영</td>
							<td>2024.02.01</td>
							<td>15</td>
						</tr>
						<tr>
							<td>2</td>
							<td class="left">공지합니다. 저는 부산에서 제일 잘생겼습니다. 반박할 사람 나와보십쇼.</td>
							<td>관리자 김동희</td>
							<td>&nbsp;2024.02.01&nbsp;</td>
							<td>&nbsp;65536&nbsp;</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="left">사이트 운영방침</td>
							<td>&nbsp;&nbsp;관리자 홍진숙&nbsp;&nbsp;</td>
							<td>2024.02.01</td>
							<td>15</td>
						</tr>
					</table>
					<div id="table_search">
						<input type="text" name="search" class="input_box"> <input
							type="button" value="검색" class="btn">
					</div>
					<div class="clear"></div>
					<!-- 				<div id="page_control"> -->
					<!-- 					<a href="#">이전</a> <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
					<!-- 					<a href="#">4</a><a href="#">5</a><a href="#">6</a> <a href="#">7</a><a -->
					<!-- 						href="#">8</a><a href="#">9</a> <a href="#">10</a> <a href="#">다음</a> -->
				</fieldset>
			</form>
		</div>
	</div>

	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>