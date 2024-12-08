<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공티 이력서</title>
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
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
</style>
</head>

<body>
	<jsp:include page="../inc/top.jsp" />
	<div id="border"></div>
	<div class="sidemenu-wrap"
		style="margin-left: -1660px; margin-top: 195px;">
		<div class="sidemenu">

			<button type="button" class="button button-update">
				<span
					onclick="location.href='${pageContext.request.contextPath}/board/searchCom'">프로젝트
					찾기</span>
			</button>
			<button type="button" class="button button-update"
				style="background-color: #1842B6;">
				<span style="color: black;"
					onclick="location.href='${pageContext.request.contextPath}/board/searchFree'">프리랜서
					찾기</span>
			</button>


		</div>

	</div>

	<div class="modal modal-spinner" role="dialog" aria-hidden="true"
		style="display: none;"></div>
	<div class="resume-view-page">
		<div class="resumeHeader"></div>
		<div class="resume-view-wrapper">
			<div class="resume-view-container">
				<div class="resume-subject">${resumeDTO.r_name}</div>


				<div id="profile" class="base profile">
					<div class="container">
						<div class="info-container">
							<div class="info-general">
								<div class="item name">${memberDTO.name}</div>
								<div class="item year"></div>
								<div class="item age">${resumeDTO.r_form}</div>
							</div>
							<div class="info-detail">
								<div class="item">
									<div class="label">연락처</div>
									<div class="value">${memberDTO.phone}</div>
								</div>
								<div class="item">
									<div class="label">E-mail</div>
									<div class="value">
										<a href="mailto:${memberDTO.email}">${memberDTO.email}</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="summary col-4" style="width: 960px;">
						<div class="list list-education">
							<div class="item">
								<div class="header">&nbsp;</div>
								<div class="description ellipsis">&nbsp;</div>
								<div class="options">
									<div class="option">&nbsp;</div>
									<div class="option">&nbsp;</div>
								</div>
							</div>
							<div class="item is-singleline newcomer">
								<div class="header">경력</div>
								<div class="description">${resumeDTO.r_career}년</div>
							</div>
							<div class="item is-singleline">
								<div class="header">보유 기술</div>
								<div class="description">${resumeDTO.r_tech}</div>
							</div>
							<div class="item">
								<div class="header">&nbsp;</div>
								<div class="description ellipsis">&nbsp;</div>
								<div class="description ellipsis">&nbsp;</div>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" id="r_num" name="r_num"
					value="${resumeDTO.r_num}" />


				<div id="skill" class="base skill">
					<div class="keyword-wrap">
						<h2 class="header">수행&middot;경험한 프로젝트</h2>
						<div class="list list-education">
							<div class="keyword-box">
								<div class="keyword-list">
									<div class="item" style="font-size: 140%; padding-left: 20px;">
										${resumeDTO.r_exp}</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div id="content" class="base skill">
					<div class="keyword-wrap">
						<h2 class="header">이력서 내용</h2>
						<div class="list list-education">
							<div class="keyword-box">
								<div class="keyword-list">
									<div class="item" style="font-size: 140%; padding-left: 20px;">
										${resumeDTO.r_content}</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="base hopework" id="js-hopeworkAnchor">
					<h2 class="header">희망근무조건</h2>
					<table class="table table-hopework">
						<caption>
							<span class="skip">희망근무조건</span>
						</caption>
						<tbody>
							<tr>
								<th scope="row" style="vertical-align: middle;">희망근무지</th>
								<td style="vertical-align: middle;">
									&nbsp;&nbsp;${resumeDTO.region}</td>
							</tr>
							<tr>
								<th scope="row" style="vertical-align: middle;">희망급여</th>
								<td style="vertical-align: middle;">&nbsp;&nbsp;${resumeDTO.r_salary}만원</td>
							</tr>
							<tr>
								<th scope="row" style="vertical-align: middle;">지원직종</th>
								<td style="vertical-align: middle;">&nbsp;&nbsp;${resumeDTO.field}
								</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div id="file" class="base certificate">
					<h2 class="header">첨부파일</h2>
					<div class="list list-certificate">
						<div class="item pdf-page-break">
							<div class="date"></div>
							<div class="content">
								<div class="content-header">
									<div class="name">
										<a
											href="${pageContext.request.contextPath}/resources/upload/${resumeDTO.r_file}"
											download>${resumeDTO.r_file} </a>
									</div>
									<div class="agency"></div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="sign">
					<div class="message">위의 모든 기재사항은 사실과 다름없음을 확인합니다.</div>

					<div class="writer">작성자 : ${memberDTO.name}</div>
					<div class="warning">
						<div class="description">
							위조된 문서를 등록하여 취업/구인활동에 이용 시 법적 책임을 지게 될 수 있습니다.<br> 공티는 기업과
							구직자가 등록한 문서에 대해 보증하거나 별도의 책임을 지지 않으며<br>첨부된 문서를 신뢰하여 발생한 법적
							분쟁에 책임을 지지 않습니다.<br> 또한 구인/구직 목적 외 다른 목적으로 이용시 공고/이력서 삭제 혹은
							비공개 조치가 될 수 있습니다.
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="sidemenu-wrap">
		<div class="sidemenu">
			<c:if test="${!empty sessionScope.id}">
				<c:if test="${sessionScope.id eq memberDTO.id}">
					<button type="button" class="button button-update">
						<span
							onclick="location.href='${pageContext.request.contextPath}/resume/resumeUpdate?r_num=${resumeDTO.r_num }'">이력서
							수정</span>
					</button>
					<button type="button" class="button button-update">
						<span
							onclick="location.href='${pageContext.request.contextPath}/resume/resumeDelete?r_num=${resumeDTO.r_num }'">이력서
							삭제</span>
					</button>

				</c:if>
			</c:if>
			<c:if test="${!empty sessionScope.id }">
				<c:if test="${sessionScope.type eq 1 }">
					<button type="button" class="button button-update" class="scrap"
						onclick="scrap()">
						<span
							onclick="location.href='${pageContext.request.contextPath}/resume/scrap?r_num=${resumeDTO.r_num}'">찜하기</span>
					</button>

					<form action="${pageContext.request.contextPath}/inc/insertChatPro"
						method="post">
						<input type="hidden" name="fid" value="${memberDTO.id}"> <input
							type="hidden" name="cid" value="${sessionScope.id}">
						<button type="submit" class="button button-update">
							<span>공T 쪽지 보내기</span>

						</button>

					</form>

				</c:if>
			</c:if>

			<div class="nav" role="navigation">
				<ul style="list-style: none;">
					<li onclick="location.href='#profile'"><button type="button"
							class="button button-nav">인적사항</button></li>
					<li onclick="location.href='#skill'"><button type="button"
							class="button button-nav">보유 기술</button></li>
					<li onclick="location.href='#content'"><button type="button"
							class="button button-nav">이력서 내용</button></li>
					<li onclick="location.href='#js-hopeworkAnchor'"><button
							type="button" class="button button-nav">희망근무조건</button></li>
					<li onclick="location.href='#file'"><button type="button"
							class="button button-nav">첨부파일</button></li>
				</ul>
			</div>
			<button type="button" class="button button-to-top"
				onclick="location.href='#top'">위로</button>
		</div>
	</div>


	<script>
		// let now = new Date();
		// let current = now.toLocaleString();
		// document.querySelector("#updateDate").innerHTML = current;

		//찜하기 완료되었을 때 알림창, 이미 찜하기를 눌렀을 경우 알림창
		// $(function(scrap){
		// 	$("#scrap").click(function(){
		// 		$.ajax({
		// 			url : {},
		// 			//data 수정
		// 			data : {'resumeDTO.r_num':$('resumeDTO.r_num').val()},
		// 			success : function(result){
		// 				if(result=="scrapDup"){
		// 					result = "이미 찜하신 목록입니다.";
		// 				} else{
		// 					result = "해당 글을 찜하였습니다.";
		// 				}
		// 				alert(result);
		// 			}

		// 		})
		// 	})
		// });

		function scrap() {
			alert('해당 글을 찜하였습니다.');
		}
	</script>
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>