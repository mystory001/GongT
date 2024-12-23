<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공티 새 비밀번호 설정</title>
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
			<h2>새로운 비밀번호</h2>
			<input type="hidden" name="id" value="${memberDTO2.id}">
			새로운 비밀번호 <input type="password" name="pw" id="pw"><br>
			비밀번호 확인 <input type="password" id="pw2"><br>
			<center>
				<button type="submit" onclick="return validatePw()">확인</button>
				<button type="reset" value="취소" class="cancel"
					onclick="history.go(-2)">돌아가기</button>
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
	
	<script type="text/javascript">
		// 비밀번호 확인 함수
		function validatePw(){
			var pw = document.getElementById("pw").value;
			var pw2 = document.getElementById("pw2").value;
			
			if(pw !== pw2){
				alert("입력한 비밀번호가 다릅니다.");
				document.getElementById("pw").focus();
				return false;
			}
			return true;
		}
	
	</script>
</body>
</html>