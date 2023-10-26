<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 글 쓰기</title>
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
			<div class="qpost-box-center">
				<div class="qpost-box">
				
					<div class="qpost-logo">질문 게시판 글쓰기</div>
					
					<div>
						<div class="qpost-text-box">
							<div class="qpost-text">작성자</div>
							<div class="writer">${userLoginId}</div>
						</div>
						
						<div class="qpost-text-box">
							<div class="qpost-text">제목</div>
							<input id="qpostTitleInput" class="qpost-title" type="text" placeholder="제목을 입력하세요">
						</div>
						
						<div class="qpost-text-box">
							<div class="qpost-text">내용</div>
							<textarea id="qpostContentInput" class="qpost-content" rows="8" placeholder="내용을 입력하세요."></textarea>
						</div>
						
						<input id="qpostFileInput" class="qpost-file" type="file">
						
						
						<div class="qpost-text-box">
							<label><input id="qpostSecret" class="qpost-secret" type="checkbox"> 비밀글 설정</label>
							<input id="qpostPasswordInput" class="qpost-password" type="password" placeholder="비밀번호를 입력하세요.">
						</div>
						
						<div class="qpost-button-box">
							<a href="/qpost/list-view"><button class="button-qpost-list" type="button">목록으로</button></a>
							<button id="completeBtn" class="button-qpost-complete" type="button">작성완료</button>
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
	
	// 비밀번호 input toggle
	$("#qpostSecret").on("click", function(){
		$(".qpost-password").toggle();
	});
	
	// 질문 글 저장
	$("#completeBtn").on("click", function(){
		
		let title  = $("#qpostTitleInput").val();
		let content = $("#qpostContentInput").val(); 
		let password = $("#qpostPasswordInput").val();
		
		let imageFile = $("#qpostFileInput")[0];
		
		// validation
		if (title == "") {
			alert("질문 제목을 입력하세요.");
			return;
		}
		
		if (content == "") {
			alert("질문 내용을 입력하세요.");
			return;
		}
		
		// formData
		let formData = new FormData();
		formData.append("title", title);
		formData.append("content", content);
		formData.append("password", password);
		formData.append("imageFile", imageFile.files[0]);
		
		$.ajax({
			type:"post"
			, url:"/qpost/create"
			, data:formData
			
			// 파일 업로드 필수 옵션
			, enctype:"multipart/form-data" 
			, processData:false  
			, contentType:false  	
			
			, success:function(data){
				if(data.result == "success"){
					alert("질문 글 작성 성공");
					location.href="/qpost/list-view"
				} else {
					alert("질문 글 작성 실패");
				}
			}
			, error:function(){
				alert("질문 글 작성 에러");
			}
		});
	});
});
</script>
</body>
</html>