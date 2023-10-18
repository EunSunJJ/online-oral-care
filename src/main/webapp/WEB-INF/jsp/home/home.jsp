<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/layout/header.jsp"/>
		<c:import url="/WEB-INF/jsp/layout/nav.jsp"/>
		
		<section>
			<div class="home">
				<div class="home-box">
					<img class="home-box_smile-tooth" src="/images/home-image.jpg" alt="홈 화면 이미지">
				</div>
				<div class="home-box">
					<div class="home-box-message">
						<span class="home-box-message-detail">구강관리가</span><br>
						<span class="home-box-message-detail">아직도 어렵다면</span><br>
						<span class="home-box-message-detail">함께해봐요!!</span>
					</div>
					<div class="home-box-join">
						<div class="home-box-join-image">
							<a class="home-box-join-anchor" href="/user/join-view" target="_self">
							<img class="home-box-join__broken-tooth" src="/images/broken-tooth.png" alt="아픈치아">
							</a>						
						</div>
						<div class="home-box-join-messages">
							<a class="home-box-join-anchor" href="/user/join-view" target="_self">
							<span class="home-box-join-message">회원가입 하고</span><br>
							<span class="home-box-join-message">구강건강 지키기</span>
							</a>
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