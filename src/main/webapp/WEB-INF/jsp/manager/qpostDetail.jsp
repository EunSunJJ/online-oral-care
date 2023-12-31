
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
						<div class="writer">${qpost.writer}</div>
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
						<textarea id="qpostAnswer" class="qpost-detail-content">${qpostAnswer.content}</textarea>
					</div>

					<div>
						<c:if test="${not empty qpostAnswer.imagePath}">
							<img id="qpostAnswerFile" class="qpost-answer-file" src="${qpostAnswer.imagePath}">
						</c:if>					
					</div>
					<input id="qpostAnswerFileInput" class="qpost-file" type="file">	
									
					<div class="qpost-detail-button-box">
							<div class="qpost-detail-button1">
								<a href="/manager/qpost/list-view"><button class="button-qpost-list" type="button">목록으로</button></a>
							</div>
							
							<div class="qpost-detail-button2">
								<c:if test="${qpostAnswer.managerId == managerId}">
									<button id="ManagerAnswerModifyBtn" class="button-answer-modify" type="button" data-post-id="${qpost.id}">수정하기</button>
								</c:if>
								<button id="ManagerAnswerSaveBtn" class="button-qpost-answer" type="button" data-post-id="${qpost.id}" data-manager-id="${managerId}">답변달기</button>
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
		
			// 답변 수정하기
			$("#ManagerAnswerModifyBtn").on("click", function(){
				let answer = $("#qpostAnswer").val();
				// postId 얻어오기
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"put"
					, url:"/manager/answer/qpost-modify"
					, data:{
						"content":answer
						, "postId":postId
						}
					, success:function(data){
						if (data.result == "success") {
							alert("답변 수정 성공");
							location.reload();
						} else {
							alert("답변 수정 실패");
						}
					}
					, error:function(){
						alert("답변 수정 에러");
					}
				});
				
				
			});
				
		
		
			// 답변 작성하기
			$("#ManagerAnswerSaveBtn").on("click", function(){
				
				let answer = $("#qpostAnswer").val();
				// id얻어오기 , data속성
				let managerId = $(this).data("manager-id");
				let postId = $(this).data("post-id");
				
				let imageFile = $("#qpostAnswerFileInput")[0];
				
				// validation
				if (answer == "") {
					alert("답변을 입력하세요");
					return;
				}
				
				// formData
				let formData = new FormData();
				formData.append("postId", postId);
				formData.append("content", answer);
				formData.append("managerId", managerId);
				formData.append("imageFile", imageFile.files[0]);
				
				$.ajax({
					type:"post"
					, url:"/manager/answer/qpost"
					, data:formData
					
					// 파일 업로드 필수 옵션
					, enctype:"multipart/form-data" 
					, processData:false  
					, contentType:false  
					
					, success:function(data){
						if(data.result == "success") {
							alert("답변 저장 성공");
							location.reload();
						} else {
							alert("답변 저장 실패");
						}
					}
					, error:function(){
						alert("답변 저장 에러");
					}
				});
			});
		});
	</script>
</body>
</html>