<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script>
</head>
<body>
	<form class="login_form" action="/catstagram/login" method="post">
		<div class="title">Catstagram</div>
		<div class="id_input_div">
			<input type="text" name="member_id" id="userid" placeholder="아이디" class="form-control mx-auto form-control-sm id_input" maxlength="30" value="${cookie.saveid.value}" required>
			</div>
		<div class="pwd_input_div">
			<input type="password" name="member_pwd" id="userpwd" placeholder="비밀번호" class="form-control mx-auto form-control-sm pwd_input" maxlength="12" required>
		</div>
		<div class="saveid_div">
			<input type="checkbox" name="saveidChk" class="form-check-input" value="on" ${empty cookie.saveid.value ? '' : 'checked'}>
			<label class="form-check-label" for="saveidChk">&nbsp;아이디 기억하기</label>
		</div>
		<div class="login_btn_div">
			<input type="submit" value="로그인" class="btn btn-primary login_btn">
		</div>
		<div class="or_div">
			<span class="or_line">────────</span>&nbsp; 또는 &nbsp;<span class="or_line">────────</span>
		</div>
		<div class="fb_div_parent">
			<div class="fb_div_child">
				<img src="/img/facebook.png" class="fb_img">&nbsp;Facebook으로 로그인
			</div>
		</div>
		<div class="pwd_result_div" id="pwd_result"><!-- state --></div>
	</form>
	<div class="signup_div">
		계정이 필요하신가요? <a class="signup_btn" onclick="javascript: location.href='/catstagram/signup'">가입하기</a>
	</div>
</body>
</html>