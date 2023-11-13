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
			<div class="survey-age-box-center">
				<div class="survey-age-box">
					<div class="survey-age-text-center">
						<div class="survey-age-text">나이를 선택해 주세요</div>
					</div>
					
						<div class="survey-age-input-box">
							<label class="survey-age-input-text"><input type="radio" name="age" value="6" class="survey-age-input">6세 이하</label>
							<label class="survey-age-input-text"><input type="radio" name="age" value="7-18" class="survey-age-input">7~18세</label>
							<label class="survey-age-input-text"><input type="radio" name="age" value="19-64" class="survey-age-input">19~64세</label>
							<label class="survey-age-input-text"><input type="radio" name="age" value="65" class="survey-age-input">65세 이상</label>
						</div>
					
					<div class="survey-age-button-box">
						<button type="button" class="survey-age-button" id="surveyNextBtn">다음으로</button>
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
		$("#surveyNextBtn").on("click", function(){
			let age =  $('input[name="age"]:checked').val();
			
			// validation
			if($("input[name=age]").is(":checked") == false) {
			alert("나이를 체크해주세요");
			return;
		}
			location.href = "/survey/question1-view?age=" + age;
		});
	});
	</script>
</body>
</html>