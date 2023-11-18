<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 피드 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/feedWrite.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">피드 작성</div>
</div>

<form class="feed_write_div" action="/catstagram/feedWrite" method="post" enctype="multipart/form-data">
    <div class="feed_write_img_div">
        <img src="/img/preview.png" class="feed_write_img" id="feedImgPreview">
    </div>
    <div class="feed_write_content_div">
        <input type="file" id="feedImgUpload" name="feed_img" accept=".jpg, .jpeg, .png" onchange="extensionCheck(this); setFeedImg(event);" style="display: none" required>
        <input type="button" value="이미지 업로드" class="btn btn-primary feed_write_img_upload_btn" onclick="document.getElementById('feedImgUpload').click();"><br>
        <textarea class="feed_write_content_textarea" id="feedWriteContent" name="feed_content" maxlength="500" oninput="textCheck()" placeholder="피드 내용 입력..." required></textarea>
        <div class="textCount">(<span id="textLength">000</span> / 500)</div>

        <div class="feed_write_btn_div">
            <input type="button" value="취소" class="btn btn-secondary feed_write_cancel_btn" onclick="javascript: location.href='/catstagram/main'">
            <input type="submit" value="등록" class="btn btn-primary feed_write_btn">
        </div>
    </div>
</form>
<%@ include file="footer.jsp" %>
</body>
<script>
    // 이미지 업로드시 확장자 확인
    function extensionCheck(rp) {
        const filename = rp.value;
        const len = filename.length;
        const filetype = filename.substring(len-4, len);

        if(filetype!='.jpg' && filetype!='.png' && filetype!='jpeg') {
            window.alert('이미지 파일만 등록 가능합니다.');
            rp.value = '';
        }
    }

    // 업로드한 이미지 미리보기 & 피드 이미지 크기 제한
    function setFeedImg(event) {
    	const feedImgUpload = document.getElementById('feedImgUpload');
    	if(feedImgUpload.files.length > 0) {
    		const fileSizeInBytes = feedImgUpload.files[0].size;
    		const maxSizeInBytes = 1024 * 1024 * 5; // 5MB
    		
    		if(fileSizeInBytes <= maxSizeInBytes) {
	        	const reader = new FileReader();
	        	reader.onload = function(event) {
	            	const img = document.getElementById('feedImgPreview');
	            	img.setAttribute("src", event.target.result);
	        	}
	        	reader.readAsDataURL(event.target.files[0]);
    		} else {
    			window.alert('이미지의 사이즈가 10MB를 초과할 수 없습니다.');
    			feedImgUpload.value = '';
    		}
    	}
    }

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
</html>