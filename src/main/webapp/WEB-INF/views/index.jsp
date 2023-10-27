<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram</title>
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<form class="login_form" action="login" method="post">
	<div class="title">Catstagram</div>
	<div class="id_input_div"><input type="text" name="member_id" placeholder="아이디" class="id_input"></div>
	<div class="pwd_input_div"><input type="text" name="member_pwd" placeholder="비밀번호" class="pwd_input"></div>
	<div class="saveid_div"><input type="checkbox" value="saveId" value="on">&nbsp;아이디 저장하기</div>
	<div class="login_btn_div"><input type="submit" value="로그인" class="login_btn"></div>
	<div class="or_div"><span class="or_line">────────</span>&nbsp; 또는 &nbsp;<span class="or_line">────────</span></div>
	<div class="fb_div_parent"><div class="fb_div_child"><img src="/img/facebook.png" class="fb_img">&nbsp;Facebook으로 로그인</div></div>
	<div class="pwd_result_div">잘못된 비밀번호입니다. 다시 확인하세요.</div>
</form>
<div class="signup_div">
	계정이 필요하신가요? <a class="signup_btn">가입하기</a>
</div>
</body>
</html>