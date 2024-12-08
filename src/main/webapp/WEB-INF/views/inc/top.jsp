<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header>

	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 알림  -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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


	<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.notification {
	background-color: #26d48c;
	color: white;
	text-decoration: none;
	padding: 15px 26px;
	position: relative;
	display: inline-block;
	border-radius: 2px;
}

.notification:hover {
	background: red;
}

.notification .badge {
	position: absolute;
	top: -10px;
	right: -10px;
	padding: 5px 10px;
	border-radius: 50%;
	background-color: red;
	color: white;
}
</style>


	<!-- Spinner Start -->
	<div id="spinner"
		class="show position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar Start -->
	<div class="container-fluid bg-primary">
		<div class="container">
			<nav class="navbar navbar-dark navbar-expand-lg py-0">
				<a href="${pageContext.request.contextPath}/main/main"
					class="navbar-brand">
					<h1 class="text-white fw-bold d-block">
						공<span class="text-secondary">T</span>
					</h1>
				</a>
				<button type="button" class="navbar-toggler me-0"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse bg-transparent"
					id="navbarCollapse">
					<div class="navbar-nav ms-auto mx-xl-auto p-0">
						<a href="${pageContext.request.contextPath}/board/searchCom"
							class="nav-item nav-link">프로젝트 찾기</a> <a
							href="${pageContext.request.contextPath}/board/searchFree"
							class="nav-item nav-link">프리랜서 찾기</a> <a
							href="${pageContext.request.contextPath}/admin/notice"
							class="nav-item nav-link">커뮤니티</a>
					</div>
					<c:if test="${empty sessionScope.id }">
						<div>
							<a href="${pageContext.request.contextPath}/main/login"
								class="nav-item nav-link"
								style="font-size: 15px; display: inline; color: white">로그인</a> <a
								href="${pageContext.request.contextPath}/main/join"
								class="nav-item nav-link"
								style="font-size: 15px; display: inline; color: white">회원가입</a>
						</div>
					</c:if>
					<c:if test="${!empty sessionScope.id }">
						<div>
							${sessionScope.id}님 <br> 공T 매칭 : ${sessionScope.matching} 회
							<a href="${pageContext.request.contextPath}/main/logout"
								class="nav-item nav-link"
								style="font-size: 15px; display: inline; color: white">로그아웃</a>

							<c:if test="${sessionScope.type eq 0 }">
								<a
									href="${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer1"
									class="nav-item nav-link"
									style="font-size: 15px; display: inline; color: white">마이페이지</a>
								<c:if test="${sessionScope.id eq 'admin' }">
									<a
										href="${pageContext.request.contextPath}/adminPage/adminMain"
										class="nav-item nav-link"
										style="font-size: 15px; display: inline; color: white">관리자페이지</a>
								</c:if>
								<a
									href="${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer5"
									class="notification"> <span>쪽지함</span> <!--   <span class="badge">3</span> -->
								</a>
							</c:if>

							<c:if test="${sessionScope.type eq 1 }">
								<a
									href="${pageContext.request.contextPath}/mypageCompany/mypageCompany1"
									class="nav-item nav-link"
									style="font-size: 15px; display: inline; color: white">마이페이지</a>
								<a
									href="${pageContext.request.contextPath}/mypageCompany/mypageCompany5"
									class="notification"> <span>쪽지함</span> <!--   <span class="badge">3</span> -->
								</a>
							</c:if>


							<c:if test="${sessionScope.id eq admin }">
								<a href="${pageContext.request.contextPath}/adminPage/adminMain"
									class="nav-item nav-link"
									style="font-size: 15px; display: inline; color: white">관리자페이지</a>
							</c:if>



						</div>
					</c:if>
				</div>

				<div class="d-none d-xl-flex flex-shirink-0"></div>
			</nav>
		</div>
	</div>
	<!-- Navbar End -->

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script type="text/javascript">
// function login() {
// 	let loginpop = window.open(${pageContext.request.contextPath}/main/login.jsp,"loginpop","width=400, height=450");
// }
</script>

</header>
