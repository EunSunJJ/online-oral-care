<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 질문 게시판 목록</title>
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
					<form name="searchFrm" method="get" action="/manager/qpost/list-view">
						<select class="select-qpost-search" name="searchType">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select> 
						<input id="searchInput" class="input-qpost-search" type="text" name="keyword" placeholder="검색어를 입력하세요">
						<button id="searchBtn" class="button-qpost-search" type="submit">검색</button>
						</form>
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
								
								<td>
								<a href="/manager/qpost/answer-view?id=${qpost.id}">${qpost.title}</a>
								</td>
								
								<td>${qpost.writer}</td>
								<td><fmt:formatDate value="${qpost.createdAt}" pattern="yyyy-MM-dd" /></td>
								<td>
									<c:choose>
										<c:when test="${qpost.answer == false}">답변 미완료</c:when>
										<c:otherwise>답변 완료</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<div class="qpost-list-number">
					<!-- pagination -->
					<div id="paginationBox">
						<ul>
							<!-- 검색어가 없을 때 paging -->
							<c:if test="${pagination.keyword == null and pagination.searchType == null}">
							
								<!-- 맨 처음 페이지로 -->
								<li class="pageInfo"><a class="paging" href="/manager/qpost/list-view?page=1">처음으로</a></li>
								
				                <!-- 이전페이지 버튼 -->
				                <c:if test="${pagination.prev}">
				                    <li class="pageInfo"><a class="paging" href="/manager/qpost/list-view?page=${pagination.startPage - 1}">이전</a></li>
				                </c:if>
								
								<!-- 페이지 리스트 -->
								<c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
									<li class="pageInfo"><a class="paging" href="/manager/qpost/list-view?page=${num}"> ${num}</a></li>
								</c:forEach>
								
	               				<!-- 다음페이지 버튼 -->
	               				 <c:if test="${pagination.next}">
	               				 	<li class="pageInfo"><a class="paging" href="/manager/qpost/list-view?page=${pagination.endPage + 1}">다음</a></li>
	                			</c:if>  
                			</c:if>	
							
							<!-- 검색어가 있을 때 paging -->
							<c:if test="${pagination.keyword != null and pagination.searchType != null}">
								
								<!-- 맨 처음 페이지로 -->
								<li class="pageInfo"><a class="paging" href="/manager/qpost/list-view?searchType=${pagination.searchType}&keyword=${pagination.keyword}&page=1">처음으로</a></li>
				                
				                <!-- 이전페이지 버튼 -->
				                <c:if test="${pagination.prev}">
				                    <li class="pageInfo"><a class="paging" 
				                    href="/manager/qpost/list-view?searchType=${pagination.searchType}&keyword=${pagination.keyword}&page=${pagination.startPage - 1}">이전</a></li>
				                </c:if>
								
								<!-- 페이지 리스트 -->
								<c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
									<li class="pageInfo"><a class="paging" 
									href ="/manager/qpost/list-view?searchType=${pagination.searchType}&keyword=${pagination.keyword}&page=${num}"> ${num}</a></li>
								</c:forEach>
								
	               				<!-- 다음페이지 버튼 -->
	               				 <c:if test="${pagination.next}">
	               				 	<li class="pageInfo"><a class="paging" 
	               				 	href="/manager/qpost/list-view?searchType=${pagination.searchType}&keyword=${pagination.keyword}&page=${pagination.endPage + 1}">다음</a></li>
	                			</c:if>  							
							</c:if>    
						</ul>	
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
</body>
</html>