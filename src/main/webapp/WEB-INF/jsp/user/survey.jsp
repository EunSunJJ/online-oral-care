<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사적인 구강관리 문진표</title>
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
			<div class="online-survey-box-center">
				<div class="online-survey-box">
					<div class="online-survey-text">온라인 문진표</div>

					<form method="get" action="form-action.html">
						<h5>1. 전신질환 유무</h5>
					   	<label><input type="checkbox" name="color" value="blue"> Blue</label>
					    <label><input type="checkbox" name="color" value="red"> Red</label>
					    <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
					</form>
					
					<form method="get" action="form-action.html">
						<h5>2. 먹는 약 유무</h5>
					   	<label><input type="checkbox" name="color" value="blue"> Blue</label>
					    <label><input type="checkbox" name="color" value="red"> Red</label>
					    <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
					</form>
					
					<form>
						<h5>3. 마지막 치과 방문일</h5>
						<p><input type="text"></p>
					</form>	
					
					<form>
						<h5>4. 현재 불편한 곳</h5>
						<p><input type="text"></p>
					</form>	
										
					<form method="get" action="form-action.html">
						<h5>5. 치과 추천을 원하신다면 거주지를 선택해주세요</h5>
					   	<label><input type="checkbox" name="color" value="blue"> Blue</label>
					    <label><input type="checkbox" name="color" value="red"> Red</label>
					    <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
					</form>
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