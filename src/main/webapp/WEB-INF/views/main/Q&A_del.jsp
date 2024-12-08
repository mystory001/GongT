<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#side1 {
	float: left;
	margin-left: 50px;
	line-height: 100px;
}

#side2 {
	float: right;
	margin-right: 50px;
	line-height: 100px;
}

#side1_c {
	float: left;
	margin-left: 50px;
}

#side2_c {
	float: right;
	margin-right: 50px;
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
				<li>공지사항</li>

				<li style="font-weight: bold;">자주 묻는 질문</li>
				<li>1:1문의</li>

			</ul>
		</div>

		<div id="right">
			<form action="" id="join">
				<fieldset>
					<h2>자주 묻는 질문</h2>

					<div id="side1_c">
						<ul>
							<h3>기업 회원 자주 묻는 질문</h3>
							<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
							<br>
							<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
							<br>
							<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
							<br>
							<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
							<br>
							<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
							<br>

						</ul>
					</div>


					<div id="side2_c">
						<ul>
							<h3>프리랜서 회원 자주 묻는 질문</h3>
							<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
							<br>
							<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
							<br>
							<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
							<br>
							<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
							<br>
							<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
							<br>
						</ul>
					</div>



					<!-- 				<div id="page_control"> -->
					<!-- 					<a href="#">이전</a> <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
					<!-- 					<a href="#">4</a><a href="#">5</a><a href="#">6</a> <a href="#">7</a><a -->
					<!-- 						href="#">8</a><a href="#">9</a> <a href="#">10</a> <a href="#">다음</a> -->
				</fieldset>
			</form>
			<div id="table_search">
				<input type="text" name="search" class="input_box"> <input
					type="button" value="검색" class="btn">
			</div>
			<div class="clear"></div>
		</div>

	</div>
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>