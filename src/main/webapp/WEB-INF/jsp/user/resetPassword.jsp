<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 비밀번호 재설정</title>
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
			<div class="resetPassword-box-center">
				<div class="resetPassword-box">
					<div class="resetPassword-text">비밀번호 재설정하기</div>
					<input type="password" class="input-resetPassword" id="newPasswordInput" placeholder="새로운 비밀번호 입력 (문자,숫자,특수문자포함 8~20자)">
					<input type="password" class="input-resetPassword" id="newPasswordCkInput" placeholder="비밀번호를 한번 더 입력해주세요">
					
					<button type="button" class="button-newPassword" id="newPasswordSaveBtn" data-login-id="${userLoginId}">비밀번호 저장하기</button>
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
		
		$("#newPasswordSaveBtn").on("click", function(){

			let newPassword = $("#newPasswordInput").val();
			let newPasswordCheck = $("#newPasswordCkInput").val();
			let loginId = $(this).data("login-id");
			
			// validation
			if (newPassword == "") {
				alert("새로운 비밀번호를 입력하세요");
				return;
			}
			
			if (newPassword != newPasswordCheck) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			$.ajax({
				type:"put"
				, url:"/user/modify/password"
				, data:{
					"newPassword":newPassword
					, "loginId":loginId
					}
				, success:function(data){
					if (data.result == "success"){
						alert("비밀번호 변경 성공");
						location.href="/user/myInfo-view"
					} else {
						alert("비밀번호 변경 실패");
					}
				}
				, error:function(){
					alert("비밀번호 변경 에러");
				}
			});
		});
	});
	</script>
</body>
</html>