<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>공티T 회원가입</title>
<style>
#joinh1{
	text-align: center;
	margin:110px 10px 40px 50px;
	font-weight: bolder;
}
#up {
	margin-top : 75px;
	text-align: center;
	width: 100%;
/* 	background-color: lightgray; */
	height: 100px;
	line-height: 100px;
}
#joindiv{
	width:400px;
	height:400px;
	margin:auto;
	}
	
#join{
height: 20%;
}

button{
	height: 100px;
	width: 300px;
}
h1{
text-align: center; 
} 
</style>
</head>
<body>
<jsp:include page="../inc/top.jsp" />
<div id="joindiv">
<div id="up">
<h1 id = "joinh1">회원 가입</h1>
<div id="join">
<a href="${pageContext.request.contextPath}/main/insertFreelancer"><button type="button" class="btn btn-outline-primary">프리랜서 회원<br><sub>프로젝트를 찾는 개인</sub></button></a>
<a href="${pageContext.request.contextPath}/main/insertCompany"><button type="button" class="btn btn-outline-primary">기업 회원<br><sub>의뢰할 프로젝트가 있는 기업</sub></button>
</a>
</div>
</div>
</div>            
<jsp:include page="../inc/bottom.jsp" />


</body>
</html>