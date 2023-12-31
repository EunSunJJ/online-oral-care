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
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
					<button id="duplicateBtn" type="submit">중복확인</button>
					<div id="duplicateId">중복된 아이디 입니다</div>
					<div id="nonDuplicateId">사용가능한 아이디 입니다</div>
					<div id="loginIdCondition6">아이디를 6자 이상으로 입력하세요</div>
					<div id="loginIdCondition20">아이디를 20자 이하로 입력하세요</div>
					
					<div class="join-box-text">비밀번호</div>
					<input class="join-box-type" type="password" placeholder="비밀번호 입력" id="passwordInput">
					<i class="bi bi-eye-slash" id="hiddenPassowrd"></i>
					<i class="bi bi-eye" id="showPassword"></i>
					
					<div id="passwordInfo">대문자,소문자,숫자,특수문자 포함 8~20자를 입력하세요</div>
					<div id="possiblePassword">사용할 수 있는 비밀번호 입니다</div>
					<div id="impossiblePassword">사용할 수 없는 비밀번호 입니다</div>
					
					
					<div class="join-box-text">비밀번호 확인</div>
					<input class="join-box-type" type="password" placeholder="비밀번호 재입력" id="passwordCheckInput">			
				
					<div class="join-box-text">이름</div>
					<input class="join-box-type" type="text" placeholder="이름을 입력해주세요" id="nameInput">
					
					<div class="join-box-text">핸드폰번호</div>
					<div class="join-box-phone">
						<input class="join-box-phone-number" type="text" maxlength=3 placeholder="010" name="phoneNumber">
						<input class="join-box-phone-number" type="text" maxlength=4 placeholder="1234" name="phoneNumber">
						<input class="join-box-phone-number" type="text" maxlength=4 placeholder="5678" name="phoneNumber">
					</div>
					
					<div class="join-box-text">생년월일<i class="bi bi-cake"></i></div>
					<select class="select-year" name="birth">
							<option value="year" selected disabled hidden>년</option>
						<c:forEach var="year" begin="1920" end="2023">
							<option value="${year}">${year}년</option>
						</c:forEach>
					</select>
					
					<select class="select-month" name="birth">
							<option value="month" selected disabled hidden>월</option>
						<c:forEach var="month" begin="01" end="12">
							<option value="${month}">${month}월</option>
						</c:forEach>
					</select>
					
					<select class="select-day" name="birth">
							<option value="day" selected disabled hidden>일</option>
						<c:forEach var="day" begin="1" end="31">
							<option value="${day}">${day}일</option>
						</c:forEach>
					</select>
					
					<div class="join-box-text">본인확인 이메일</div>
					<div class="join-box-email">
						<input type="text" class="join-box-emailId" id="emailIdInput"> @
						<input type="text" class="join-box-domain" id="emailDomainInput">
						<select id="domainList">
							<option value="direct">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="kakao.com">kakao.com</option>
						</select>
						<button id="personalAuthenticationBtn" type="submit">본인인증</button>
					</div>
					
					<%--- 본인확인 번호인증 --%>
					<div class="join-box-personal-authentication">
						<input class="authentication-number" type="text" placeholder="인증번호를 입력하세요" id="authenticationInput">
						<button id="button-authentication-number" type="button">확인</button>
					</div>
					
					<div id="success-personal-authentication">본인인증이 완료되었습니다.</div>
					<div id="fail-personal-authentication">인증에 실패하였습니다. 다시인증하세요.</div>
					
					<button id="joinBtn" type="submit">회원가입</button>
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

	// 본인 확인 체크 여부
	var isVerify = false;
	
	// 비밀번호 validation 통과 여부
	var isAvailablePassword = false;
	
	// 아이디 중복 확인 체크 여부
	var isCheckDuplicate = false;
	
	// 중복된 아이디는 가입 불가능
	var isDuplicate = true;
	
	// 비밀번호 보여주는 기능
	$("#hiddenPassowrd").on("click", function(){
		
		let password = $("#passwordInput");
		let passwordType = password.attr("type");
		
		if (passwordType == "password") {
			
			password.attr("type", "text");
			$("#showPassword").show();
			$("#hiddenPassowrd").hide();
			
		}
	});
	
	// 비밀번호 숨기는 기능
	$("#showPassword").on("click", function(){

		let password = $("#passwordInput");
		let passwordType = password.attr("type");
		
		if (passwordType == "text") {
			
			password.attr("type", "password");
			$("#hiddenPassowrd").show();
			$("#showPassword").hide();
			
		}
	});
	
	// passwordInput에 변화가 생기면 다시 중복확인체크
	$("#passwordInput").on("input", function(){
		isAvailablePassword = false;
		
		// 안내 문구 초기화
		$("#possiblePassword").hide();
		$("#impossiblePassword").hide();
		
	});
	
	// loginIdInput에 변화가 생기면 다시 중복확인체크
	$("#loginIdInput").on("input", function(){
		isCheckDuplicate = false;
		isDuplicate = true;
		
		// 안내 문구 초기화
		$("#nonDuplicateId").hide();
		$("#duplicateId").hide();
		
	});
	
	// 로그인 아이디 중복확인
	$("#duplicateBtn").on("click", function(){
		
		// 경고 문구 초기화
		$("#loginIdCondition6").hide();
		$("#loginIdCondition20").hide();
		$("#duplicateId").hide();
		$("#nonDuplicateId").hide();
		
		let loginId = $("#loginIdInput").val();
		
		if(loginId == "") {
			alert("로그인 아이디를 입력하세요.");
			return;
		}
		
		// 로그인 아이디 조건 6~20자 사이
		if(loginId.length < 6) {
			$("#loginIdCondition6").show();
			return;
		}
		
		if(loginId.length > 20) {
			$("#loginIdCondition20").show();
			return;
		}
		
		$.ajax({
			type:"get"
				, url:"/user/duplicate-id"
				, data:{"loginId" : loginId}
				, success:function(data) {
					
					// 아이디 중복 확인 체크 여부 = true
					isCheckDuplicate = true;
					
					if(data.isDuplicate) {
					   // 중복 되었다.
						$("#duplicateId").show();
						$("#nonDuplicateId").hide();
				
					} else {
					   // 중복되지 않았다.
						$("#nonDuplicateId").show();
						$("#duplicateId").hide();
						
						isDuplicate = false;
					}
			}
				, error:function() {
					alert("중복확인 에러");
				}
		});
	});
	
	// email select값 emailDomainInput에 담기
	$("#domainList").on("change", function(){
		
		let emailDomain = $("#emailDomainInput").val();
		let domainList = $("#domainList").val();
		
		if (domainList == "direct") {
			 $("#emailDomainInput").attr("disabled", false); // 활성화
			 $("#emailDomainInput").val(""); 
			 
		} else {
			 $("#emailDomainInput").val(domainList);
			 $("#emailDomainInput").attr("disabled", true); // 비활성화
		}
	});

	
	
	// 회원가입 정보 저장 
	$("#joinBtn").on("click", function(){
		
		let loginId = $("#loginIdInput").val();
		let password = $("#passwordInput").val();
		let passwordCheck = $("#passwordCheckInput").val();
		let name = $("#nameInput").val();
		
		// phone number input 값이 여러개
		// 값 들의 갯수 -> 배열 길이를 지정
		var phoneNumberSize = $("input[name=phoneNumber]").length;
		// 배열 생성
		var phoneNumberArray = new Array(phoneNumberSize);
		// 배열에 값 넣기
		 for(let i = 0; i < phoneNumberSize; i++){
			 phoneNumberArray[i] = $("input[name=phoneNumber]").eq(i).val();
			  // alert(phoneNumberArray[i]);
		 }
		
		const strPhoneNumber = phoneNumberArray.join("");
		let phoneNumber = strPhoneNumber;

		
		// birthday select 값이 여러개
		var birthdaySize = $("select[name=birth]").length;
		var birthdayArray = new Array(birthdaySize);
		for(let j = 0; j < birthdaySize; j++) {
			birthdayArray[j] = $("select[name=birth]").eq(j).val();
			// alert(birthdayArray[j]);
		}
		
		const strBirthday = birthdayArray.join("");
		let birthday = strBirthday;
		
		// email 도메인 직접 입력 또는 domain option 선택
		let emailId = $("#emailIdInput").val();
		let emailDomain = $("#emailDomainInput").val();
		
		let email = emailId + "@" + emailDomain; 
		
		let authenticationNumber = $("#authenticationInput").val();
		
		// validation
		if(loginId == "") {
			alert("로그인 아이디를 입력하세요.");
			return;
		}
		
		// 아이디 중복 체크가 안된 경우
		if(!isCheckDuplicate) {
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		
		// 중복 된 아이디인 경우 가입 불가
		if(isDuplicate) {
			$("#loginIdInput").val("");
			$("#duplicateId").hide();
			alert("중복된 아이디 입니다.");
			
			return;
		}
		
		// 정규표현식으로 비밀번호 validation
		// (?=.*?[A-Z]) : A부터 Z까지 포함여부
		// (?=.*?[a-z]) : a부터 z까지 포함여부 
		// (?=.*?[0-9]) : 0부터 9까지 포함여부 
		// (?=.*?[~?!@#$%^&*_-]) : 특수기호 포함여부
		// .{8,20} : 8자 이상 20자 이하 (길이 8~20자)
		// ^ : 이걸로 시작해서  $ : 로 끝난다
		
		const passwordValidation =/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,20}$/;
		let passwordTest = passwordValidation.test(password);

		if(!passwordTest){
			$("#impossiblePassword").show();
			return;
		}
		
		if(passwordTest){
			isAvailablePassword = true;
			$("#possiblePassword").show();
			$("#impossiblePassword").hide();
			
		}
		
		if(password != passwordCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		if(name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if(phoneNumber.length < 11){
			alert("휴대폰 번호를 확인해주세요.");
			return;
		}
		
		if(birthday.length < 6 || birthday.length > 8){
			alert("생년월일을 확인해주세요.");
			return;
		}
		
		// 정규표현식으로 이메일주소 validation 
		// /i 정규표현식에 사용된 패턴이 대소문자를 구분하지 않도록 i를 사용
		// ^ 표시는 처음시작하는 부분부터 일치한다는 표시
		// [0-9a-zA-Z] 하나의 문자가 []안에 위치한 규칙을 따른다는 것으로 숫자와 알파벳 소문지 대문자인 경우
		// * 이 기호는 0또는 그 이상의 문자가 연속될 수 있음
		
		const emailValidation =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let emailTest = emailValidation.test(email);

		if(!emailTest){
			alert("이메일을 확인해주세요.");
			return;
		}
		
		if(authenticationNumber == "") {
			alert("인증번호를 입력하세요.");
			return;
		}
		
		// 본인 인증이 안된 경우
		if(!isVerify) {
			alert("본인인증를 해주세요.");
			return;
		}
		
		$.ajax({
			type:"post"
			, url:"/user/join"
			, data:{
				"loginId":loginId
				, "password":password
				, "name":name
				, "phoneNumber":phoneNumber
				, "birthday":birthday
				, "email":email
				, "authenticationNumber":authenticationNumber
				}
			, success:function(data){
				if(data.result == "success") {
					alert("회원가입 성공");
					location.href="/user/login-view"
				} else {
					alert("회원가입 실패");
				}
			}
			,error:function(){
				alert("회원가입 에러");
			}
		});
		
		
	});
	
	// authenticationInput에 변화가 생기면 다시 중복확인체크
	$("#authenticationInput").on("input", function(){
		isVerify = false;
		//isDuplicate = true;
		
		// 안내 문구 초기화
		$("#success-personal-authentication").hide();
		$("#fail-personal-authentication").hide();
		
	});
	
	// 본인인증 확인하기
	$("#button-authentication-number").on("click", function(){
		
		let checkNumber = $("#authenticationInput").val();
		
		if (checkNumber == "") {
			alert("인증번호를 입력하세요.");
			return;
		}
		
		//발송한 값이랑 checkNumber가 같으면 회원가입 진행
		$.ajax({
			type:"get"
			, url:"/user/ckeck/authentication-number"
			, data:{
				"checkNumber":checkNumber
				}
			, success:function(data){
				if (data.isSame) {
					
					// 본인인증 여부 = true
					isVerify = true;
					
					// 일치
					$("#success-personal-authentication").show();
					$("#fail-personal-authentication").hide();
				} else {
					// 불일치
					$("#fail-personal-authentication").show();
					$("#success-personal-authentication").hide();
				}
			}
			, error:function(){
				alert("본인확인 에러");
			}
		
			
		});
	});
	
	
	// 본인인증 메일 보내기
	$("#personalAuthenticationBtn").on("click", function(){
		
		// email 도메인 직접 입력 또는 domain option 선택
		let name = $("#nameInput").val();
		let emailId = $("#emailIdInput").val();
		let emailDomain = $("#emailDomainInput").val();
		
		let email = emailId + "@" + emailDomain; 
		
		// 정규표현식으로 이메일주소 validation 
		// /i 정규표현식에 사용된 패턴이 대소문자를 구분하지 않도록 i를 사용
		// ^ 표시는 처음시작하는 부분부터 일치한다는 표시
		// [0-9a-zA-Z] 하나의 문자가 []안에 위치한 규칙을 따른다는 것으로 숫자와 알파벳 소문지 대문자인 경우
		// * 이 기호는 0또는 그 이상의 문자가 연속될 수 있음
		
		const emailValidation =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let emailTest = emailValidation.test(email);

		if(!emailTest){
			alert("이메일을 확인해주세요.");
			return;
		}
		
		// 인증번호 입력칸 보여주기
		if(emailId != null && emailDomain != null) {
			$(".join-box-personal-authentication").show();
		}
		
		$.ajax({
			type:"post"
			, url:"/user/send/authentication-number"
			, data:{
				"name":name
				, "email":email
			}
			, success:function(data){
				if (data.result == "success") {
					alert("인증메일 발송 성공");
				} else {
					alert("인증메일 발송 실패");
				}
			}
			, error:function(){
				alert("인증메일 발송 에러");
			}
		});
		
	});
	
	// 핸드폰번호 입력 - 입력창에 정해진 자릿수를 입력하면 자동으로 다음으로 이동 
    $(".join-box-phone-number").keyup(function(){
        if (this.value.length == this.maxLength) {
          $(this).next('.join-box-phone-number').focus();
        }
    });
});
</script>
</body>
</html>