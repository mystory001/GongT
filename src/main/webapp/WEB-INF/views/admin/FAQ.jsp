<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<meta charset="UTF-8">

<title>공티 FAQ</title>
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400"
	rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">



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
	height: 800px;
	width: 15%;
	/* 	border-style : groove; */
	float: left;
	/* 	border-radius: 20px; */
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

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
}

#side1_c {
	/*  	border:1px solid black;  */
	width: 450px;
	float: left;
	margin-left: 50px;
	padding-left: 30px;
	height: 700px;
}

#side2_c {
	/*  border:1px solid black;  */
	width: 450px;
	float: right;
	margin-right: 30px;
	padding-right: 30px;
	/*  	hight:541px; */
	height: 700px;
}

a {
	text-decoration-line: none;
}

.clear {
	clear: both;
}

fieldset {
	width: 1000px;
	height: 800px;
}

#table_search {
	text-align: center;
	padding-right: 60px;
}

button1 {
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

.sidemenu {
	width: 15%;
	position: relative;
	top: 5%;
	left: 8%;
}

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 30%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
	position: relative;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
	width: 60%;
}
</style>
</head>

<body>
	<jsp:include page="../inc/top.jsp" />
	<div id="border">
		<div id="up">
			<h1>자주 묻는 질문</h1>
		</div>

		<div id="left">
			<div class="sidemenu">
				<button type="button" class="button1 button-update">
					<span
						onclick="location.href='${pageContext.request.contextPath}/admin/notice'">공지사항</span>
				</button>
				<button type="button" class="button1 button-update"
					style="background-color: #1842B6;">
					<span
						onclick="location.href='${pageContext.request.contextPath}/admin/FAQ'"
						style="color: white !important;">자주 묻는 질문</span>
				</button>
				<button type="button" class="button1 button-update">
					<span
						onclick="location.href='${pageContext.request.contextPath}/admin/inquiry'">1:1문의</span>
				</button>
			</div>
		</div>

		<button class="accordion">공T 서비스 이용 방법</button>
		<div class="panel">
			<p>프리랜서 : 이력서 등록 > 기업의 확인(쪽지 면접) > 매칭완료(계약) 순서로 기업과 프리랜서가 직접소통하며
				진행하여 매칭완료 횟수가 증가합니다.</p>
			<p>기업 : 프로젝트 등록 > 프리랜서의 확인(쪽지 면접) > 매칭완료(계약) 순서로 기업과 프리랜서가 직접소통하며
				진행매칭완료 횟수가 증가합니다.</p>
		</div>


		<button class="accordion">공T 쪽지 안내</button>
		<div class="panel">
			<p>프로젝트 상세 페이지 및 이력서 상세페이지에서 보내실 수 있으시며, 쪽지함 또는 마이페이지에서 전체 쪽지를 확인
				하실 수 있습니다</p>

		</div>




		<button class="accordion">등록 방법</button>
		<div class="panel">
			<p>프리랜서와 기업 둘다 동일하게 마이페이지에서 이력서 및 공고를 등록하실 수 있습니다.</p>

		</div>

		<button class="accordion">회원 정보 수정 및 탈퇴</button>
		<div class="panel">
			<p>두가지 모두 마이페이지에서 비밀번호 확인 후 가능합니다.</p>
		</div>

		<button class="accordion">변경 불가 안내</button>
		<div class="panel">
			<p>아이디와 이름(회사명), 사업자번호 변경 불가합니다</p>
		</div>

		<button class="accordion">계약시 주의사항</button>
		<div class="panel">
			<p>서로의 계약시 개발 범위와 급여, 계약 종료 시점을 명확히 해두셔야 합니다. 그 부분이 명확하지 않으면 나중에
				곤란한 일이 발생할 수 있습니다. 계약중 궁금한 점이 있다면 문의 요청 부탁드리며, 공T매니저와 확인 하지 않은 사항에
				대해 불이익 발생할 경우 책임지지 않습니다.</p>
		</div>

		<!-- 				<div id="page_control"> -->
		<!-- 					<a href="#">이전</a> <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
		<!-- 					<a href="#">4</a><a href="#">5</a><a href="#">6</a> <a href="#">7</a><a -->
		<!-- 						href="#">8</a><a href="#">9</a> <a href="#">10</a> <a href="#">다음</a> -->

		<div class="clear"></div>
	</div>


	<jsp:include page="../inc/bottom.jsp" />
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>
</body>
</html>