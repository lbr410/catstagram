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
		<a href="/catstagram">
			<div class="logo_div">
				<img src="/img/logo.png" class="logo_img">
				<span class="logo_title">Catstagram</span>
			</div>
		</a>
		<form action="/catstagram/account/search" method="get" class="search_div">
			<input type="text" class="search_input" name="id" placeholder="검색" maxlength="30" required>
			<input type="submit" value="" class="search-btn">
		</form>
		<div class="menu_div">
			<img src="/img/home.png" class="menu_img" onclick="javascript: location.href='/catstagram'">
			<img src="/img/dm.png" class="menu_img">
			<img src="/img/feed.png" class="menu_img" onclick="javascript: location.href='/catstagram/account/feedWrite'">
			<div class="btn-group">
				<span class="position-relative" data-bs-toggle="dropdown" aria-expanded="false">
					<img src="/img/heart.png" class="menu_img" onclick="redDotRemove()">
					<span class="position-absolute top-0 start-50 translate-middle p-1 bg-danger border border-light rounded-circle" id="alarmRedDot"></span>
	  			</span>
	  			<ul class="dropdown-menu dropdown-menu-end alarm_size">
	  				<c:forEach var="alarmList" items="${alarmList}">
	  					<c:if test="${alarmList.activity_type eq 'follow'}">
	  						<li class="alarm-prop-size dropdown-item menu_font">
								<div class="alarm_msg_span2">${alarmList.member_id}님이 팔로우하기 시작했습니다.</div>
								<div class="alarm_time">${alarmList.alarm_date_string}</div>
							</li>
	  					</c:if>
	  					<c:if test="${alarmList.activity_type eq 'feedLike'}">
	  						<li class="alarm-prop-size dropdown-item menu_font">
								<img src="/upload/feed/${alarmList.feed_img}" class="alarm_img">
								<div class="alarm_msg_span">${alarmList.member_id}님이 회원님의 게시물을 좋아합니다.</div>
								<div class="alarm_time">${alarmList.alarm_date_string}</div>
							</li>
	  					</c:if>
	  					<c:if test="${alarmList.activity_type eq 'comment'}">
	  						<li class="alarm-prop-size dropdown-item menu_font">
								<img src="/upload/feed/${alarmList.feed_img}" class="alarm_img">
								<div class="alarm_msg_span">${alarmList.member_id}님이 회원님의 게시글에 댓글을 남겼습니다. "${alarmList.comment_content}"</div>
								<div class="alarm_time">${alarmList.alarm_date_string}</div>
							</li>
	  					</c:if>
	  					<c:if test="${alarmList.activity_type eq 'commentLike'}">
	  						<li class="alarm-prop-size dropdown-item menu_font">
								<img src="/upload/feed/${alarmList.feed_img}" class="alarm_img">
								<div class="alarm_msg_span">${alarmList.member_id}님이 회원님의 댓글을 좋아합니다. "${alarmList.comment_content}"</div>
								<div class="alarm_time">${alarmList.alarm_date_string}</div>
							</li>
	  					</c:if>
	  				</c:forEach>
				</ul>
  			</div>
			<div class="btn-group">
				<c:if test="${empty sessionScope.simg}">
					<img src="/img/default_photo2.png" class="header_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
				</c:if>
				<c:if test="${!empty sessionScope.simg}">
					<img src="/upload/member/${sessionScope.simg}" class="header_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
				</c:if>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item menu_font" href="/catstagram/${sessionScope.sid}">My Catstagram</a></li>
					<li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item menu_font" href="/catstagram/account/infoUpdate">회원 정보 수정</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item menu_font" href="/catstagram/account/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script>
	// 알림창 클릭시 빨간 점 표시 없애기
	function redDotRemove() {
		document.getElementById('alarmRedDot').remove();
	}
</script>
</html>