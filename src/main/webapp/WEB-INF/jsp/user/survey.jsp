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
			<div class="print-icon"><i class="bi bi-printer" id="printIcon"></i></div>
			
			<div class="online-survey-box-center">
				<div class="online-survey-box" id="printArea">
					<div class="online-survey-text">온라인 문진표</div>

					<div class="disease-input-box">
						<h5>1. 전신질환 유무 <i class="bi bi-heart-pulse"></i></h5>
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
					</div>

					<br>						
					<div class="medicine-input-box">
						<h5>2. 먹는 약 유무 <i class="bi bi-capsule"></i></h5>
					   	<label><input type="checkbox" name="medicine" value="yes"> 있다 </label>
					    <label><input type="checkbox" name="medicine" value="no"> 없다 </label>
					</div>
					
					<br>
					<div class="drugAllergy-input-box">
						<h5>3. 약물 알러지 유무 <i class="bi bi-capsule"></i></h5>
					   	<label><input type="checkbox" name="drugAllergy" value="yes"> 있다 </label>
					    <label><input type="checkbox" name="drugAllergy" value="no"> 없다 </label>
					</div>
					
					<br>
					<div class="lastDentalClinic-input-box">
						<h5>4. 마지막 치과 방문일</h5>
					    <label><input type="checkbox" name="lastDentalClinic" value="1yearOver"> 1년 이상 </label>
					    <label><input type="checkbox" name="lastDentalClinic" value="1year"> 1년 이내 </label>
					    <label><input type="checkbox" name="lastDentalClinic" value="6month"> 6개월이내 </label>
					    <label><input type="checkbox" name="lastDentalClinic" value="none"> 기억나지 않는다 </label>
					</div>	
					
					<br>
					<div class="discomfort-input-box">
						<h5>4. 현재 불편한 점</h5>
					    <label><input type="checkbox" name="discomfort" value="teeth"> 치아 </label>
					    <label><input type="checkbox" name="discomfort" value="gum"> 잇몸 </label>
					    <label><input type="checkbox" name="discomfort" value="chin"> 턱 </label>
					    <label><input type="checkbox" name="discomfort" value="externalInjury"> 외상 </label>
					    <label><input type="checkbox" name="discomfort" value="etc"> 기타 </label>
					    <label><input type="checkbox" name="discomfort" value="none"> 불편한 점 없음 </label>
					</div>	
					
					<br>					
                    <div class="address-input-box">				
						<h5>5. 치과 추천을 원하신다면 거주지를 선택해주세요</h5>
					    <label><input type="checkbox" name="address" value="화성시"> 화성 </label>
					    <label><input type="checkbox" name="address" value="오산시"> 오산 </label>
					    <label><input type="checkbox" name="address" value="수원시"> 수원 </label>
					    <label><input type="checkbox" name="address" value="이천시"> 이천 </label>
					    <label><input type="checkbox" name="address" value="안산시"> 안산 </label>
					    <label><input type="checkbox" name="address" value="과천시"> 과천 </label>
					    <label><input type="checkbox" name="address" value="none"> 추천을 원하지 않는다 </label>
					</div>
					
					<br>
				</div>
			</div>	
					<button type="button" class="button-private-survey" id="privateSurveySubmitBtn" data-user-id="${userId}">제출하기</button>
		</section>
		<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
	</div>
	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
	$(document).ready(function(){
		
		// 프린트 기능 printArea
		$("#printIcon").on("click", function(){
			
			var initBody = document.body.innerHTML; //body영역 저장
			
			window.onbeforeprint = function () { //프린터 출력 전 이벤트
				document.body.innerHTML = document.getElementById('printArea').innerHTML; //원하는 영역 지정 'div_print'
			}
			window.onafterprint = function () { //프린터 출력 후 이벤트
				document.body.innerHTML = initBody;
			}
			window.print();
		
		});
		
		// 설문지 제출하기
		$("#privateSurveySubmitBtn").on("click", function(){
			
			// session으로 얻은 값
			let userId = $(this).data("user-id");
			// 단일선택
			let medicine = $("input[type=checkbox][name=medicine]:checked").val();
			let drugAllergy = $("input[type=checkbox][name=drugAllergy]:checked").val();
			let lastDentalClinic = $("input[type=checkbox][name=lastDentalClinic]:checked").val();
			let address = $("input[type=checkbox][name=address]:checked").val();
			
			// 다중선택 체크박스 값 가져오기
			let diseaseArr = new Array();
			$("input[name=disease]:checked").each(function(){
				let disease = $(this).val();
				diseaseArr.push(disease);
			});	
			let diseaseStr = diseaseArr.join(",");
			
			let discomfortArr = new Array();
			$("input[name=discomfort]:checked").each(function(){
				let discomfort = $(this).val();
				discomfortArr.push(discomfort);
			});	
			let discomfortStr = discomfortArr.join(",");
			
			
			// validation - 선택 여부 확인 true/false
			if($("input[name=disease]").is(":checked") == false) {
				alert("전신질환을 체크해주세요");
				return;
			}
			
			if($("input[name=medicine]").is(":checked") == false) {
				alert("먹는 약 여부를 체크해주세요");
				return;
			}
			
			if($("input[name=drugAllergy]").is(":checked") == false) {
				alert("약물 알러지 여부를 체크해주세요");
				return;
			}
			
			if($("input[name=lastDentalClinic]").is(":checked") == false) {
				alert("마지막 치과 방문일을 체크해주세요");
				return;
			}
			
			if($("input[name=discomfort]").is(":checked") == false) {
				alert("현재 불편한 점을 체크해주세요");
				return;
			}
			
			if($("input[name=address]").is(":checked") == false) {
				alert("거주지를 체크해주세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/private-survey"
				, data:{
					"userId":userId
					, "disease":diseaseStr
					, "medicine":medicine
					, "drugAllergy":drugAllergy
					, "lastDentalClinic":lastDentalClinic
					, "discomfort":discomfortStr
					, "address":address
					}
				, success:function(data){
					if(data.result == "success"){
						alert("문진표 저장 성공");
						if(address != "none"){
							location.href="/user/private/dentalClinic-view?address="+address
						} else {
							location.reload();
						}
						
					} else {
						alert("문진표 저장 실패");
					}
				}
				, error:function(){
					alert("문진표 저장 에러");
				}
			});
		});
		
		//  체크박스 중복 체크 방지 - 치과 추천을 원하신다면 거주지 선택
		$("input[type=checkbox][name=address]").on("click", function(){
			
			if ($(this).prop("checked")){
				 $("input[type=checkbox][name=address]").prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
		
		//  체크박스 중복 체크 방지 - 마지막 치과 방문일
		$("input[type=checkbox][name=lastDentalClinic]").on("click", function(){
			
			if ($(this).prop("checked")){
				 $("input[type=checkbox][name=lastDentalClinic]").prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
		
		//  체크박스 중복 체크 방지 - 약물 알러지 유무
		$("input[type=checkbox][name=drugAllergy]").on("click", function(){
			
			if ($(this).prop("checked")){
				 $("input[type=checkbox][name=drugAllergy]").prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
		
		//  체크박스 중복 체크 방지 - 먹는 약 유무
		$("input[type=checkbox][name=medicine]").on("click", function(){
			
			if ($(this).prop("checked")){
				 $("input[type=checkbox][name=medicine]").prop("checked",false);
				 $(this).prop("checked",true);
			}
			
		});
	});
	</script>
</body>
</html>