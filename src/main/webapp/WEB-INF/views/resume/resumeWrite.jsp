<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공T 이력서 공고 작성</title>
<!-- <link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202401301659.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" /> -->
<style>
button{ padding: 0; margin: 0; border: 0 none; vertical-align:middle; overflow:visible; background:transparent; cursor:pointer; }

input{
height: 45px;
width: 400px;
}

.wrappe {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100dvh;
}

.conten {
  padding: 1rem;
/*   font-size: 2rem; */
  border-radius: 1rem;
}

#button {
background-color: #1842B6;
color: white;
padding: 10px;
border: none;
border-radius: 4px;
cursor: pointer;
width: 100px;
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <jsp:include page="../inc/top.jsp"/>


<br><br><br>
<div class="wrappe">
<div class="conten">
<h1>이력서 작성</h1>
<p>이력서를 등록하고 기업의 제안을 받아보세요!</p>

<form action="${pageContext.request.contextPath}/resume/resumeWritePro" id="join" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${sessionScope.id }">
<fieldset>
<legend><h5>정해진 양식에 맞게 작성해주십시오.</h5></legend>
<h3>이력서 제목</h3>
<input type="text" name="r_name" maxlength="50" required autofocus><br><br>
<h3>파트너형태</h3>
<select name="r_form"style="width: 100px; height: 30px;">
	<option value="개인">개인</option>
	<option value="팀">팀</option>
	<option value="개인사업자">개인사업자</option>
	<option value="법인사업자">법인사업자</option>
</select><br><br>
<h3>직종</h3>
<select name="field_num" style="width: 100px; height: 30px;">
	<option value="1">개발자</option>
	<option value="2">퍼블리셔</option>
	<option value="3">디자이너</option>
	<option value="4">기타</option>
</select><br>
<sub>※원하시는 직종이 없으시다면 '기타'로 해주시길 바랍니다.</sub>
<br><br>
<h3>지역</h3>
<select name="region_num" style="width: 100px; height: 30px;">
	<option value="1">전체</option>
	<option value="2">서울특별시</option>
	<option value="3">부산광역시</option>
	<option value="4">인천광역시</option>
	<option value="5">대전광역시</option>
	<option value="6">대구광역시</option>
	<option value="7">울산광역시</option>
	<option value="8">광주광역시</option>
	<option value="9">세종특별자치시</option>
	<option value="10">경기도</option>
	<option value="11">강원도</option>
	<option value="12">충청북도</option>
	<option value="13">충청남도</option>
	<option value="14">경상북도</option>
	<option value="15">경상남도</option>
	<option value="16">전라북도</option>
	<option value="17">전라남도</option>
	<option value="18">제주특별자치도</option>
</select><br><br>
<h3>보유 기술</h3>
<input type="text" name="r_tech" maxlength="100"><br>
<sub>※보유 기술을 나열해주세요.</sub><br><br>

<h3>희망 급여</h3>
<input type="text" name="r_salary" placeholder="0" style="font-size: 140%; width: 200px;" required> 만원<br>
<sub>※만 단위로 입력해주세요.</sub><br><br>

<h3>경력</h3>
<input type="text" name="r_career" placeholder="0" style="font-size: 140%; width: 200px;" required> 년<br>
<sub>※년 단위로 입력해주세요. 경력이 없으시 0으로 입력해주세요.</sub><br><br>

<h3>수행한 프로젝트</h3>
<input type="text" name="r_exp"><br>
<sub>※수행한 프로젝트를 반점(,)으로 구분하며 나열해주세요.</sub><br><br>

<h3>첨부 파일</h3>
<input type="file" name="file"><br>
<sub>※첨부할 파일이 있다면 등록해주세요.(자기소개서, 포트폴리오 등)</sub><br><br>

<h3>이력서 내용</h3>
<textarea name="r_content" placeholder="내용" maxlength="1000" cols="50" rows="20" ></textarea><br><br>

<center>

<button type="submit" value="등록하기" id="button" class="submit" style="background-color: #1842B6;">등록하기</button>
<button type="reset" value="돌아가기" id="button" class="cancel" style="background-color: #1842B6;" onclick="history.back()">돌아가기</button>

</center>
</fieldset>
</form>


</div>
</div>
<br><br><br><br><br>


<script type="text/javascript">

// $(function() {
// 	//아이디 중복 확인
// 	$(".dupid").click(function(){
// 		$.ajax({
// 			url : '${pageContext.request.contextPath}/main/idCheck',
// 			data : {'id' : $('.id').val()}, 
// 			success : function(result){
// 				if(result=="iddup"){
// 					result = "사용불가능한 아이디입니다.";
// 					$(".dupdivid").css("color", "#ff2020");
// 				}else{
// 					result = "사용가능한 아이디입니다.";
// 					$(".dupdivid").css("color", "green");
// 				}
// 				$('.dupdivid').html(result);
// 			}
// 		});
	
// 	});
		
// 	//이메일 중복 확인
// 	$(".dupemail").click(function(){
// 	$.ajax({
// 		url : '${pageContext.request.contextPath}/main/emailCheck',
// 		data : {'email' : $('.email').val()}, 
// 		success : function(result){
// 			if(result=="emaildup"){
// 				result = "사용불가능한 이메일입니다.";
// 				$(".dupdivemail").css("color", "red");
// 			}else{
// 				result = "사용가능한 이메일입니다.";
// 				$(".dupdivemail").css("color", "green");
// 			}
// 			$('.dupdivemail').html(result);
// 			}
// 		});

// 	});
	
// 	//전화번호 중복 확인
// 	$(".dupphone").click(function(){
// 	$.ajax({
// 		url : '${pageContext.request.contextPath}/main/phoneCheck',
// 		data : {'phone' : $('.phone').val()}, 
// 		success : function(result){
// 			if(result=="phonedup"){
// 				result = "사용불가능한 전화번호입니다.";
// 				$(".dupdivphone").css("color", "red");
// 			}else{
// 				result = "사용가능한 전화번호입니다.";
// 				$(".dupdivphone").css("color", "green");
// 			}
// 			$('.dupdivphone').html(result);
// 			}
// 		});

// 	});
	
// });

</script>
    <jsp:include page="../inc/bottom.jsp"/>
</body>
</html>