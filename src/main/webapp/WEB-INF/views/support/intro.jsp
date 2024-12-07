<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>notice</title>
<style>
#border{
	height: 1000px;
}
#up {
	margin-top : 75px;
	text-align: center;
	width: 100%;
/* 	background-color: lightgray; */
	height: 100px;
	line-height: 100px;
}

#left {
	height: 300px;
	width: 15%;
	border-style : groove;
	float: left;
	border-radius: 20px;
	text-align: center;
	margin-left: 10%;
}

#right {
 	height: 50%; 
	width: 60%;
	float: left;
	text-align: center;
	margin-right: 10%;
}


table {
	width: 100%;
/* 	height: 200px; */
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid black;
	text-align: center;
	padding: 4px;
	height: 1px;
}
#side1 {
	float:left;
	margin-left:50px;
	line-height: 100px;
}
#side2 {
	float:right;
	margin-right:50px;
	line-height: 100px;
}
 #side1_c{  
/*  	border:1px solid black;  */
 	width:340px;
	float:left	;	
 	margin-left:50px; 
 	padding-left:30px;
 	
} #side2_c{  
/*  border:1px solid black;  */
	width:340px; 
	float:right	;	
 	margin-right:30px; 
 	padding-right:30px;
/*  	hight:541px; */
} 
a {
  text-decoration-line: none;
}
.clear{
	clear:both;
}
fieldset {
	width:1000px;
}
#table_search {

padding-right:60px;
}
</style>
</head>

<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">
	<h1>자주 묻는 질문</h1>
</div>

<div id="left">		
<ul>
<li><a href="${pageContext.request.contextPath}/Admin/notice">공지사항</a></li>

<li style="font-weight: bold;"><a href="${pageContext.request.contextPath}/Admin/FAQ">자주 묻는 질문</a></li>
<li><a href="${pageContext.request.contextPath}/Admin/inquiry">1:1문의</a></li>

</ul>
</div>

<div id="right">
<form action="" id="join">



<h3>프리랜서 회원 </h3>
<ul>
<h4>서비스 이용 절차를 알려주세요</h4>

<h5 style="font-weight:bold">'클라이언트' 계정으로 회원가입 > 프로젝트 등록 > 검수 상담 > 지원자 모집 > 미팅 > 검토 > 계약 > 프로젝트 시작</h5>

<p>1. 프로젝트 등록을 위해 '클라이언트' 계정으로 가입해주세요.</p><br>
<p>2. 의뢰하실 프로젝트 내용을 알고 계신 만큼 작성하여 등록해주세요.</p><br>
<p>3. 위시켓 검수 매니저와 유선으로 견적/기간 상담 후, 최종적으로 사이트에 프로젝트가 등록됩니다.</p><br>
<p>4. 모집 시작일로부터 최대 2주까지 지원자를 모집받아보실 수 있습니다.</p><br>
<p>5. 지원자 중 가장 마음에 드는 파트너 2명과 온라인/오프라인 미팅 진행이 가능합니다.</p><br>
<p>6. 미팅 후 계약할 파트너를 검토할 수 있습니다.</p><br>
<p>7. 협의된 업무 범위, 견적/기간을 바탕으로 담당 매니저가 계약서를 작성해드립니다.</p><br>
<p>8. 대금 입금 후 프로젝트가 착수됩니다.</p><br>

<p>위시켓에서는 프로젝트의 시작부터 끝까지 전 과정 진행을 도와드립니다.</p><br>
<p>단계 별로 담당 매니저가 배정되어 프로젝트가 원활히 진행될 수 있도록 신속, 정확한 응대를 제공합니다.</p><br>
</ul>


				

<!-- 				<div id="page_control"> -->
<!-- 					<a href="#">이전</a> <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
<!-- 					<a href="#">4</a><a href="#">5</a><a href="#">6</a> <a href="#">7</a><a -->
<!-- 						href="#">8</a><a href="#">9</a> <a href="#">10</a> <a href="#">다음</a> -->

</form>			
<div class="clear"></div>	
<div id="table_search">
	
						<input type="text" name="search" class="input_box"> 
						<input id="btn"type="button" value="검색" class="btn">
				</div>
				<div class="clear"></div>
</div>

</div>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>
