<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 피드 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/feedUpdate.css">
<script>
    // 피드 내용 글자수 확인
    function textCheck() {
        if(document.getElementById('feedWriteContent').value.length < 10) {
            document.getElementById('textLength').innerHTML = '00'+document.getElementById('feedWriteContent').value.length;
        } else if(document.getElementById('feedWriteContent').value.length >= 10 && document.getElementById('feedWriteContent').value.length < 100) {
            document.getElementById('textLength').innerHTML = '0'+document.getElementById('feedWriteContent').value.length;
        } else {
            document.getElementById('textLength').innerHTML = document.getElementById('feedWriteContent').value.length;
        }
    }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">피드 수정</div>
</div>

<form class="feed_write_div">
    <div class="feed_write_img_div">
        <img src="/img/preview.png" class="feed_write_img" id="feedImgPreview">
    </div>
    <div class="feed_write_content_div">
        <textarea class="feed_write_content_textarea" id="feedWriteContent" name="feed_content" maxlength="500" oninput="textCheck()" required></textarea>
        <div class="textCount">(<span id="textLength">000</span> / 500)</div>
        <div class="feed_write_btn_div">
            <input type="button" value="취소" class="btn btn-secondary feed_write_cancel_btn" onclick="javascript: location.href='/catstagram/main'">
            <input type="submit" value="수정" class="btn btn-primary feed_write_btn">
        </div>
    </div>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>