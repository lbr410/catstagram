<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram : 회원 검색</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/search.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="search_result_div">
    <div class="search_msg_div">
        <h4>'${search_id}' 검색 결과</h4>
    </div>
    
    <c:forEach var="dto" items="${list}">
    <div class="search_list_div">
        <div class="img_and_id_and_name_div">
            <c:if test="${empty dto.member_img}">
            	<a href="#"><img src="/img/default_photo2.png" class="search_profile_img"></a>&nbsp;
            </c:if>
            <c:if test="${!empty dto.member_img}">
            	<a href="#"><img src="/upload/member/${dto.member_img}" class="search_profile_img"></a>&nbsp;
            </c:if>
            <div class="id_and_name_div">
                <a href="#" class="search_list_id">${dto.member_id}</a><br>
                <a class="search_list_name">${dto.member_name}</a>  
            </div>
        </div>
        <div class="search_list_follow_btn_div">
            <input type="button" value="팔로우" id="follow${dto.member_idx}" onclick="addFollowing(${dto.member_idx})" class="btn btn-primary search_list_follow_btn">
            
        </div>
    </div>
	</c:forEach>
</div>
<img src="/img/upArrow.png" id="scrollToTopBtn" class="scroll_to_top_btn" onclick="scrollToTop()">
<%@ include file="footer.jsp" %>
</body>
<script>
    // 버튼을 클릭하면 맨 위로 스크롤
    function scrollToTop() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE, and Opera
    }
    
    // 팔로잉(친구추가) - XMLHttpRequest 모듈화 사용 X
    function addFollowing(member_idx) {	
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			const followBtn = document.getElementById('follow'+result.member_idx);
    			let followingBtn = document.getElementById('following'+result.member_idx);
    			const parentDiv = followBtn.parentNode;
    			
    			if(parentDiv) {
    				parentDiv.removeChild(followBtn); // 팔로우 버튼 없앰
    				
    				if(!followingBtn) {
    					followingBtn = document.createElement("input");
    					followingBtn.type = "button";
    					followingBtn.value = "팔로잉";
    					followingBtn.id = "following"+result.member_idx;
    					followingBtn.className = "btn btn-secondary follow_list_del_btn";
    					followingBtn.onclick = () => {
    						// 함수 추가할 예정
    					}
    					
    					if(parentDiv) {
    						parentDiv.appendChild(followingBtn);
    					}
    				}
    			}
    		}
    	}
    	XHR.open('POST', 'following', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('to='+member_idx);
    }
</script>
</html>