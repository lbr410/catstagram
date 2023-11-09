<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 프로필 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/profileUpdate.css">
<script>
    // 프로필 소개 글자수 확인
    function textCheck() {
        if(document.getElementById('profileInto').value.length < 10) {
            document.getElementById('textLength').innerHTML = '00'+document.getElementById('profileInto').value.length;
        } else if(document.getElementById('profileInto').value.length >= 10 && document.getElementById('profileInto').value.length < 100) {
            document.getElementById('textLength').innerHTML = '0'+document.getElementById('profileInto').value.length;
        } else {
            document.getElementById('textLength').innerHTML = document.getElementById('profileInto').value.length;
        }
    }
    
    // 프로필 이미지 수정 팝업
    function profileImgPopup() {
        window.open('/catstagram/profileImgPopup', 'popup', 'width=400, height=500');
    }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">프로필 수정</div>
</div>

<form class="profile_update_div">
    <div class="profile_update_img_div">
        <img src="/img/default_photo2.png" class="profile_update_img" id="profileImgPreview">
    </div>
    <div class="profile_update_content_div">
        <textarea class="profile_update_content_textarea" id="profileInto" name="member_intro" maxlength="100" oninput="textCheck()" placeholder="소개 입력..." required></textarea>
        <div class="textCount">(<span id="textLength">000</span> / 100)</div>
        <div class="profile_update_btn_div">
            <input type="button" value="취소" class="btn btn-secondary profile_update_cancel_btn" onclick="javascript: location.href='/catstagram/main'">
            <input type="submit" value="수정" class="btn btn-primary profile_update_btn">
        </div>
    </div>
</form>
<div class="profile_img_div">
    <span class="profile_img_btn" onclick="profileImgPopup()">프로필 사진 바꾸기</span>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>