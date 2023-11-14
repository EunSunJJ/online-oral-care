<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구강관리 점수 측정</title>
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
			<div class="survey-result-box-center">
				<div class="survey-result-box">
				
					<div class="survey-result-score-center">
						<div class="survey-result-score">
							<div class="survey-score-box">
								<div class="survey-score-text1">위험</div>
								<div class="survey-score">0~1점</div>
								
								<div class="survey-score-text2">주의</div>
								<div class="survey-score">2~3점</div>
								
								<div class="survey-score-text3">양호</div>
								<div class="survey-score">4~5점</div>
							</div>
							
							<div class="survey-result-text-center">
								<div class="survey-result-text">당신의 구강건강은</div>
							</div>
							<div class="survey-result-text-center">
								<div class="survey-result-text"><strong>${result}</strong>한 상태입니다.</div>
							</div>
						</div>
					</div>
					
					<div class="survey-text1-center">
						<div class="survey-text1">당신에게 맞는 구강관리 방법을 알아보세요.</div>
					</div>
					
					<div class="button-survey-result-center">
						<a href="/info/care-view"><button type="button" class="button-survey-result">알아보기</button></a>
					</div>
					
					<div class="survey-text2-center">
						<div class="survey-text2">구강건강 관리점수 측정 결과는 단순 참고용이며,</div>
					</div>
					
					<div class="survey-text2-center">
						<div class="survey-text2">정확한 평가를 위해서는 가까운 치과 방문을 권장합니다.</div>
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