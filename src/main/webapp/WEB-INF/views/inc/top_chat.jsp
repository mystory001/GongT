<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">

	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

	<!-- Spinner Start -->
	<div id="spinner"
		class="show position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar Start -->
	<div class="container-fluid bg-primary">
		<nav class="navbar navbar-dark navbar-expand-lg py-0">
			<a href="${pageContext.request.contextPath}/main/main"
				class="navbar-brand">
				<h1 class="text-white fw-bold d-block">
					공<span class="text-secondary">T</span>
				</h1>
			</a>

			<div
				style="color: white; font-size: 130%; margin: 0 auto; text-align: center; vertical-align: middle;">쪽지</div>

			<button type="button" class="nav-item nav-link"
				style="font-size: 15px; border: none; color: white; background-color: #1842B6;"
				onclick="cls()">닫기</button>
	</div>
	</div>

	<div class="d-none d-xl-flex flex-shirink-0"></div>
	</nav>
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
	<script>
		function cls() {
			window.close();
		}
	</script>
	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script type="text/javascript">
		// function login() {
		// 	let loginpop = window.open(${pageContext.request.contextPath}/main/login.jsp,"loginpop","width=400, height=450");
		// }
	</script>

</header>
