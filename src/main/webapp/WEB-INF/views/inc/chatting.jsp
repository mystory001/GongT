<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>공티 채팅</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
#chat {
	width: 40%;
	float: left;
}

#messge {
	width: 60%;
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

tr:hover {
	background-color: coral;
}

body {
	margin: 0 auto;
	max-width: 800px;
	padding: 0 20px;
}

.container {
	background-color: #fff0c4;
	border-radius: 5px;
	padding: 10px;
	margin: 10px 0;
	text-align: left;
	font-weight: bolder;
}

.darker {
	border-color: #ccc;
	background-color: #BBDEFB;
	text-align: right;
}

.container::after {
	content: "";
	clear: both;
	display: table;
}

p {
	color: black;
}

.time-right {
	float: right;
	color: #aaa;
}

.time-left {
	float: left;
	color: #999;
}

.button {
	background-color: #04AA6D; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #1842B6;
}

.button2:hover {
	background-color: #1842B6;
	color: white;
}

.good {
	border: 2px solid black;
	outline: #1E90FF solid 10px;
	margin: auto;
	padding: 20px;
	text-align: center;
	font-size: 25px;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
// 페이지 새로고침 함수
function refreshPage() {
    setInterval(() => {
        location.reload();
    }, 10000); // 10초마다 페이지 새로고침
}

// 페이지가 로드되었을 때 자동 새로고침 시작
window.onload = function() {
    refreshPage();
}
</script>
<body>
	<jsp:include page="top_chat.jsp" />

	<form action="${pageContext.request.contextPath}/inc/updateMatching"
		method="post">

		<c:if test="${chatDTO.c_matching eq 0}">
			<c:if test="${chatDTO.cid eq sessionScope.id}">
				<input type="hidden" name="c_num" value="${chatDTO.c_num}" readonly>
				<input type="hidden" name="cid" value="${chatDTO.cid}">
				<input type="hidden" name="fid" value="${chatDTO.fid}">
				<button class="button button2" type="submit" value="매칭완료"
					class="submit">매칭완료</button>
			</c:if>
		</c:if>
		<c:if test="${chatDTO.c_matching eq 1}">
			<div>
				<p class="good">매칭 완료</p>
			</div>
		</c:if>
	</form>

	<c:if test="${sessionScope.id eq chatDTO.fid}">
		<c:forEach var="chattingDTO" items="${messageList}">
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


	<c:if test="${sessionScope.id eq chatDTO.cid}">
		<c:forEach var="chattingDTO" items="${messageList}">
			<c:if test="${sessionScope.id ne chattingDTO.id }">
				<div class="container">
					<p>${chattingDTO.id}님</p>
					<p>${chattingDTO.c_content}</p>
					<span class="time-left">${chattingDTO.c_time}</span><br>
				</div>
			</c:if>

			<c:if test="${sessionScope.id eq chattingDTO.id }">
				<div class="container darker">
					<p style="text-align: right;">${chattingDTO.id}님</p>
					<p style="text-align: right;">${chattingDTO.c_content}</p>
					<span class="time-right">${chattingDTO.c_time}</span><br>
				</div>
			</c:if>
		</c:forEach>
	</c:if>


	<form action="${pageContext.request.contextPath}/inc/insertMessagePro"
		id="join" name="msg" method="post">
		<input type="hidden" name="c_num" value="${chatDTO.c_num}" readonly>
		<input type="hidden" name="id" class="id" value="${sessionScope.id}"
			readonly> <input type="text" id="c_content" name="c_content"
			maxlength="1000" required style="width: 400px; margin-left: 20%;">
		<button type="submit" value="보내기" class="submit"
			style="background-color: #1842B6; color: white; border-radius: 20%;">전송</button>
	</form>


	<script>
$(document).ready(function() {
    function loadMessages() {
        const c_num = $('input[name="c_num"]').val(); // 채팅방 번호

        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/inc/chatting',
            data: { c_num },
            success: function(response) {
                const newMessages = Array.isArray(response) ? response : []; // 서버에서 반환된 새로운 메시지 목록
                const chatArea = $('#chat');
                const currentMessages = chatArea.find('.container'); // 현재 채팅창에 있는 메시지들

                // 필터링된 새로운 메시지 목록
                newMessages.forEach(message => {
                    if (!currentMessages.toArray().some(
                        elem => $(elem).find('.time-left').text() === message.c_time || $(elem).find('.time-right').text() === message.c_time)) {
                        const messageHtml = message.id === $('input[name="id"]').val()
                            ? `<div class="container darker">
                                  <p style="text-align: right;">${message.id}님</p>
                                  <p style="text-align: right;">${message.c_content}</p>
                                  <span class="time-right">${message.c_time}</span>
                               </div>`
                            : `<div class="container">
                                  <p>${message.id}님</p>
                                  <p>${message.c_content}</p>
                                  <span class="time-left">${message.c_time}</span>
                               </div>`;
                        chatArea.append(messageHtml);
                    }
                });

                window.scrollTo(0, document.body.scrollHeight); // 화면 스크롤을 아래로 이동
            },
            error: function(xhr, status, error) {
                console.error('메시지 로드 중 오류 발생:', error);
            }
        });
    }

    setInterval(loadMessages, 10000); // 주기적으로 메시지 목록 갱신 (10초마다 실행)

    loadMessages(); // 초기 메시지 로드 실행
});
</script>

</body>
</html>