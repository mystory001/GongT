<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>공티 로그인</title>
<style>
#loginh1 {
	text-align: center;
	margin: 110px 10px 40px 50px;
	font-weight: bolder;
}

#logindiv {
	width: 400px;
	height: 400px;
	margin: auto;
}

#findidpw {
	text-align: right;
}

#logindiv2 {
	text-align: right;
}

#id {
	margin: auto 74px auto auto;
}

#loginbutton {
	padding: 10px;
}
</style>
</head>

<body>
	<jsp:include page="../inc/top.jsp" />

	<!-- 로그인 -->
	<div id="logindiv">
		<h1 id="loginh1">로그인</h1>
		<form action="${pageContext.request.contextPath}/main/loginPro"
			id="join" method="post">
			<div id="logindiv2">
				<label>아이디</label> <input id="id" type="text" name="id"><br>
				<br> <label>비밀번호</label> <input type="password" name="pw">
				<input id="loginbutton" type="submit" class="btn btn-primary"
					value="로그인">
			</div>
			<hr>
			<div id="findidpw">
				<a href="${pageContext.request.contextPath}/main/searchID">아이디
					찾기</a> | <a href="${pageContext.request.contextPath}/main/searchPW">비밀번호
					찾기</a>
			</div>
		</form>
	</div>
	<jsp:include page="../inc/bottom.jsp" />

</body>
</html>