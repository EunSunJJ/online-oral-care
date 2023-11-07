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

					<form method="post" action="/user/private-survey">
						<h5>1. 전신질환 유무</h5>
					   	<label><input type="checkbox" name="disease" value="bloodPressure"> 고(저)혈압 </label>
					    <label><input type="checkbox" name="disease" value="diabetes"> 당뇨 </label>
					    <label><input type="checkbox" name="disease" value="osteoporosis"> 골다공증 </label>
					    <label><input type="checkbox" name="disease" value="heart"> 심장질환 </label>
					    <label><input type="checkbox" name="disease" value="liver"> 간질환 </label>
					    <label><input type="checkbox" name="disease" value="kidney"> 신장질환 </label>
					    <label><input type="checkbox" name="disease" value="hemorrhagic"> 출혈성질환 </label>
					    <label><input type="checkbox" name="disease" value="mental"> 정신질환 </label>
					    <label><input type="checkbox" name="disease" value="etc"> 기타 </label>
					    <label><input type="checkbox" name="disease" value="none"> 해당사항 없음 </label>
					</form>

					<br>						
					<form method="post" action="/user/private-survey">
						<h5>2. 먹는 약 유무</h5>
					   	<label><input type="checkbox" name="medicine" value="yes"> 있다 </label>
					    <label><input type="checkbox" name="medicine" value="no"> 없다 </label>
					</form>
					
					<br>
					<form method="post" action="/user/private-survey">
						<h5>3. 약물 알러지 유무</h5>
					   	<label><input type="checkbox" name="drugAllergy" value="yes"> 있다 </label>
					    <label><input type="checkbox" name="drugAllergy" value="no"> 없다 </label>
					</form>
					
					<br>
					<form method="post" action="/user/private-survey">
						<h5>4. 마지막 치과 방문일</h5>
					    <label><input type="checkbox" name="lastDentalClinic" value="1yearOver"> 1년 이상 </label>
					    <label><input type="checkbox" name="lastDentalClinic" value="1year"> 1년 이내 </label>
					    <label><input type="checkbox" name="lastDentalClinic" value="6month"> 6개월이내 </label>
					    <label><input type="checkbox" name="lastDentalClinic" value="none"> 기억나지 않는다 </label>
					</form>	
					
					<br>
					<form method="post" action="/user/private-survey">
						<h5>4. 현재 불편한 점</h5>
					    <label><input type="checkbox" name="discomfort" value="teeth"> 치아 </label>
					    <label><input type="checkbox" name="discomfort" value="gum"> 잇몸 </label>
					    <label><input type="checkbox" name="discomfort" value="chin"> 턱 </label>
					    <label><input type="checkbox" name="discomfort" value="externalInjury"> 외상 </label>
					    <label><input type="checkbox" name="discomfort" value="etc"> 기타 </label>
					    <label><input type="checkbox" name="discomfort" value="none"> 불편한 점 없음 </label>
					</form>	
					
					<br>					
					<form method="post" action="/user/private-survey">
						<h5>5. 치과 추천을 원하신다면 거주지를 선택해주세요</h5>
					   	<label><input type="checkbox" name="address" value=""> 안성 </label>
					    <label><input type="checkbox" name="address" value=""> 평택 </label>
					    <label><input type="checkbox" name="address" value=""> 화성 </label>
					    <label><input type="checkbox" name="address" value=""> 오산 </label>
					    <label><input type="checkbox" name="address" value=""> 수원 </label>
					    <label><input type="checkbox" name="address" value=""> 용인 </label>
					    <label><input type="checkbox" name="address" value=""> 이천 </label>
					    <label><input type="checkbox" name="address" value=""> 여주 </label>
					    <label><input type="checkbox" name="address" value=""> 광주 </label>
					    <label><input type="checkbox" name="address" value=""> 성남 </label>
					    <label><input type="checkbox" name="address" value=""> 의왕 </label>
					    <label><input type="checkbox" name="address" value=""> 군포 </label>
					    <label><input type="checkbox" name="address" value=""> 안산 </label>
					    <label><input type="checkbox" name="address" value=""> 군포 </label>
					    <label><input type="checkbox" name="address" value=""> 안양 </label>
					    <label><input type="checkbox" name="address" value=""> 시흥 </label>
					    <label><input type="checkbox" name="address" value=""> 광명 </label>
					    <label><input type="checkbox" name="address" value=""> 과천 </label>
					    <label><input type="checkbox" name="address" value=""> 시흥 </label>
					    <label><input type="checkbox" name="address" value=""> 부천 </label>
					    <label><input type="checkbox" name="address" value=""> 하남 </label>
					    <label><input type="checkbox" name="address" value="none"> 추천을 원하지 않는다 </label>
					</form>
					
					<br>
					<input type="submit" value="제출하기" class="button-private-survey"> 
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
		
		//  체크박스 중복 체크 방지 - 치과 추천을 원하신다면 거주지 선택
		$('input[type="checkbox"][name="address"]').on("click", function(){
			
			if ($(this).prop("checked")){
				 $('input[type="checkbox"][name="address"]').prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
		
		//  체크박스 중복 체크 방지 - 마지막 치과 방문일
		$('input[type="checkbox"][name="lastDentalClinic"]').on("click", function(){
			
			if ($(this).prop("checked")){
				 $('input[type="checkbox"][name="lastDentalClinic"]').prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
		
		//  체크박스 중복 체크 방지 - 약물 알러지 유무
		$('input[type="checkbox"][name="drugAllergy"]').on("click", function(){
			
			if ($(this).prop("checked")){
				 $('input[type="checkbox"][name="drugAllergy"]').prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
		
		//  체크박스 중복 체크 방지 - 먹는 약 유무
		$('input[type="checkbox"][name="medicine"]').on("click", function(){
			
			if ($(this).prop("checked")){
				 $('input[type="checkbox"][name="medicine"]').prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
	});
	</script>
</body>
</html>