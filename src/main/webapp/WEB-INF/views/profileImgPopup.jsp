<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 프로필 사진 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/profileImgPopup.css">
</head>
<body>
    <form class="profile_img_div" action="/catstagram/account/profileImgUpdate" method="post" onsubmit="return validation()" enctype="multipart/form-data">
        <div class="profile_img_update_div">
        	<c:if test="${empty sessionScope.simg}">
        		<img src="/img/default_photo2.png" class="profile_update_img" id="profileImgPreview">
        	</c:if>
        	<c:if test="${!empty sessionScope.simg}">
        		<img src="/upload/member/${sessionScope.simg}" class="profile_update_img" id="profileImgPreview">
        	</c:if>
        </div>
        <div class="profile_img_upload_btn_div">
            <input type="file" id="profileImgUpload" name="member_img" accept=".jpg, .jpeg, .png" onchange="extensionCheck(this); setProfileImg(event);" style="display: none">
            <input type="button" value="이미지 업로드" class="btn btn-primary profile_img_upload_btn" onclick="document.getElementById('profileImgUpload').click();">
            <input type="button" value="삭제" class="btn btn-secondary profile_img_del_btn" onclick="profileImgDel()">
        </div>
        <div class="profile_img_btn_div">
            <input type="button" value="취소" class="btn btn-secondary profile_img_cancel_btn" onclick="popupClose()">
            <input type="submit" value="수정" class="btn btn-primary profile_img_update_btn">
        </div>
    </form>
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

    // 업로드한 이미지 미리보기 & 프로필 이미지 크기 제한
    function setProfileImg(event) {
    	const profileImgUpload = document.getElementById('profileImgUpload');
    	if(profileImgUpload.files.length > 0) {
	        const fileSizeInBytes = profileImgUpload.files[0].size;
    		const maxSizeInBytes = 1024 * 1024; // 1MB
    		
    		if(fileSizeInBytes <= maxSizeInBytes) {
    	        const reader = new FileReader();
		        reader.onload = function(event) {
		            const img = document.getElementById('profileImgPreview');
		            img.setAttribute("src", event.target.result);
		        }
		        reader.readAsDataURL(event.target.files[0]);
    		} else {
    			window.alert('이미지의 사이즈가 1MB를 초과할 수 없습니다.');
    			profileImgUpload.value = '';
    		}
    	}
    }
    
    // 프로필 이미지 미리보기에서 프로필 이미지 삭제
    function profileImgDel() {
    	document.getElementById('profileImgPreview').src = '/img/default_photo2.png';
    }
    
    // 유효성 검사
    function validation() {
        const fullProfileImgSrc = document.getElementById('profileImgPreview').src;
        const url = new URL(fullProfileImgSrc);
        const profileImgSrc = url.pathname; // /img/default_photo2.png

        // input file에 아무 것도 업로드되지 않았을 때
        if(document.getElementById('profileImgUpload').value == '') {
            // 프로필 이미지 삭제된 상태인 경우(기본 이미지인 경우)
            if(profileImgSrc == '/img/default_photo2.png') { // 아무 작업도 하지 않고 수정을 눌렀을 경우(프로필 이미지가 없는 상태)
            	if(${sessionScope.simg eq ''}) {
            		window.alert('수정된 프로필 이미지가 없습니다.');
                    return false;
            	}
                return true;
            // 아무 작업도 하지 않고 수정을 눌렀을 경우(프로필 이미지가 있는 상태)
            } else if(profileImgSrc != '/img/default_photo2.png') {
                window.alert('수정된 프로필 이미지가 없습니다.');
                return false;
            }
        }
        return true;
    }
    
    // 팝업창 닫기
    function popupClose() {
    	window.self.close();
    }
</script>
</html>