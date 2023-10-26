<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 글 목록</title>
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
			<div class="qpost-list-box">
				<div class="qpost-list-logo">질문 게시판 글 목록</div>

				<div class="qpost-search">

					<select class="select-qpost-search">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select> <input id="searchInput" class="input-qpost-search" type="text">
					<button id="searchBtn" class="button-qpost-search" type="submit">검색</button>
				</div>

				<table class="table text-center">
					<thead>
						<tr>
							<td><i class="bi bi-lock"></i></td>
							<td>No.</td>
							<td>질문제목</td>
							<td>글쓴이</td>
							<td>작성날짜</td>
							<td>답변유무</td>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="qpost" items="${qpostList}">
							<tr>
								<td>
									<c:if test="${not empty qpost.password}">
										<i class="bi bi-lock"></i>
									</c:if>
								</td>
								<td>${qpost.id}</td>
								
								<td><a href="/qpost/detail-view?id=${qpost.id}">${qpost.title}</a></td>
								
								<td>${qpost.writer}</td>
								<td><fmt:formatDate value="${qpost.createdAt}" pattern="yyyy-MM-dd" /></td>
								<td>답변 미완료</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<div class="qpost-list-number">
					<c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
						<div><a href="/qpost/list-view?page=${num}"> ${num}</a></div>
					</c:forEach>
				</div>
			</div>

			<div class="qpost-list-button">
				<a href="/qpost/create-view"><button class="button-qpost-list" type="button">글쓰기</button></a>
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