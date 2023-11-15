<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<div class="header-box1">
		<a href="/home-view"><img class="header-box1_logo" src="/static/images/smile-tooth.png" alt="로고"></a>
		<h1 class="header-box1-text">구강관리의 모든 것</h1>
	</div>
	<div class="header-box2">
	
		<div class="header-box2-login">
			<c:if test="${empty managerId && empty userId}">
			<a class="header-box2-login-anchor" href="/user/login-view" target="_self">로그인</a>
			</c:if>
		</div>
		
		<div class="header-box2-logout">
			<c:choose>
				<c:when test="${not empty userId}">
					<span>${userLoginId}님 안녕하세요</span>
					<div class="header-logout-myInfo">
						<a href="/user/logout"><span>로그아웃</span></a>
						<a href="/user/myInfo-view"><span class="header-myInfo">내정보</span></a>
					</div>
				</c:when>
				
				<c:when test="${not empty managerId}">
					<span>${managerLoginId}님 안녕하세요</span>
					<a href="/admin/logout"><span>로그아웃</span></a>
				</c:when>	
							
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
		
	</div>
</header>