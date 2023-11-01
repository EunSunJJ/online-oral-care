<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 화면</title>
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
			<div class="info-box-center">
				<div class="info-box">
					<div class="info-box-logo-center">
						<div class="info-box-logo">내 정보 수정하기</div>
						<div class="info-user-loginId">아이디 : ${userId}</div>
					</div>

					<div class="info-input-box">
						<div class="info-password-box">
							<input type="password" id="passwordInfoInput"
								class="input-info-password" placeholder="현재 비밀번호 확인 후 비밀번호 변경하기">
							<button id="passwordInfoCheckBtn" class="button-info-password" type="button">확인</button>
						</div>
						<input type="text" value="${user.name}" class="input-info" id="myInfoName">
						<input type="text" value="${user.phoneNumber}" class="input-info" id="myInfoPhoneNumber">
						<input type="text" value="${user.birthday}" class="input-info" id="myInfoBirthday">
						<input type="text" value="${user.email}" class="input-info" id="myInfoEmail">
					</div>

					<button id="myInfoModifyBtn" class="button-info-modify" type="button" data-id="${user.id}">내 정보 수정하기</button>
				</div>

			</div>
		</section>
		<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
	</div>
	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {

			// 내 정보 수정하기
			$("#myInfoModifyBtn").on("click", function() {
				let name = $("#myInfoName").val();
				let phoneNumber = $("#myInfoPhoneNumber").val();
				let birthday = $("#myInfoBirthday").val();
				let email = $("#myInfoEmail").val();
				
				// id얻어오기 , data속성
				let id = $(this).data("id");
				
				$.ajax({
					type:"put"
					, url:"/user/modify/myInfo"
					, data:{
						"name":name
						, "phoneNumber":phoneNumber
						, "birthday":birthday
						, "email":email
						, "id":id
						}
					, success:function(data){
						if(data.result == "success") {
							alert("정보 수정 성공");
							location.reload();
						} else {
							alert("정보 수정 실패");
						}
					}
					, error:function(){
						alert("정보 수정 에러");
					}
				});
				
			});
		});
	</script>
</body>
</html>