<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사적인 구강관리 문진표 기반 근처치과 List</title>
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
			<div class="dentalClinic-box-center">
				<div class="dentalClinic-box">
					<div class="dentalClinic-text">ㅁㅁ시 치과 목록</div>
					
					<table class="table text-center">
						<thead>
							<tr>
								<td><strong>No.</strong></td>
								<td><strong>치과명</strong></td>
								<td><strong>치과주소</strong></td>
								<td><strong>진료과목</strong></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>이편한치과</td>
								<td>경기도 수원시</td>
								<td>구강악안면외과, 치과보철과, 치과교정과, 소아치과, 치주과</td>
							</tr>
							
							<tr>
								<td>2</td>
								<td>연세미치과</td>
								<td>경기도 수원시</td>
								<td>치과보철과, 치과교정과</td>
							</tr>	
							
							<tr>
								<td>3</td>
								<td>연세고운미소치과</td>
								<td>경기도 수원시</td>
								<td>구강악안면외과</td>
							</tr>													
							
						</tbody>
					</table>
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