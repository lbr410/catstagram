<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
</head>
<body class="header_body">
	<div class="header_div">
		<a href="/catstagram/main">
			<div class="logo_div">
				<img src="/img/logo.png" class="logo_img">
				<span class="logo_title">Catstagram</span>
			</div>
		</a>
		<form action="/catstagram/search" method="post" class="search_div">
			<input type="text" class="search_input" name="search_id" placeholder="검색" required>
			<input type="submit" value="" class="search-btn">
		</form>
		<div class="menu_div">
			<img src="/img/home.png" class="menu_img">
			<img src="/img/dm.png" class="menu_img">
			<img src="/img/feed.png" class="menu_img" onclick="javascript: location.href='/catstagram/feedWrite'">
			<img src="/img/heart.png" class="menu_img">
			<c:if test="${empty sessionScope.simg}">
				<img src="/img/default_photo2.png" class="header_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
			</c:if>
			<c:if test="${!empty sessionScope.simg}">
				<img src="/upload/member/${sessionScope.simg}" class="header_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
			</c:if>
			<div class="dropdown-center">
				<ul class="dropdown-menu dropdown-menu2">
					<li><a class="dropdown-item menu_font" href="#">My Catstagram</a></li>
					<li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item menu_font" href="/catstagram/infoUpdate">회원 정보 수정</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item menu_font" href="logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>