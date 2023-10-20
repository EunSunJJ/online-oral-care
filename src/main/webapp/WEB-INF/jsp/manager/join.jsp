<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 가입하기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
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
						<a href="#"><img class="kakao" src="/static/images/kakao-logo.png" alt="카카오톡 로고"></a>
					</div>
					
					<div class="join-box-text">아이디</div>
					<input class="join-box-type" type="text" placeholder="아이디입력 (6~20자)" id="loginIdInput">
					<button id="button-duplicate-id" type="submit">중복확인</button>
					<div id="duplicate-id">중복된 아이디 입니다</div>
					<div id="non-duplicate-id">사용가능한 아이디 입니다</div>
					
					<div class="join-box-text">비밀번호</div>
					<input class="join-box-type" type="password" placeholder="문자,숫자,특수문자 포함 8~20자" id="passwordInput">
					
					<div class="join-box-text">비밀번호 확인</div>
					<input class="join-box-type" type="password" placeholder="비밀번호 재입력" id="passwordCheckInput">
					
					<div class="join-box-text">이름</div>
					<input class="join-box-type" type="text" placeholder="이름을 입력해주세요" id="nameInput">
					
					<div class="join-box-text">본인확인 이메일</div>
					<div class="join-box-email">
						<input class="join-box-type" type="text" placeholder="abcd @ gmail.net" id="emailInput">
						<button id="button-personal-authentication" type="submit">본인인증하기</button>
					</div>
					
					<%--- 본인확인 번호인증 --%>
					<div class="join-box-personal-authentication">
						<input class="authentication-number" type="text" placeholder="인증번호를 입력하세요" id="authenticationInput">
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
$(document).ready(function(){
	// 로그인 아이디 중복확인
	$("#button-duplicate-id").on("click", function(){
		let loginId = $("#loginIdInput").val();
		
		if(loginId == "") {
			alert("로그인 아이디를 입력하세요.");
			return;
		}
		
		$.ajax({
			type:"get"
				, url:"/manager/duplicate-id"
				, data:{"loginId" : loginId}
				, success:function(data) {
					if(data.isDuplicate) {
					   // 중복 되었다.
						$("#duplicate-id").show();
						$("#non-duplicate-id").hide();
				
					} else {
					   // 중복되지 않았다.
						$("#non-duplicate-id").show();
						$("#duplicate-id").hide();
					}
			}
				, error:function() {
					alert("중복확인 에러");
				}
		});
	});
	
	// 본인인증 input 보여주기
	$("#button-personal-authentication").on("click", function(){
		$(".join-box-personal-authentication").show(); // display 속성을 block 으로 바꾼다.
	});
	
	// 회원가입 정보 저장
	$("#button-join").on("click", function(){
		
		let loginId = $("#loginIdInput").val();
		let password = $("#passwordInput").val();
		let passwordCheck = $("#passwordCheckInput").val();
		let name = $("#nameInput").val();
		let email = $("#emailInput").val();
		let authenticationNumber = $("#authenticationInput").val();
		

		// validation
		if(loginId == "") {
			alert("로그인 아이디를 입력하세요.");
			return;
		}
		
		if(password == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		if(password != passwordCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		if(name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if(email == "") {
			alert("이메일 주소를 입력하세요.");
			return;
		}
		
		if(authenticationNumber == "") {
			alert("인증번호를 입력하세요.");
			return;
		}
		
		$.ajax({
			type:"post"
			, url:"/manager/join"
			, data:{
				"loginId":loginId
				, "password":password
				, "name":name
				, "email":email
				, "authenticationNumber":authenticationNumber
				}
			, success:function(data){
				if(data.result == "success") {
					alert("회원가입 성공");
					//location.href="/manager/login-view"
				} else {
					alert("회원가입 실패");
				}
			}
			,error:function(){
				alert("회원가입 에러");
			}
		});
		
		
	});

});
</script>
</body>
</html>