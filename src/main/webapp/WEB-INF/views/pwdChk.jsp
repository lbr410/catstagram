<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 비밀번호 확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/memberInfo.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">비밀번호 확인</div>
</div>
<form class="info_form" action="/catstagram/account/<c:choose><c:when test='${page eq "p"}'>pwdUpdate</c:when><c:when test='${page eq "q"}'>quit</c:when></c:choose>" method="post">
    <div class="info_div">
        <span class="menu_span">비밀번호</span>
        <input type="password" name="member_pwd" placeholder="비밀번호 입력" class="form-control form-control-sm input_textbox_deco" maxlength="12" required>
        <input type="hidden" name="page" value="${page}">
    </div>
    <div class="info_btn">
        <input type="button" value="취소" class="btn btn-secondary info_cancel_btn" onclick="javascript: location.href='/catstagram/account/infoUpdate'">
        <input type="submit" value="확인" class="btn btn-primary info_ok_btn">
    </div>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>