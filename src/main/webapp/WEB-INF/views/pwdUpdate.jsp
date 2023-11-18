<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 비밀번호 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/memberInfo.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">비밀번호 수정</div>
</div>
<form class="info_form" method="post" onsubmit="return validation()">
    <div class="info_div">
        <span class="menu_span">비밀번호</span>
        <input type="text" name="member_pwd" id="userpwd" placeholder="비밀번호(8~12자 영문;숫자/특수문자 조합)" class="form-control form-control-sm input_textbox_deco" maxlength="12" oninput="pwdChk()" required> 
    </div>
    <div class="info_div">
        <span class="menu_span">비밀번호 확인</span>
        <input type="text" id="userpwdchk" placeholder="비밀번호 확인" class="form-control form-control-sm input_textbox_deco" maxlength="12" oninput="pwdChk()" required> 
    </div>
    <div class="info_btn">
        <input type="button" value="취소" class="btn btn-secondary info_cancel_btn">
        <input type="submit" value="수정" class="btn btn-primary info_ok_btn">
    </div>
</form>
<%@ include file="footer.jsp" %>
</body>
<script>
    // 비밀번호 유효성
    function pwdChk() {
		const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;
		const pwd = document.getElementById('userpwd');
		const pwdchk = document.getElementById('userpwdchk');

		if(pwd.value != '') {
			if(!reg.test(pwd.value)) {
				pwd.className = '';
				pwd.classList.add('form-control', 'form-control-sm', 'unavailable_it');
			} else {
				pwd.className = '';
				pwd.classList.add('form-control', 'form-control-sm', 'available_it');
			}

			if(pwdchk.value != '') {
				if(pwdchk.value == pwd.value) {
					if(reg.test(pwdchk.value)) {
						pwdchk.className = '';
						pwdchk.classList.add('form-control', 'form-control-sm', 'available_it');
					}
				} else {
					pwdchk.className = '';
					pwdchk.classList.add('form-control', 'form-control-sm', 'unavailable_it');
				}
			} else {
				pwdchk.className = '';
				pwdchk.classList.add('form-control', 'form-control-sm', 'input_textbox_deco');
			}
		} else {
			pwd.className = '';
			pwd.classList.add('form-control', 'form-control-sm', 'input_textbox_deco');
			pwdchk.className = '';
			pwdchk.classList.add('form-control', 'form-control-sm', 'input_textbox_deco');
		}
	}

    // 비밀번호 유효성 검사
	function validation() {
		const pwd = document.getElementById('userpwd');
		const pwdchk = document.getElementById('userpwdchk');
		
		if(pwd.value != pwdchk.value || !pwd.classList.contains('available_it') || !pwdchk.classList.contains('available_it')) {
			window.alert('비밀번호를 확인바랍니다.');
			return false;
			
		}

		return true;
	}
</script>
</html>