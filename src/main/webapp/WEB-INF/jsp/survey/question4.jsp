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
			<div class="survey-question-box-center">
				<div class="survey-question-box">
					<div class="survey-question-number-end">
						<div class="survey-question-number">4/5</div>
					</div>
					
					<div class="survey-question-text-center">
						<div class="survey-question-text">
							<div class="survey-question-text1">설탕이 함유된 간식을</div>
							<div class="survey-question-text2">하루에 2회 이하로 섭취하고 있나요?</div>
						</div>				
					</div>
					
						<div class="survey-question-input-box">
							<label class="survey-question-input-text"><input type="radio" name="question" value="true" class="survey-question-input">예</label>
							<label class="survey-question-input-text"><input type="radio" name="question" value="false" class="survey-question-input">아니오</label>
						</div>
					
					<div class="survey-question-button-box">
						<button type="submit" class="survey-question-button" id="surveyNextBtn">다음으로</button>
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
		
		// 다음버튼
		$("#surveyNextBtn").on("click", function(){
			
			let sugar =  $('input[name="question"]:checked').val();
			
			let getLink = location.search;
			let parameter = getLink;
			
			// validation
			if($("input[name=question]").is(":checked") == false) {
			alert("답변을 체크해주세요");
			return;
		}
			
			location.href = "/survey/question5-view" + parameter + "&sugar=" + sugar
		});
	});
	</script
</body>
</html>