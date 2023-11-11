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
						<div class="survey-question-number">5/5</div>
					</div>
					
					<div class="survey-question-text-center">
						<div class="survey-question-text">
							<div class="survey-question-text1">특별한 문제가 없어도</div>
							<div class="survey-question-text2">정기적으로 치과에 방문하고 있나요?</div>
						</div>				
					</div>
					
					<div class="survey-question-input-box">
						<label class="survey-question-input-text"><input type="radio" name="question" class="survey-question-input" value="true">예</label>
						<label class="survey-question-input-text"><input type="radio" name="question" class="survey-question-input" value="false">아니오</label>
					</div>
					
					<div class="survey-question-button-box">
						<a href="/survey/question4-view"><button type="button" class="survey-question-button">이전으로</button></a>
						<button type="button" class="survey-result-button" id="surveyResultBtn" data-user-id="${userId}">결과보기</button>
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
			$("#surveyResultBtn").on("click", function(){
				
				let userId = $(this).data("");
				let dentalClinic = $('input[name="question"]:checked').val();
				
				// validation
				if($("input[name=question]").is(":checked") == false) {
				alert("답변을 체크해주세요");
				return;
			}
				
				$.ajax({
					type:"post"
					, url:"/survey/answer"
					, data:{
						"userId":userId
						, "dentalClinic":dentalClinic
						}
					, success:function(data){
						if(data.result == "success") {
							alert("구강건강 관리점수 저장 성공");
							location.href="/survey/result-view"
						} else {
							alert("구강건강 관리점수 저장 실패");
						}
					}
					, error:function(){
						alert("구강건강 관리점수 저장 에러");
					}
				});
				
			});
		});
	</script>
</body>
</html>