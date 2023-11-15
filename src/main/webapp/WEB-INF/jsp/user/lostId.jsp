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
						<input type="text" class="input-lostId" id="lostIdNameInput" placeholder="이름 입력하기" name="name">
						
						<input type="text" class="lostId-email" id="emailIdInput" placeholder="이메일 입력하기"> @
						<input type="text" class="lostId-domain" id="emailDomainInput">
						<select id="domainList">
							<option value="direct">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="kakao.com">kakao.com</option>
						</select>
						
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

	<script>
		$(document).ready(function(){
			
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
			
			// 아이디 찾기 버튼 이벤트 - 아이디 찾는 쿼리
			$("#findLostIdBtn").on("click", function(){
				
				let name = $("#lostIdNameInput").val();
				
				// email 도메인 직접 입력 또는 domain option 선택
				let emailId = $("#emailIdInput").val();
				let emailDomain = $("#emailDomainInput").val();
				
				let email = emailId + "@" + emailDomain; 
				
				// validation
				if(name == "") {
					alert("이름을 입력하세요");
					return;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/find/id"
					, data:{
						"name":name
						, "email":email
						}
					, success:function(data){
						if (data.result == "success") {
							alert("아이디 찾기 성공");
							location.href="/user/find/loginId-view?name=" + name + "&email=" + email
						} else {
							alert("회원정보가 없습니다.");
						}
					}
					, error:function(){
						alert("아이디 찾기 에러");
					}
					
				});
			});
		});
	</script>
</body>
</html>