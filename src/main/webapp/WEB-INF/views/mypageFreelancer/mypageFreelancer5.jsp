<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<title>공티 마이페이지</title>

<script>
    let socket;
    
    // WebSocket 연결 함수
    function connectChat(num) {
        socket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/your-websocket-endpoint?chatId=" + num);

        // WebSocket 열리면
        socket.onopen = function() {
            console.log("WebSocket 연결됨");
        };

        // WebSocket 메시지 받으면
        socket.onmessage = function(event) {
            let message = event.data;
            document.getElementById("chatArea").innerHTML += "<p>" + message + "</p>";
        };

        // WebSocket 에러 발생 시
        socket.onerror = function(error) {
            console.log("WebSocket 오류:", error);
        };

        // WebSocket 연결 종료 시
        socket.onclose = function() {
            console.log("WebSocket 연결 종료");
        };
    }

    // 메시지 전송 함수
    function sendMessage() {
        const message = document.getElementById("messageInput").value;
        socket.send(message);
        document.getElementById("messageInput").value = ""; // 메시지 입력란 초기화
    }

    // 팝업을 열고 WebSocket 연결 시작
    function popUp(num) {
        const chatWindow = window.open("${pageContext.request.contextPath}/inc/chatting?c_num=" + num, "", "width=800px, height=700px, left=600px, top=150px");

        // 채팅 팝업 페이지가 로드되면 WebSocket 연결 시작
        chatWindow.onload = function() {
            connectChat(num); // 채팅 연결 시작
        };
    }
</script>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
button {
    padding: 0;
    margin: 0;
    font-size: 12.5px;
    letter-spacing: 0px;
    border: 0 none;
    vertical-align: middle;
    overflow: visible;
    background: transparent;
    cursor: pointer;
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

#chatArea {
    height: 400px;
    overflow-y: auto;
    border: 1px solid #ccc;
    padding: 10px;
    margin-top: 10px;
}

#messageInput {
    width: 80%;
    padding: 10px;
}

#sendButton {
    width: 15%;
    padding: 10px;
    cursor: pointer;
}
</style>
</head>
<body>

<div id="border"></div>
<div class="sidemenu-wrap" style="margin-left: -1660px; margin-top: 195px;">
    <div class="sidemenu">
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer1'">
            <span>회원정보 수정</span>
        </button>
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer2'">
            <span>나의 이력서</span>
        </button>
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/resume/resumeWrite'">
            <span>이력서 등록</span>
        </button>
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer4'">
            <span>관심 프로젝트(찜)</span>
        </button>
        <button type="button" class="button button-update" style="background-color: #1842B6;">
            <span style="color: white;">쪽지 내역</span>
        </button>
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageFreelancer/mypageFreelancer6'">
            <span>회원탈퇴</span>
        </button>
    </div>
</div>

<div class="resume-view-page">
    <div class="resumeHeader"></div>
    <div class="resume-view-wrapper">
        <br><br>
        <div class="resume-view-container" style="height: 700px !important">
            <div class="resume-subject" style="text-align: center !important;">마이 페이지(프리랜서)</div>

            <fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;">
                <table class="table">
                    <tr style="background-color: transparent !important;">
                        <td style="font-size: 20px !important; color: black; text-align: center !important;">보낸사람</td>
                        <td style="font-size: 20px !important; color: black; text-align: center !important;">받은내용</td>
                        <td style="font-size: 20px !important; color: black; text-align: center !important;">시간</td>
                        <td style="font-size: 20px !important; color: black; text-align: center !important;">매칭 여부</td>
                        <th style="font-size: 20px !important; color: black; text-align: center !important;">전체 쪽지</th>    
                    </tr>
                    <c:set var="lastChat" value="" />
                    <c:forEach var="chattingDTO" items="${chattingDTOListF}">
                        <c:if test="${chattingDTO.cid eq chattingDTO.id}">
                            <!-- 같은 사람끼리의 메시지라면 처리 -->
                            <c:choose>
                                <c:when test="${lastChat == '' || chattingDTO.c_time > lastChat.c_time}">
                                    <!-- 최신 메시지만 출력 -->
                                    <tr>
                                        <td style="text-align: center !important;">${chattingDTO.cid}</td>
                                        <td style="text-align: center !important;">${chattingDTO.c_content}</td>
                                        <td style="text-align: center !important;">${chattingDTO.c_time}</td>
                                        <c:if test="${chattingDTO.c_matching eq 0}">
                                            <td style="text-align: center !important;">미매칭</td>
                                        </c:if>
                                        <c:if test="${chattingDTO.c_matching eq 1}">
                                            <td style="text-align: center !important;">매칭 완료</td>
                                        </c:if>
                                        <td style="text-align: center !important;">
                                            <button onclick="popUp(${chattingDTO.c_num});"><b>확인</b></button>
                                        </td>
                                    </tr>
                                    <c:set var="lastChat" value="${chattingDTO}" /> <!-- 최신 메시지로 lastChat 업데이트 -->
                                </c:when>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </table>
            </fieldset>
        </div>
    </div>
</div>

<jsp:include page="../inc/bottom.jsp" />
</body>
</html>
