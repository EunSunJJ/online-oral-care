<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/layout/header.jsp" />
		<c:import url="/WEB-INF/jsp/layout/nav.jsp" />
		<section>
			<div class="join-box-center">
				<div class="join-box">
					<div class="join-box-kakao">
						<h2 class="join-box-logo">회원가입</h2>
						<a href="#"><img class="kakao" src="/images/kakao-logo.png" alt="카카오톡 로고"></a>
					</div>
					
					<div class="join-box-text">아이디</div>
					<input class="join-box-type" type="text" placeholder="아이디입력 (6~20자)">
					<button id="button-duplicate-id" type="submit">중복확인</button>
					<div id="duplicate-id">중복된 아이디 입니다</div>
					<div id="non-duplicate-id">사용가능한 아이디 입니다</div>
					
					<div class="join-box-text">비밀번호</div>
					<input class="join-box-type" type="password" placeholder="문자,숫자,특수문자 포함 8~20자">
					
					<div class="join-box-text">비밀번호 확인</div>
					<input class="join-box-type" type="password" placeholder="비밀번호 재입력">
					
					<div class="join-box-text">이름</div>
					<input class="join-box-type" type="text" placeholder="이름을 입력해주세요">
					
					<div class="join-box-text">핸드폰번호</div>
					<div class="join-box-phone">
						<input class="join-box-phone-number" type="text" maxlength=3 placeholder="010">
						<input class="join-box-phone-number" type="text" maxlength=4 placeholder="1234">
						<input class="join-box-phone-number" type="text" maxlength=4 placeholder="5678">
					</div>
					
					<div class="join-box-text">생년월일</div>
					<select class="select-year" name="year">
						<c:forEach var="year" begin="1920" end="2023">
							<option value="년" selected disabled hidden>년</option>
							<option value="${year}">${year}년</option>
						</c:forEach>
					</select>
					
					<select class="select-month" name="month">
						<c:forEach var="month" begin="01" end="12">
							<option value="월" selected disabled hidden>월</option>
							<option value="${month}">${month}월</option>
						</c:forEach>
					</select>
					
					<select class="select-day" name="day">
						<c:forEach var="day" begin="1" end="31">
							<option value="일" selected disabled hidden>일</option>
							<option value="${day}">${day}일</option>
						</c:forEach>
					</select>
					
					<div class="join-box-text">본인확인 이메일</div>
					<div class="join-box-email">
						<input class="join-box-type" type="text" placeholder="abcd @ gmail.net">
						<button id="button-personal-authentication" type="submit">본인인증하기</button>
					</div>
					
					<%--- 본인확인 번호인증 --%>
					<div class="join-box-personal-authentication">
						<input class="authentication-number" type="text" placeholder="인증번호를 입력하세요">
						<button id="button-authentication-number" type="submit">확인</button>
					</div>
					
					<div id="success-personal-authentication">본인인증이 완료되었습니다.</div>
					<div id="fail-personal-authentication">인증에 실패하였습니다. 다시인증하세요.</div>
					
					<button id="button-join" type="submit">회원가입</button>
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
$(document).ready(function() {
	// 핸드폰번호 입력 - 입력창에 정해진 자릿수를 입력하면 자동으로 다음으로 이동 
    $(".join-box-phone-number").keyup(function () {
        if (this.value.length == this.maxLength) {
          $(this).next('.join-box-phone-number').focus();
        }
    });
});
</script>
</body>
</html>