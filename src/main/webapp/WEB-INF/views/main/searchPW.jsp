<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공T 비밀번호 찾기</title>
<style>
body {
font-family: Arial, sans-serif;
background-color: #f4f4f4;
text-align: center;
padding: 20px;
}

#idForm {
max-width: 400px;
margin: auto;
background-color: #fff;
padding: 20px;
border-radius: 8px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
display: block;
margin-bottom: 8px;
}

input {
width: 100%;
padding: 8px;
margin-bottom: 16px;
box-sizing: border-box;
}

button {
background-color: blue;
color: #fff;
padding: 10px;
border: none;
border-radius: 4px;
cursor: pointer;
}
</style>
</head>
<body>
 <div id="idForm">
        <h2>비밀번호 찾기</h2>
        <form action="${pageContext.request.contextPath}/main/searchPWPro" method="post">
            <label for="id">아이디</label>
            <input type="text" name="id" style="width:250px" required><br>
            <label for="name">이름</label>
            <input type="text" name="name" style="width:250px" required><br>
            <label for="phone">이메일</label>
            <input type="text" name="email" style="width:250px" required><br>
            <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
        </form>
    </div>
</body>
</html>