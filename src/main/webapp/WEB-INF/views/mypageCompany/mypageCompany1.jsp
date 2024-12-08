<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<title>공티 마이페이지</title>
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

input {
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
</style>
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<div id="border"></div>
	<div class="sidemenu-wrap"
		style="margin-left: -1660px; margin-top: 195px;">
		<div class="sidemenu">

			<button type="button" class="button button-update"
				style="background-color: #1842B6;">
				<span style="color: white;">회원정보 수정</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany2'">
				<span>나의 프로젝트</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/project/projectWrite'">
				<span>프로젝트 등록</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany4'">
				<span>관심 프리랜서(찜)</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany5'">
				<span>쪽지 내역</span>
			</button>
			<button type="button" class="button button-update"
				onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany6'">
				<span>회원탈퇴</span>
			</button>

		</div>
	</div>
	<div class="modal modal-spinner" role="dialog" aria-hidden="true"
		style="display: none;"></div>
	<div class="resume-view-page">
		<div class="resumeHeader"></div>
		<div class="resume-view-wrapper">
			<br>
			<br>
			<div class="resume-view-container" style="height: 700px !important">
				<div class="resume-subject">회원정보 수정</div>
				<div>
					<p>비밀번호 입력 시, 이메일 및 연락처를 변경할 수 있습니다.</p>
				</div>

				<div class="summary col-4"></div>
				<div class="list list-education"></div>
				<br>
				<br>
				<br>
				<form action="${pageContext.request.contextPath}/updatePro"
					id="join" method="post">
					<fieldset>
						<h4>아이디</h4>
						<input type="text" name="id" class="id" value="${sessionScope.id}"
							readonly><br>
						<h4>회사명</h4>
						<input type="text" name="name" class="name"
							value="${sessionScope.name}" readonly><br>
						<h4>비밀번호</h4>
						<input type="password" name="pw" class="pw" maxlength="20"><br>
						<h4>이메일</h4>
						<input type="email" name="email" class="email" maxlength="50"
							value="${sessionScope.email}"> <input type="button"
							value="중복확인" class="dupemail"
							style="background-color: #1842B6; width: 100px; color: white;"><br>
						<sub>※이메일을 입력해주세요.</sub>
						<div class="dupdivemail"></div>
						<br>
						<h4>전화번호</h4>
						<input type="text" name="phone" class="phone" maxlength="13"
							value="${sessionScope.phone}"> <input type="button"
							value="중복확인" class="dupphone"
							style="background-color: #1842B6; width: 100px; color: white;"><br>
						<sub>※전화번호를 입력해주세요.</sub>
						<div class="dupdivphone"></div>
						<br> <input type="submit" value="수정하기" class="submit"
							style="background-color: #1842B6; color: white;">
					</fieldset>
				</form>


			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../inc/bottom.jsp" />
	<script type="text/javascript">
		$(function() {
			//이메일 중복 확인
			$(".dupemail").click(function() {
				$.ajax({
					url : '${pageContext.request.contextPath}/main/emailCheck',
					data : {
						'email' : $('.email').val()
					},
					success : function(result) {
						if (result == "emaildup") {
							result = "사용불가능한 이메일입니다.";
							$(".dupdivemail").css("color", "red");
						} else {
							result = "사용가능한 이메일입니다.";
							$(".dupdivemail").css("color", "green");
						}
						$('.dupdivemail').html(result);
					}
				});

			});

			//전화번호 중복 확인
			$(".dupphone").click(function() {
				$.ajax({
					url : '${pageContext.request.contextPath}/main/phoneCheck',
					data : {
						'phone' : $('.phone').val()
					},
					success : function(result) {
						if (result == "phonedup") {
							result = "사용불가능한 전화번호입니다.";
							$(".dupdivphone").css("color", "red")
						} else {
							result = "사용가능한 전화번호입니다.";
							$(".dupdivphone").css("color", "green")
						}
						$('.dupdivphone').html(result);
					}
				});

			});

		});

		//전화번호 하이픈
		$(".phone").on('keydown keyup', function() {
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