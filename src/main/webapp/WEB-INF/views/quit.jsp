<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 회원 탈퇴</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/memberInfo.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="menu_title_div">
    <div class="menu_title">회원 탈퇴</div>
</div>
<form class="info_form2" action="/catstagram/account/quitOk" method="post" onsubmit="return check()">
    <div class="info_div">
        <div id="quitAgreement">
			<!-- import -->
		</div>
    </div>
    <div class="chk_div">
    <div class="form-check">
        <label class="form-check-label" for="chk">(필수)유의 및 안내 사항을 모두 확인하였습니다.</label>&nbsp;
        <input type="checkbox" id="chk" class="form-check-input">
    </div>
    </div>
    <div class="info_btn2">
        <input type="submit" value="탈퇴" class="btn btn-secondary info_cancel_btn">
        <input type="button" value="취소" onclick="javascript: location.href='/catstagram/account/infoUpdate'" class="btn btn-primary info_ok_btn">
    </div>
</form>
<%@ include file="footer.jsp" %>
</body>
<script>
    window.onload = function() {
		document.getElementById("quitAgreement").innerHTML = 
			'<object type="text/html" data="/etc/quit.html" style="width:840px; margin: 10px auto auto 40px; border: 1px solid #ededed; padding: 10px; height: 400px;"></object>';
	}

    // 탈퇴 동의 체크 후 회원탈퇴
    function check() {
        const chk = document.getElementById('chk').checked;
		if(chk == true) {
            return true;
		} else if(chk == false) {
			window.alert('필수 항목에 체크바랍니다.');
			return false;
		}
	}
</script>
</html>