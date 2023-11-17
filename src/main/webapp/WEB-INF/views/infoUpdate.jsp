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
						userid.classList.add('form-control', 'form-control-sm', 'unavailable_it');
					} else {
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
			window.alert('아이디를 확인바랍니다.');
			return false;	
		}

		return true;
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<div>
	
</div>
<%@ include file="footer.jsp" %>
</body>
</html>