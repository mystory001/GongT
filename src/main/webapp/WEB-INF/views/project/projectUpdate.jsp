<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>공T 프로젝트 공고 수정</title>
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
</head>
<body>
    <jsp:include page="../inc/top.jsp"/>


<br><br><br>
<div class="wrappe">
<div class="conten">
<h1>프로젝트 공고 수정</h1>
<p>수정할 내용을 변경해주시고 수정하기 버튼을 눌러주세요.</p>
<form action="${pageContext.request.contextPath}/project/projectUpdatePro" id="join" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${projectDTO.id }">
<input type="hidden" name="p_num" value="${projectDTO.p_num }">
<fieldset>
<legend><h5>정해진 양식에 맞게 작성해주십시오.</h5></legend>
<h3>프로젝트 공고 제목</h3>
<input type="text" width="300" name="p_title" class="id" value="${projectDTO.p_title}" maxlength="50" required autofocus><br><br>

<h3>필요 인원</h3>
<input type="number" name="p_member" placeholder="1" min="1" value="${projectDTO.p_member} style="font-size:120%; width: 60px; height: 30px;" required>명<br><br>
<h3>직종</h3>
<select name="field" id="field" style="width: 100px; height: 30px;">
	<option value="1" <c:if test="${projectDTO.field_num eq '1'}"> selected </c:if>>개발자</option>
	<option value="2" <c:if test="${projectDTO.field_num eq '2'}"> selected </c:if>>퍼블리셔</option>
	<option value="3" <c:if test="${projectDTO.field_num eq '3'}"> selected </c:if>>디자이너</option>
	<option value="4" <c:if test="${projectDTO.field_num eq '4'}"> selected </c:if>>기타</option>
</select><br><br>
<h3>지역</h3>
<select name="region" id="region" style="width: 100px; height: 30px;">
	<option value="1" <c:if test="${subjectDTO.region_num eq '1'}"> selected </c:if>>전체</option>
	<option value="2" <c:if test="${subjectDTO.region_num eq '2'}"> selected </c:if>>서울특별시</option>
	<option value="3" <c:if test="${subjectDTO.region_num eq '3'}"> selected </c:if>>부산광역시</option>
	<option value="4" <c:if test="${subjectDTO.region_num eq '4'}"> selected </c:if>>인천광역시</option>
	<option value="5" <c:if test="${subjectDTO.region_num eq '5'}"> selected </c:if>>대전광역시</option>
	<option value="6" <c:if test="${subjectDTO.region_num eq '6'}"> selected </c:if>>대구광역시</option>
	<option value="7" <c:if test="${subjectDTO.region_num eq '7'}"> selected </c:if>>울산광역시</option>
	<option value="8" <c:if test="${subjectDTO.region_num eq '8'}"> selected </c:if>>광주광역시</option>
	<option value="9" <c:if test="${subjectDTO.region_num eq '9'}"> selected </c:if>>세종특별자치시</option>
	<option value="10" <c:if test="${subjectDTO.region_num eq '10'}"> selected </c:if>>경기도</option>
	<option value="11" <c:if test="${subjectDTO.region_num eq '11'}"> selected </c:if>>강원도</option>
	<option value="12" <c:if test="${subjectDTO.region_num eq '12'}"> selected </c:if>>충청북도</option>
	<option value="13" <c:if test="${subjectDTO.region_num eq '13'}"> selected </c:if>>충청남도</option>
	<option value="14" <c:if test="${subjectDTO.region_num eq '14'}"> selected </c:if>>경상북도</option>
	<option value="15" <c:if test="${subjectDTO.region_num eq '15'}"> selected </c:if>>경상남도</option>
	<option value="16" <c:if test="${subjectDTO.region_num eq '16'}"> selected </c:if>>전라북도</option>
	<option value="17" <c:if test="${subjectDTO.region_num eq '17'}"> selected </c:if>>전라남도</option>
	<option value="18" <c:if test="${subjectDTO.region_num eq '18'}"> selected </c:if>>제주특별자치도</option>
</select><br><br>
<h3>모집 마감 기한</h3>
<input type="datetime-local" name="p_deadline" value="${subjectDTO.p_deadline }"><br>
<sub>※모집 마감할 시간을 선택해 주세요.</sub><br><br>

<h3>프로젝트 시작 예정일</h3>
<input type="date" name="p_start" value="${subjectDTO.p_start}"><br>
<sub>※프로젝트 시작 예정일을 선택해 주세요.</sub><br><br>

<h3>프로젝트 종료 예정일</h3>
<input type="date" name="p_end" value="${subjectDTO.p_end }"><br>
<sub>※프로젝트 종료 예정일을 선택해 주세요.</sub><br><br>

<h3>첨부 파일</h3>
<input type="file" name="file" value="${file }"><br>
<sub>※첨부할 파일이 있다면 등록해주세요. (판촉물, 광고지 등)</sub><br><br>

<h3>프로젝트 공고 내용</h3>
<textarea name="p_content" placeholder="내용" maxlength="1000" cols="50" rows="20" >${projectDTO.p_content }</textarea><br><br>

<center>
<button type="submit" value="회원가입" id="button" class="submit" style="background-color: #1842B6;">수정하기</button>
<button type="reset" value="취소" id="button" class="cancel" style="background-color: #1842B6;" onclick="history.back()">돌아가기</button>
</center>
</fieldset>
</form>


</div>
</div>
<br><br><br><br><br>


<jsp:include page="../inc/bottom.jsp"/>

</body>
</html>