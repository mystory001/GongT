<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>공티 관리자 페이지</title>
</head>
<style type="text/css">
.navbar.bg-light {
	background-color: #000 !important;
	transition: ease 0.5s;
}

.user-profile {
	width: 50px;
	height: 50px;
	background-color: #f1f1f1;
}

.navbar .menu-bar {
	display: inline-block;
	width: 50px;
	height: 50px;
	position: relative;
	cursor: pointer;
}

.navbar .menu-bar .bars {
	position: relative;
	top: 50%;
	width: 30px;
	height: 2px;
	background-color: #fff;
}

.navbar .menu-bar .bars::after {
	content: "";
	position: absolute;
	bottom: -8px;
	width: 100%;
	height: 2px;
	background-color: #fff;
}

.navbar .menu-bar .bars::before {
	content: "";
	position: absolute;
	top: -8px;
	width: 100%;
	height: 2px;
	background-color: #fff;
}

.navbar ul.navbar-nav li.nav-item.ets-right-0 .dropdown-menu {
	left: auto;
	right: 0;
	position: absolute;
}

.side-bar {
	position: fixed;
	top: 81px;
	left: 0;
	padding: 15px;
	display: inline-block;
	width: 100px;
	background-color: #fff;
	box-shadow: 0px 0px 8px #ccc;
	height: 100vh;
	transition: ease 0.5s;
	overflow-y: auto;
}

.main-body-content {
	display: inline-block;
	padding: 15px;
	background-color: #eef4fb;
	height: 100vh;
	padding-left: 100px;
	transition: ease 0.5s;
}

.ets-pt {
	padding-top: 100px;
}

.main-admin.show-menu .side-bar {
	width: 250px;
}

.main-admin.show-menu .main-body-content {
	padding-left: 265px;
}

.main-admin.show-menu .navbar .menu-bar .bars {
	width: 15px;
}

.main-admin.show-menu .navbar .menu-bar .bars::after {
	width: 10px;
}

.main-admin.show-menu .navbar .menu-bar .bars::before {
	width: 25px;
}

.main-admin.show-menu .side-bar-links {
	opacity: 1;
}

.main-admin.show-menu .side-bar .side-bar-icons {
	opacity: 0;
}

.side-bar .side-bar-links {
	opacity: 0;
	transition: ease 0.5s;
}

.side-bar .side-bar-links ul.navbar-nav li a {
	font-size: 14px;
	color: #000;
	font-weight: 500;
	padding: 10px;
}

.side-bar .side-bar-links ul.navbar-nav li a i {
	font-size: 20px;
	color: #8ac1f6;
}

.side-bar .side-bar-links ul.navbar-nav li a:hover, .side-bar-links ul.navbar-nav li a:focus
	{
	text-decoration: none;
	background-color: #8ac1f6;
	color: #fff;
}

.side-bar .side-bar-links ul.navbar-nav li a:hover i {
	color: #fff;
}

.side-bar .side-bar-logo img {
	width: 100px;
	height: 100px;
}

.side-bar .side-bar-icons {
	position: absolute;
	top: 20px;
	right: 0;
	width: 100px;
	opacity: 1;
	transition: ease 0.5s;
}

.side-bar .side-bar-icons .side-bar-logo img {
	width: 50px;
	height: 50px;
	object-fit: cover;
}

.side-bar .side-bar-icons .side-bar-logo h5 {
	font-size: 14px;
}

.side-bar .side-bar-icons .set-width {
	color: #000;
	font-size: 32px;
}

.side-bar .side-bar-icons .set-width:hover, .side-bar .side-bar-icons .set-width:focus
	{
	color: #8ac1f6;
	text-decoration: none;
}
</style>
<body>
	<div id="page-container" class="main-admin">
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100">
			<a class="navbar-brand" href="#"></a>
			<div id="open-menu" class="menu-bar">
				<div class="bars"></div>
			</div>
			<a href="${pageContext.request.contextPath}/main/main" class="nav-links d-block" style="color: white"> <i class="fa fa-home pr-2" style="color: white"></i>메인 페이지</a>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown ets-right-0"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> </a></li>
			</ul>
		</nav>
		<div class="side-bar">
			<div class="side-bar-links">
				<div class="side-bar-logo text-center py-3">
					<h5>공티 관리자 페이지</h5>
				</div>
				<ul class="navbar-nav">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/adminPage/adminMain" class="nav-links d-block"><i class="fa fa-home pr-2"></i> 회원목록</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/adminPage/adminPro" class="nav-links d-block"><i class="fa fa-home pr-2"></i> 프로젝트</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/adminPage/adminResume" class="nav-links d-block"><i class="fa fa-home pr-2"></i> 이력서</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/adminPage/adminNotice" class="nav-links d-block"><i class="fa fa-home pr-2"></i> 공지사항</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/adminPage/adminInquiry" class="nav-links d-block"><i class="fa fa-home pr-2"></i> 문의</a></li>
				</ul>
			</div>
			<div class="side-bar-icons">
				<div class="icons d-flex flex-column align-items-center">
				</div>
			</div>
		</div>
		<div class="main-body-content w-100 ets-pt">
			<div class="table-responsive bg-light">
				<table class="table">
					<tr>
						<th>아이디</th>
						<th>제목</th>
						<th>내용</th>
						<th>파트너 형태</th>
						<th>경력</th>
					</tr>
					<%-- 
					일자 : 241207 
					수정내역 : AdminController에서 List객체의 변수명 변경(ResumeDTOList -> resumeDTOList)
					--%>
					<c:forEach var="resumeDTO" items="${resumeDTOList}">
						<div>
							<tr>
								<th>${resumeDTO.id}</th>
								<th onclick="location.href='${pageContext.request.contextPath}/resume/resume?r_num=${resumeDTO.r_num }'">${resumeDTO.r_name}</th>
								<th onclick="location.href='${pageContext.request.contextPath}/resume/resume?r_num=${resumeDTO.r_num }'">${resumeDTO.r_content}</th>
								<th>${resumeDTO.r_form}</th>
								<th>${resumeDTO.r_career}</th>
								<th><input type="button" value="글삭제" style="font-size: 8px;" onclick="location.href='${pageContext.request.contextPath}/adminPage/adminDeleteResume?r_num=${resumeDTO.r_num}'"></th>
							</tr>
						</div>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
    	jQuery(document).ready(function(){
    		jQuery("#open-menu").click(function(){
    			if(jQuery('#page-container').hasClass('show-menu')){
    			jQuery("#page-container").removeClass('show-menu');
    		}
    			
    			else{
    			jQuery("#page-container").addClass('show-menu');
    			}
    		});
    	});
    </script>
</body>
</html>
