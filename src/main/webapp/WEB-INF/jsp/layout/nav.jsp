<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
	<div class="nav-box">
		<ul>
			<li class="nav-box-list"><a class="nav-box-anchor" href="/info/care-view">구강관리비법</a></li>
			<li class="nav-box-list"><a class="nav-box-anchor" href="/user/private/survey-view">사적인구강관리</a></li>
			<li class="nav-box-list">
				<c:choose>
					<c:when test="${empty managerId}">
						<a class="nav-box-anchor" href="/qpost/list-view">질문게시판</a>
					</c:when>
					
					<c:when test="${not empty managerId}">
						<a class="nav-box-anchor" href="/admin/qpost/list-view">질문게시판</a>
					</c:when>
				</c:choose>
			</li>
			<li class="nav-box-list"><a class="nav-box-anchor" href="/info/honeyTip-view">꿀팁모음집</a></li>
			<li class="nav-box-list"><a class="nav-box-anchor" href="/survey/start-view">구강건강관리점수측정</a></li>
		</ul>
	</div>
</nav>
