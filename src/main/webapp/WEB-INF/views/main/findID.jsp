<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공T 아이디 찾기 결과</title>
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
<br><br><br><br><br><br><br>
<div id="idForm">
<form action="" method="post">
        <h2>아이디 찾기 결과</h2>
            <label for="id">찾으시는 아이디는 </label><br>
            <h2>${memberDTO2.id }</h2>입니다.<br>
            <center>	
            <button type="reset" value="취소" class="cancel" onclick="history.go(-2)">돌아가기</button>
            </center>
        </form>
    </div>
    <br><br><br><br><br><br><br>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>