<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 회원가입</title>
<link rel="stylesheet" type="text/css" href="/css/signup.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script> 
<script>
	// 아이디 중복 검사 & 사용 가능 여부
	function idChk(props) {
		const id = props.value;
		const param = 'id='+id;
		
		sendRequest('idCheck', param, idChkCallBack, 'POST');
	}

	function idChkCallBack() {
		const id = document.getElementById('userid').value;
		if(XHR.readyState == 4) {
			if(XHR.status == 200) {
				const result = XHR.responseText;
				const userid = document.getElementById('userid');
				const reg = /^[a-z0-9_\-\.]{1,30}$/;

				if(id != '') {
					if(!reg.test(id) || result == id) {
						userid.className = '';
						userid.classList.add('unavailable_it');
					// } else if((reg.test(id) && result != id) || reg.test(id)) {
					} else {
						userid.className = '';
						userid.classList.add('available_it');
					}
				} else {
					userid.className = '';
					userid.classList.add('id_input');
				}
			}
		}
	}

	// 비밀번호 유효성
	function pwdChk() {
		const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;
		const pwd = document.getElementById('userpwd');
		const pwdchk = document.getElementById('userpwdchk');

		if(pwd.value != '') {
			if(!reg.test(pwd.value)) {
				pwd.className = '';
				pwd.classList.add('unavailable_it');
			} else {
				pwd.className = '';
				pwd.classList.add('available_it');
			}

			if(pwdchk.value != '') {
				if(pwdchk.value == pwd.value) {
					if(reg.test(pwdchk.value)) {
						pwdchk.className = '';
						pwdchk.classList.add('available_it');
					}
				} else {
					pwdchk.className = '';
					pwdchk.classList.add('unavailable_it');
				}
			} else {
				pwdchk.className = '';
				pwdchk.classList.add('pwd_chk_input');
			}
		} else {
			pwd.className = '';
			pwd.classList.add('pwd_input');
			pwdchk.className = '';
			pwdchk.classList.add('pwd_chk_input');
		}
	}
</script>
</head>
<body>
	<form class="signup_form" action="" method="post">
		<div class="title">Catstagram</div>
		<div class="signup_msg_div">친구들의 고양이 일상을 보려면 가입하세요.</div>
		<div class="input_div">
			<input type="text" name="member_name" placeholder="성명" class="name_input" maxlength="30" required>
		</div>
		<div class="input_div">
			<input type="text" name="member_id" id="userid" placeholder="아이디(영문 또는 숫자 또는 -,_,. 기호)" class="id_input" maxlength="30" oninput="idChk(this)" required>
		</div>
		<div class="input_div">
			<input type="password" name="member_pwd" id="userpwd" placeholder="비밀번호(8~12자 영문/숫자/특수문자 조합)" class="pwd_input" maxlength="12" oninput="pwdChk()" required>
		</div>
		<div class="input_div">
			<input type="password" id="userpwdchk" placeholder="비밀번호 확인" class="pwd_chk_input" maxlength="12" oninput="pwdChk()" required>
		</div>
		<div class="signup_btn_div">
			<input type="submit" value="가입" class="signup_btn">
		</div>
	</form>
	<div class="login_div">
		계정이 있으신가요? <a class="login_btn" onclick="javascript: location.href='/catstagram'">로그인</a>
	</div>
</body>
</html>