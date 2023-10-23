<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/jsp/layout/header.jsp" />
	<c:import url="/WEB-INF/jsp/layout/nav.jsp" />
	<section>
		<div class="login-box-center">
			<div class="login-box">
				<div class="login-input-box">
					<div class="login-box-text">로그인</div>
					<input id="loginIdInput" type="text" placeholder="아이디를 입력하세요" class="login-box-loginId">
					<input id="passwordInput" type="password" placeholder="비밀번호를 입력하세요" class="login-box-password">
					<button id="loginBtn" type="submit" class="botton-login">로그인</button>
					
					<div class="login-box-button-box">
						<a href="/user/join-view"><button type="button" class="link-join-manager">회원가입</button></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
	
<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	

</body>
</html>