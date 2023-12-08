<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 회원 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/memberInfo.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">회원 정보 수정</div>
</div>
<form class="info_form" method="post" action="/catstagram/account/infoUpdate" onsubmit="return validation()">
    <div class="info_div">
        <span class="menu_span">성명</span>
        <input type="text" name="member_name" placeholder="성명" value="${sessionScope.sname}" class="form-control form-control-sm input_textbox_deco" maxlength="30" required> 
    </div>
    <div class="info_div">
        <span class="menu_span">아이디</span>
        <input type="text" id="userid" name="member_id" placeholder="아이디(영문 또는 숫자 또는 .,_,. 기호)" value="${sessionScope.sid}" class="form-control form-control-sm input_textbox_deco" maxlength="30" oninput="idChk(this)" required> 
    </div>
    <div class="info_btn">
        <input type="button" value="취소" class="btn btn-secondary info_cancel_btn" onclick="javascript: location.href='/catstagram'">
        <input type="submit" value="수정" class="btn btn-primary info_ok_btn">
    </div>
    <div class="update_quit_div">
		<span class="pwd_update_btn" onclick="javascript: location.href='/catstagram/account/pwdUpdate?page=p'">비밀번호 수정하기</span>
		<span class="quit_btn" onclick="javascript: location.href='/catstagram/account/quit?page=q'">회원탈퇴</span>
	</div>
</form>
<%@ include file="footer.jsp" %>
</body>
<script>
    // 아이디 중복 검사 & 사용 가능 여부
	function idChk(props) {
		const id = props.value;
		const param = 'id='+id;
		
		sendRequest('/catstagram/account/idCheck', param, idChkCallBack, 'POST');
	}

    function idChkCallBack() {
		const id = document.getElementById('userid').value;
		if(XHR.readyState == 4) {
			if(XHR.status == 200) {
				const result = XHR.responseText;
				const userid = document.getElementById('userid');
				const reg = /^[a-z0-9_\-\.]{1,30}$/;

				if(id != '') {
					if(id == '${sessionScope.sid}') {
						userid.className = '';
						userid.classList.add('form-control', 'form-control-sm', 'available_it');
					}
					
					else if(!reg.test(id) || result == id) {
						userid.className = '';
						userid.classList.add('form-control', 'form-control-sm', 'unavailable_it');
					} else if(reg.test(id) && result != id) {
						userid.className = '';
						userid.classList.add('form-control', 'form-control-sm', 'available_it');
					}
				} else {
					userid.className = '';
					userid.classList.add('form-control', 'form-control-sm', 'input_textbox_deco');
				}
			}
		}
	}

    // 아이디 유효성 검사
	function validation() {
		const id = document.getElementById('userid');
		if(!id.classList.contains('available_it')) {
			if(id.value == '${sessionScope.sid}') {
				return true;
			}
			window.alert('아이디를 확인바랍니다.');
			return false;	
		}
		return true;
	}
</script>
</html>