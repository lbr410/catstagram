<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 프로필 사진 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/profileImgPopup.css">
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

    // 업로드한 이미지 미리보기
    function setFeedImg(event) {
        const reader = new FileReader();

        reader.onload = function(event) {
            const img = document.getElementById('profileImgPreview');
            img.setAttribute("src", event.target.result);
            
        }
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
</head>
<body>
    <form class="profile_img_div">
        <div class="profile_img_update_div">
            <img src="/img/default_photo2.png" class="profile_update_img" id="profileImgPreview">
        </div>
        <div class="profile_img_upload_btn_div">
            <input type="file" id="profileImgUpload" name="member_img" accept=".jpg, .jpeg, .png" onchange="extensionCheck(this); setFeedImg(event);" style="display: none">
            <input type="button" value="이미지 업로드" class="btn btn-primary profile_img_upload_btn" onclick="document.getElementById('profileImgUpload').click();">
            <input type="button" value="삭제" class="btn btn-secondary profile_img_del_btn">
        </div>
        <div class="profile_img_btn_div">
            <input type="button" value="취소" class="btn btn-secondary profile_img_cancel_btn" onclick="javascript: location.href='/catstagram/main'">
            <input type="submit" value="수정" class="btn btn-primary profile_img_update_btn">
        </div>
    </form>
</body>
</html>