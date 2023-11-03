<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인 아아디 찾기</title>
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
			<div class="lostId-box-center">
				<div class="lostId-box">
					<div class="lostId-text">아이디를 잊으셨나요?</div>
					<input type="text" class="input-lostId" id="lostIdNameInput" placeholder="이름을 입력해주세요">
					<input type="text" class="input-lostId" id="lostIdEmailInput" placeholder="이메일을 입력해주세요">
					
					<button type="button" class="button-lostId" id="findLostIdBtn">아이디 찾기</button>
					<div class="button-lostId-center">
						<a href="/user/join-view"><button class="button-lostId-join" type="button">회원가입</button></a>
						<a href="/user/lost/password-view"><button class="button-lostId-password" type="button">비밀번호 찾기</button></a>
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