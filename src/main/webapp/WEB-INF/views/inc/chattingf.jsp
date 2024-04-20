<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#chat{
width : 40%;
float : left;

}

#messge{
width : 60%;
float: left;

}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color: coral;}

body {
  margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
}

.container {
  border: 2px solid #dedede;
  background-color: #fff0c4;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #BBDEFB;

}

.container::after {
  content: "";
  clear: both;
  display: table;

}




.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #999;
}
</style>
</head>
<body>
<h2>공T 쪽지</h2>

<!-- <div id="chat"> -->
<!-- <table> -->
<!--   <tr style="background-color: transparent !important;"> -->
<!--     <th>대화상대</th> -->

<!--     <th>시간</th> -->
<!--   </tr> -->
<%-- <c:forEach var="ChattingDTO" items="${ChattingDTOList2}"> --%>
<!--  <tr> -->
<%--     <th>${ChattingDTO.sid}</th> --%>

<%--     <th>${ChattingDTO.c_time}</th> --%>
<!--   </tr> -->
<%-- </c:forEach> --%>

<!-- </table> -->

<!-- </div> -->
<%-- <p>${sessionScope.id}</p> --%>
<!-- <div id="messge"> -->

<%-- <c:if test="${sessionScope.id ne ChatDTO.id}"> --%>
<!-- <div class="container"> -->

<%-- <c:forEach var="ChattingDTO" items="${ChattingDTOListFF}"> --%>

<%-- <p>${ChattingDTO.id}님</p> --%>
<%--   <p>${ChattingDTO.c_content}</p> --%>
<%--   <span class="time-right">${ChattingDTO.c_time}</span><br> --%>
<%-- </c:forEach> --%>
<!-- </div> -->
<%-- </c:if> --%>


<c:if test="${sessionScope.id eq chatDTO.fid}">
	<c:forEach var="chattingDTO" items="${chattingDTOListFF}">
		<c:if test="${sessionScope.id ne chattingDTO.id }">
		<div class="container">
			<p>${chattingDTO.id}님</p>
  			<p>${chattingDTO.c_content}</p>
  			<span class="time-left">${chattingDTO.c_time}</span><br>
		</div>
		</c:if>

		<c:if test="${sessionScope.id eq chattingDTO.id}">
		<div class="container darker">
			<p style="text-align: right;">${chattingDTO.id}님</p>
  			<p style="text-align: right;">${chattingDTO.c_content}</p>
  			<span class="time-right">${chattingDTO.c_time}</span><br>
		</div>
		</c:if>
	</c:forEach>
</c:if> 

<form action="${pageContext.request.contextPath}/inc/insertMessagePro" id="join" method="post">
	<input type="hidden" name="c_num" value="${chatDTO.c_num}" readonly>
	<input type="hidden" name="id" class="id" value="${sessionScope.id}" readonly>
	<input type="text" name="c_content" maxlength="1000" required style="width:320px;">
	<button type="submit" value="보내기" class="submit" style="background-color: #1842B6; color: white;">보내기</button>
</form>
<!-- </div> -->




</body>
</html>