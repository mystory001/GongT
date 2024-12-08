<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<title>공티 SI 프리랜서 매칭</title>
<style>
#img {
	background-image:
		url("${pageContext.request.contextPath}/resources/computer1.png");
	background-position: 50% 40%;
	height: 400px;
}

#gong {
	font-size: 80px;
	text-align: center;
	margin-top: 100px;
	text-shadow: -7px 0 #000;
}

.slider {
	border-radius: 50px;
	width: 1280px;
	height: 500px;
	position: relative;
	margin: 0 auto;
	overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}

.slider input[type=radio] {
	display: none;
}

ul.imgs {
	padding: 0;
	margin: 0;
	list-style: none;
}

ul.imgs li {
	position: absolute;
	left: 640px;
	transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
	padding: 0;
	margin: 0;
}

.bullets {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 20px;
	z-index: 2;
}

.bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.55);
	width: 20px;
	height: 20px;
	cursor: pointer;
}
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked ~.bullets>label:nth-child(1)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(2):checked ~.bullets>label:nth-child(2)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(3):checked ~.bullets>label:nth-child(3)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(4):checked ~.bullets>label:nth-child(4)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked ~ul.imgs>li:nth-child(1)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(2):checked ~ul.imgs>li:nth-child(2)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(3):checked ~ul.imgs>li:nth-child(3)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(4):checked ~ul.imgs>li:nth-child(4)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}
</style>
<jsp:include page="event.jsp" />
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
</head>

<body>
	<div id="img">
		<div class="container text-center py-5">
			<h1 id="gong" class="display-2 text-white mb-4 animated slideInDown">
				공공기관 &nbsp;&nbsp;<span class="text-secondary">IT</span>
			</h1>
		</div>
	</div>

	<div class="container-fluid bg-secondary py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 wow fadeIn" data-wow-delay=".1s">
					<div class="d-flex counter">
						<h1 class="me-3 text-primary counter-value">${projectcount }</h1>
						<h5 class="text-white  mt-1">프로젝트 등록 수</h5>
					</div>
				</div>
				<div class="col-lg-3 wow fadeIn" data-wow-delay=".3s">
					<div class="d-flex counter">
						<h1 class="me-3 text-primary counter-value">${resumecount }</h1>
						<h5 class="text-white mt-1">프리랜서 등록 수</h5>
					</div>
				</div>
				<div class="col-lg-3 wow fadeIn" data-wow-delay=".5s">
					<div class="d-flex counter">
						<h1 class="me-3 text-primary counter-value">${companycount }</h1>
						<h5 class="text-white mt-1">기업 등록수</h5>
					</div>
				</div>
				<div class="col-lg-3 wow fadeIn" data-wow-delay=".5s">
					<div class="d-flex counter">
						<h1 class="me-3 text-primary counter-value">${matchingcount }</h1>
						<h5 class="text-white mt-1">총 매칭 횟수</h5>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 매칭 프로세스 -->
	<div class="container-fluid py-5 my-5 wow fadeIn" data-wow-delay="0.3s"
		style="margin-right: 1px;">
		<div class="container text-center py-5">

			<div class="col-lg-6">

				<h2 class="display-1" style="width: 200%; font-size: 50px">
					<span style="color: #193B79">공T</span>의 매칭 프로세스는 이렇게 운영됩니다
				</h2>
				<h3 style="width: 200%; color: #595959;">매니저들의 세심한 파트너 매칭과 안심
					케어서비스로 당신의 프로젝트와 함께합니다.</h3>
				<div class="slider">
					<input type="radio" name="slide" id="slide1" checked> <input
						type="radio" name="slide" id="slide2"> <input type="radio"
						name="slide" id="slide3"> <input type="radio" name="slide"
						id="slide4">
					<ul id="imgholder" class="imgs">
						<li><img
							src="${pageContext.request.contextPath}/resources/img/slide1.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/slide2.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/slide3.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath}/resources/img/slide4.jpg"></li>
					</ul>
					<div class="bullets">
						<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
						<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- 매칭 프로세스 -->

	<jsp:include page="../inc/bottom.jsp" />


</body>

</html>