<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 답변 페이지</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/layout/header.jsp" />
		<c:import url="/WEB-INF/jsp/layout/nav.jsp" />
		
		<section>
			<div class="qpost-detail-box-center">
				<div class="qpost-detail-box">
					<div class="qpost-detail-logo">질문게시판 - 관리자</div>
					
					<div class="qpost-detail-side">
						<div class="qpost-detail-text">작성자</div>
						<div class="writer">작성자 아이디 뿌려주기</div>
					</div>
					
					<div class="qpost-detail-side">
						<div class="qpost-detail-text">제목</div>
						<input id="qpostTitle" class="qpost-detail-title" type="text" value="${qpost.title}">
					</div>
					
					<c:if test="${not empty qpost.imagePath}">
						<img id="qpostFile" class="qpost-detail-file" src="${qpost.imagePath}">
					</c:if>
						
					<div class="qpost-detail-side">
						<div class="qpost-detail-text">내용</div>
						<textarea id="qpostContent" class="qpost-detail-content">${qpost.content}</textarea>
					</div>
					
					<div class="qpost-detail-side">
						<div class="qpost-detail-text">답변</div>
						<textarea id="qpostContent" class="qpost-detail-content"></textarea>
					</div>
					
					<input id="qpostAnswerFileInput" class="qpost-file" type="file">	
									
					<div class="qpost-detail-button-box">
							<div class="qpost-detail-button1">
								<a href="/qpost/list-view"><button class="button-qpost-list" type="button">목록으로</button></a>
							</div>
							
							<div class="qpost-detail-button2">
							<c:if test="${manager.userId == userId}">
								<button id="ManagerQpostModifyBtn" class="button-answer-modify" type="button" data-post-id="${qpost.id}">수정하기</button>
								<button id="ManagerAnswerSaveBtn" class="button-qpost-answer" type="button" data-post-id="${qpost.id}">답변달기</button>
							</c:if>
							</div>
					</div>	
				
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
	</div>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>