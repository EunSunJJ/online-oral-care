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
					<form name="searchFrm" method="get" action="/qpost/list-view">
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
									<c:choose>
										<c:when test="${empty qpost.password}"><a href="/qpost/detail-view?id=${qpost.id}">${qpost.title}</a></c:when>
										<c:otherwise><a class="before-qpostPasswordBtn" href="#" data-toggle="modal" data-target="#exampleModal" data-post-id="${qpost.id}" >${qpost.title}</a></c:otherwise>
									</c:choose>

								</td>
								
								<td>${qpost.writer}</td>
								<td><fmt:formatDate value="${qpost.createdAt}" pattern="yyyy-MM-dd" /></td>
								<td>답변 미완료</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<div class="qpost-list-number">
					<!-- pagination -->
					<div id="paginationBox">
						<ul>
							<!-- 맨 처음 페이지로 -->
							<li class="pageInfo"><a class="paging" href="/qpost/list-view?page=1">처음으로</a></li>
							
			                <!-- 이전페이지 버튼 -->
			                <c:if test="${pagination.prev}">
			                    <li class="pageInfo"><a class="paging" href="/qpost/list-view?page=${pagination.startPage - 1}">이전</a></li>
			                </c:if>
							
							<!-- 페이지 리스트 -->
							<c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
								<li class="pageInfo"><a class="paging" href="/qpost/list-view?page=${num}"> ${num}</a></li>
							</c:forEach>
							
               				<!-- 다음페이지 버튼 -->
               				 <c:if test="${pagination.next}">
               				 	<li class="pageInfo"><a class="paging" href="/qpost/list-view?page=${pagination.endPage + 1}">다음</a></li>
                			</c:if>    
						</ul>	
					</div>
				</div>
				
			</div>

			<div class="qpost-list-button">
				<a href="/qpost/create-view"><button class="button-qpost-list" type="button">글쓰기</button></a>
			</div>
		</section>

		<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
		
<!-- modal -->	
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-body">
        <form>
          <div class="form-group">
            <div for="recipient-name" class="col-form-label">비밀번호를 입력하세요</div>
            <input type="password" class="form-control" id="qpostPasswordInput">
          </div>
        </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button id="qpostPasswordBtn" type="button" class="btn btn-primary">확인</button>
      </div>
      
    </div>
  </div>
</div>	
	
	</div>
	
	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
	$(document).ready(function(){
		
		// postId 가져오기
		$(".before-qpostPasswordBtn").on("click", function(){
			
			let postId = $(this).data("post-id");
			$("#qpostPasswordBtn").data("post-id", postId);
			
		});
		
		
		// 확인 버튼 누르면 password 일치하는지 확인
		$("#qpostPasswordBtn").on("click", function(){
			
			let password = $("#qpostPasswordInput").val();
			let postId = $(this).data("post-id");
			
			// validation
			if(password == "") {
				alert("비밀번호를 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/qpost/password-check",
				data:{
					"password":password,
					"postId":postId
				},
				success:function(data){
					if(data.result == "success") {
						alert("패스워드가 일치합니다");
						// 상세페이지 보여주기
						location.href="/qpost/detail-view?id=" + postId
					} else {
						alert("패스워드가 일치하지 않습니다");
						// input값 초기화
					}
				},
				error:function(){
					alert("");
				}
			
				
			});
		});
		
		
		// password 넣을 modal
		$('#exampleModal').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) // 모달 실행 버튼
			  var recipient = button.data('whatever') // data-* 속성에서 정보 추출
			  
			  var modal = $(this)
			  modal.find('.modal-title').text('비밀번호를 입력하세요' + recipient)
			  modal.find('.modal-body input').val(recipient)
			});
		
	});

	</script>
</body>
</html>