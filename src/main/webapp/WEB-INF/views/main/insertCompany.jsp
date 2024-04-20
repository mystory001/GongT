<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>공티T 회원가입</title>
<style>
input{
height: 45px;
width: 400px;
}
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100dvh;
}

.content {
  padding: 1rem;
/*   font-size: 2rem; */
  border-radius: 1rem;
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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<jsp:include page="../inc/top.jsp" />
</head>
<body>
<br><br><br>
<div class="wrapper">
<div class="content">
<h1>회원가입</h1>
<form action="${pageContext.request.contextPath}/main/insertCompanyPro" id="join" method="post" onsubmit="return validatePassword()">
<p>회원가입을 통하여 프로젝트에 참여해보세요!</p>
<fieldset>
<legend><h5>필수 정보입니다. 모두 입력해주세요.</h5></legend>
<h3>아이디</h3>
<input type="text" width="300" name="id" class="id" maxlength="20" required autofocus>
<button value="중복확인" class="dupid">중복확인</button><br>
<sub>※아이디 영문,숫자 20자 내로 입력해주세요.</sub>
<div class="dupdivid"></div><br>
<h3>비밀번호</h3>
<input type="password" id="pw" name="pw" maxlength="20" required><br>
<h3>비밀번호 확인</h3>
<input type="password" id="pw2" name="pw2" maxlength="20" required><br>
<sub>※비밀번호를 다시 작성해주세요.</sub>
<h3>기업명</h3>
<input type="text" name="name" maxlength="20" required><br>
<sub>※기업명을 입력해주세요.</sub>
<h3>사업자 번호</h3>
<input type="text" name="comnum" class="comnum" maxlength="12" required>
<button type="button" value="중복확인" class="dupcomnum">중복확인</button><br>
<sub>※사업자 등록번호를 입력해주세요.</sub>
<div class="dupdivcomnum"></div><br>
<h3>이메일</h3>
<input type="email" name="email" class="email" maxlength="50" required>
<button type="button" value="중복확인" class="dupemail">중복확인</button><br>
<sub>※이메일을 입력해주세요.</sub>
<div class="dupdivemail"></div><br>
<h3>전화번호</h3>
<input type="text" name="phone" class="phone" maxlength="13" required>
<button type="button" value="중복확인" class="dupphone">중복확인</button><br>
<sub>※전화번호를 입력해주세요.</sub>
<div class="dupdivphone"></div><br>
<center>
<button type="submit" value="회원가입" class="submit">회원가입</button>
<button type="reset" value="취소" class="cancel" onclick="history.back()">돌아가기</button>
</center>
</fieldset>
</form>
</div>
</div>
<br><br><br><br><br>

<script type="text/javascript">
//비밀번호가 일치해야 페이지가 넘어가는 코드
function validatePassword() {
    var passwordField = document.getElementById("pw");
    var confirmPasswordField = document.getElementById("pw2");

    // 비밀번호 필드가 존재하는지 확인
    if (passwordField && confirmPasswordField) {
        var password = passwordField.value;
        var confirmPassword = confirmPasswordField.value;

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false; // 페이지 전환을 막기 위해 false를 반환
        }
        return true; // 비밀번호가 일치하면 페이지 전환 허용
    } else {
        console.error("비밀번호 필드를 찾을 수 없습니다.");
        return false; // 오류 발생 시 페이지 전환을 막기 위해 false를 반환
    }
}



$(function() {
	//아이디 중복 확인
	$(".dupid").click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/main/idCheck',
			data : {'id' : $('.id').val()}, 
			success : function(result){
				if(result=="iddup"){
					result = "사용불가능한 아이디입니다.";
					$(".dupdivid").css("color", "red");
				}else{
					result = "사용가능한 아이디입니다.";
					$(".dupdivid").css("color", "green");
				}
				$('.dupdivid').html(result);
			}
		});
	
	});
	
	//사업자 번호 중복 확인
	$(".dupcomnum").click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/main/comnumCheck',
			data : {'comnum' : $('.comnum').val()}, 
			success : function(result){
				if(result=="comnumdup"){
					result = "사용불가능한 사업자 번호입니다.";
					$(".dupdivcomnum").css("color", "red");
				}else{
					result = "사용가능한 사업자 번호입니다.";
					$(".dupdivcomnum").css("color", "green");
				}
				$('.dupdivcomnum').html(result);
			}
		});
	
	});
	
	//이메일 중복 확인
	$(".dupemail").click(function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/main/emailCheck',
		data : {'email' : $('.email').val()}, 
		success : function(result){
			if(result=="emaildup"){
				result = "사용불가능한 이메일입니다.";
				$(".dupdivemail").css("color", "red");
			}else{
				result = "사용가능한 이메일입니다.";
				$(".dupdivemail").css("color", "green");
			}
			$('.dupdivemail').html(result);
			}
		});

	});
	
	//전화번호 중복 확인
	$(".dupphone").click(function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/main/phoneCheck',
		data : {'phone' : $('.phone').val()}, 
		success : function(result){
			if(result=="phonedup"){
				result = "사용불가능한 전화번호입니다.";
				$(".dupdivphone").css("color", "red")
			}else{
				result = "사용가능한 전화번호입니다.";
				$(".dupdivphone").css("color", "green")
			}
			$('.dupdivphone').html(result);
			}
		});

	});
	
});

//하이픈
//사업자번호 하이픈
$(".comnum").on('keydown keyup', function(){
	 this.value = this.value.replace(/[^0-9]/g, '');

     var str = this.value;
     var tmp = '';
     var bullet = '-';
	
     //"문자열".substr(startIndex, length);
   	 if (str.length > 3 && str.length < 7) {
       tmp += str.substr(0, 3);
       tmp += bullet;
       tmp += str.substr(3);
       this.value = tmp;
   	 }else if(str.length == 7){
   		tmp += str.substr(0, 2);
        tmp += bullet;
        tmp += str.substr(2);
        this.value = tmp;	 
   	 }else if(str.length > 7){
   		tmp += str.substr(0, 3);
	    tmp += bullet;
	    tmp += str.substr(3, 2);
	    tmp += bullet;
	    tmp += str.substr(5);
	    this.value = tmp;
   	 }
   	 else {
         this.value = str;
   	 } 	    

});

//전화번호 하이픈
$(".phone").on('keydown keyup',function() {
              this.value = this.value.replace(/[^0-9]/g, '');

              var str = this.value;
              var tmp = '';
              var bullet = '-';

              if (str.length > 3 && str.length < 8) {
                  tmp += str.substr(0, 3);
                  tmp += bullet;
                  tmp += str.substr(3);
                  this.value = tmp;
              } else if (str.length == 8) {
                  tmp += str.substr(0, 4);
                  tmp += bullet;
                  tmp += str.substr(4);
                  this.value = tmp;
              } else if (str.length == 10) {
                  tmp += str.substr(0, 2);
                  tmp += bullet;
                  tmp += str.substr(2, 4);
                  tmp += bullet;
                  tmp += str.substr(6); // 10자리일때
                  this.value = tmp;
              } else if (str.length > 8) {
                  tmp += str.substr(0, 3);
                  tmp += bullet;
                  tmp += str.substr(3, 4);
                  tmp += bullet;
                  tmp += str.substr(7, 4);
                  this.value = tmp;
              } else {
                  this.value = str;
              }
          });
</script>


</body>
</html>