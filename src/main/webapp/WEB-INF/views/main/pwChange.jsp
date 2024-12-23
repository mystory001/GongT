<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공티 비밀번호 변경 완료</title>
<style type="text/css">
#idForm {
	max-width: 400px;
	margin: auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

button {
	background-color: blue;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100px;
}
</style>
</head>
<jsp:include page="../inc/top.jsp" />
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="idForm">
		<form action="${pageContext.request.contextPath}/main/findPwPro" method="post">
			<h2>비밀번호가 성공적으로 변경되었습니다.</h2>
			<center>
				<a href="${pageContext.request.contextPath}/main/login">로그인 페이지로 가기</a>
			</center>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../inc/bottom.jsp" />

</body>
</html>