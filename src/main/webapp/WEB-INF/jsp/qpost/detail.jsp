<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 글 상세보기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/layout/header.jsp" />
		<c:import url="/WEB-INF/jsp/layout/nav.jsp" />
		
		<section>
			<div class="qpost-detail-box-center">
			
				<div class="qpost-detail-box">
					<div class="qpost-detail-logo">질문게시판</div>
					
					<div class="qpost-detail-side">
						<div class="qpost-detail-text">작성자</div>
						<div class="writer">${userLoginId}</div>
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
					
					<!-- 답변 -->
					<c:if test="${not empty answer.content}">
						<div class="qpost-detail-side">
							<div class="qpost-detail-text">답변</div>
							<textarea id="qpostAnswer" class="qpost-detail-content">${answer.content}</textarea>
						</div>
	
						<div>
							<c:if test="${not empty answer.imagePath}">
								<img id="qpostAnswerFile" class="qpost-answer-file" src="${answer.imagePath}">
							</c:if>					
						</div>					
					</c:if>
					
					<div class="qpost-detail-button-box">
							<div class="qpost-detail-button1">
								<a href="/qpost/list-view"><button class="button-qpost-list" type="button">목록으로</button></a>
							</div>
							
							<div class="qpost-detail-button2">
							<c:if test="${qpost.userId == userId}">
								<button id="qpostDeleteBtn" class="button-qpost-delete" type="button" data-post-id="${qpost.id}">삭제하기</button>
								<button id="qpostModifyBtn" class="button-qpost-modify" type="button" data-post-id="${qpost.id}">수정하기</button>
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

<script>
$(document).ready(function(){
	
	// 질문 글 삭제하기
	$("#qpostDeleteBtn").on("click", function(){
		
		// id얻어오기 , data속성
		let postId = $(this).data("post-id");
		
		$.ajax({
			type:"delete"
			, url:"/qpost/delete"
			, data:{
					"id":postId
				}
			, success:function(data){
				if(data.result == "success") {
					alert("게시물 삭제 성공");
					location.href="/qpost/list-view"
				} else {
					alert("게시물 삭제 실패");
				}
			}
			, error:function(){
				alert("게시물 삭제 에러");
			}
			
		});
	});
	
	// 질문 글 수정하기
	$("#qpostModifyBtn").on("click", function(){
		
		let title = $("#qpostTitle").val();
		let content = $("#qpostContent").val();
		
		// id얻어오기 , data속성
		let postId = $(this).data("post-id");
		
		$.ajax({
			type:"put"
			, url:"/qpost/modify"
			, data:{
					"title":title,
					"content":content,
					"id":postId
				}
			, success:function(data){
				if(data.result == "success") {
					alert("게시물 수정 성공");
					location.href="/qpost/list-view"
				} else {
					alert("게시물 수정 실패");
				}
			}
			, error:function(){
				alert("게시물 수정 에러");
			}
			
		});
		
	});
});
</script>
</body>
</html>