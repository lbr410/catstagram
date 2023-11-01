<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/header.css">
</head>
<body>
	<div class="header_div">
		<a href="/catstagram/main">
			<div class="logo_div">
				<img src="/img/logo.png" class="logo_img">
				<span class="logo_title">Catstagram</span>
			</div>
		</a>
		<form action="" method="post" class="search_div">
			<input type="text" class="search_input" placeholder="검색">
			<input type="submit" value="" class="search-btn">
		</form>
		<div class="menu_div">
			<img src="/img/home.png" class="menu_img">
			<img src="/img/dm.png" class="menu_img">
			<img src="/img/feed.png" class="menu_img">
			<img src="/img/heart.png" class="menu_img">
			<img src="/img/profile2.jpg" class="header_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
			<div class="dropdown-center">
				<ul class="dropdown-menu dropdown-menu2">
					<li><a class="dropdown-item menu_font" href="#">프로필</a></li>
					<li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item menu_font" href="#">설정</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item menu_font" href="#">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>