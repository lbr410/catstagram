<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/catstagram.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="catstagram_div">
    <div class="catstagram_profile_div">
    	<c:if test="${!empty dto.member_img}">
        	<img src="/upload/member/${dto.member_img}" class="catstagram_profile_img">
        </c:if>
        <c:if test="${empty dto.member_img}">
        	<img src="/img/default_photo2.png" class="catstagram_profile_img">
        </c:if>
        <div class="catstagram_profile_info_div">
            <div class="catstagram_profile_id_div">
                <span class="catstagram_profile_id_span">${dto.member_id}</span>
                <span class="catstagram_profile_update_btn_span">
					<c:if test="${sessionScope.sidx eq dto.member_idx}">
                    	<input type="button" value="프로필 수정" class="btn btn-secondary catstagram_profile_update_btn" onclick="javascript: location.href='/catstagram/account/profileUpdate'">
                    </c:if>
                    <c:if test="${sessionScope.sidx ne dto.member_idx}">
                    	<c:if test="${dto.is_follow eq 0}">
                    		<input type="button" value="팔로우" class="btn btn-primary catstagram_follow_btn" id="follow${dto.member_idx}" onclick="addFollowing(${dto.member_idx})">
                    	</c:if>
                    	<c:if test="${dto.is_follow ne 0}">
                    		<input type="button" value="팔로잉" class="btn btn-secondary follow_list_del_btn" id="following${dto.member_idx}" onclick="cancelFollowing(${dto.member_idx})">
                    	</c:if>
                    </c:if>
                </span>
                <span>
                	<c:if test="${sessionScope.sidx eq dto.member_idx}">
                    	<img src="/img/setting.png" class="catstagram_profile_setting_img" onclick="javascript: location.href='/catstagram/account/infoUpdate'">
                    </c:if>
                </span>
            </div>
            <div class="catstagram_statistics_div">
                게시물 <span class="cnt_span">${dto.feed_count_KM}</span>
                팔로워 
                <span class="cnt_span2" id="follow_count_span"
                onclick="<c:if test='${sessionScope.sidx eq dto.member_idx}'>location.href='/catstagram/account/follower'</c:if><c:if test='${sessionScope.sidx ne dto.member_idx}'>location.href='/catstagram/${dto.member_id}/follower'</c:if>">
                	${dto.follower_count_KM}
                </span>
                팔로잉 
                <span class="cnt_span2" 
                onclick="<c:if test='${sessionScope.sidx eq dto.member_idx}'>location.href='/catstagram/account/following'</c:if><c:if test='${sessionScope.sidx ne dto.member_idx}'>location.href='/catstagram/${dto.member_id}/following'</c:if>">
                	${dto.following_count_KM}
                </span>
            </div>
            <div class="catstagram_profile_name_div">
                ${dto.member_name}
            </div>
            <div class="catstagram_profile_intro_div">
                ${dto.member_intro}
            </div>
        </div>
    </div>
    <div class="catstagram_feed_div">
        
    	<div class="catstagram_feed_img_div">
    		<img src="/img/profile2.jpg" class="catstagram_feed_img" id="feedDetailBtn">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
    	</div>
        <div class="catstagram_feed_img_div">
    		<img src="/img/profile2.jpg" class="catstagram_feed_img" id="feedDetailBtn">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
    	</div>
        <div class="catstagram_feed_img_div">
    		<img src="/img/profile2.jpg" class="catstagram_feed_img" id="feedDetailBtn">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
    	</div>
        <div class="catstagram_feed_img_div">
    		<img src="/img/profile2.jpg" class="catstagram_feed_img">
            <img src="/img/profile2.jpg" class="catstagram_feed_img">
    	</div>
    </div>
</div>



<!-- feed detail -->
<div id="feedDetail" class="feed_detail_div">
    <span id="closeFeedDetail" class="feed_detail_close_btn">&times;</span>
    <div class="feed_detail_content_div">
        <div class="feed_detail_img_div">
            <img src="/img/feed_sample.jpg" class="feed_detail_img">
        </div>

        <div class="feed_detail_content_content_div">
            <div class="feed_detail_info_div">
                <div class="feed_detail_info_span">
                    <a href="#"><img src="/img/profile2.jpg" class="feed_detail_profile_img"></a>
                    <a href="#" class="feed_profile_id">&nbsp;ramiee__l</a>
                </div>
                <div class="feed_detail_more_view_btn_div">
                    <img src="/img/3dots.png" class="feed_detail_more_view_btn" data-bs-toggle="dropdown" aria-expanded="false">
                    <div class="dropdown-center">
                        <ul class="dropdown-menu dropdown-menu2">
                            <li><a class="dropdown-item menu_font" href="#">수정</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item menu_font" href="#">삭제</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="feed_detail_content_content">
                <p class="feed_detail_content_content_p">
                    사랑스러운 우리 뭉이 😍<br><br>오래오래 행복하자!<br><br><br>❤❤❤❤❤❤
                </p>
            </div>
            <div class="feed_detail_content_time_div">2시간</div>
            <div class="feed_detail_content_comment_div">
                <!-- 첫 번째 댓글 -->
                <div class="feed_detail_comment_div">
                    <span class="feed_detail_comment">
                        <a href="#"><img src="/img/profile2.jpg" class="feed_detail_profile_comment_img"></a> 
                        <span class="feed_detail_comment_comment">
                            <a href="#" class="feed_detail_comment_id">ss_hhwan</a>
                            뭉이가 너무 사랑스럽네요 💕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br><br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>
                        </span>
                    </span>
                    <span class="feed_detail_comment_icon">
                        <img src="/img/heart.png" class="feed_comment_icon_heart_img">
                        <img src="/img/trash.png" class="feed_comment_icon_trash_img">
                    </span>
                </div>
                <div class="feed_detail_comment_time_like_div">
                    1시간&nbsp;&nbsp;좋아요 1개
                </div>

                <!-- 두 번째 댓글 -->
                <div class="feed_detail_comment_div">
                    <span class="feed_detail_comment">
                        <a href="#"><img src="/img/profile2.jpg" class="feed_detail_profile_comment_img"></a> 
                        <span class="feed_detail_comment_comment">
                            <a href="#" class="feed_detail_comment_id">ss_hhwan</a>
                            뭉이가 너무 사랑스럽네요 💕
                        </span>
                    </span>
                    <span class="feed_detail_comment_icon">
                        <img src="/img/heart.png" class="feed_comment_icon_heart_img">
                        <img src="/img/trash.png" class="feed_comment_icon_trash_img">
                    </span>
                </div>
                <div class="feed_detail_comment_time_like_div">
                    1시간&nbsp;&nbsp;
                </div>

                <!-- 세 번째 댓글 -->
                <div class="feed_detail_comment_div">
                    <span class="feed_detail_comment">
                        <a href="#"><img src="/img/profile2.jpg" class="feed_detail_profile_comment_img"></a> 
                        <span class="feed_detail_comment_comment">
                            <a href="#" class="feed_detail_comment_id">ss_hhwan</a>
                            뭉이가 너무 사랑스럽네요 💕
                        </span>
                    </span>
                    <span class="feed_detail_comment_icon">
                        <img src="/img/heart.png" class="feed_comment_icon_heart_img">
                        <img src="/img/trash.png" class="feed_comment_icon_trash_img">
                    </span>
                </div>
                <div class="feed_detail_comment_time_like_div">
                    1시간&nbsp;&nbsp;좋아요 1개
                </div>
            </div>

            <div class="feed_detail_comment_write_div">
                <div class="feed_detail_icon_div">
                    <a href="#"><img src="/img/heart.png" class="feed_icon_heart_img"></a>
                    <a href="#"><img src="/img/reple.png" class="feed_icon_reple_img"></a>
                </div>
                <div class="feed_detail_like_div">
                    <div class="feed_detail_like">
                        좋아요 1004개
                    </div>
                </div>
                <div class="feed_detail_comment_write_write_div">
                    <div class="feed_detail_comment_input">
                        <input type="text" name="comment_content" placeholder="댓글 달기..." maxlength="1000" class="feed_detail_comment_insert_input">
                        <img src="/img/dm.png" class="feed_comment_insert_icon_img">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<img src="/img/upArrow.png" id="scrollToTopBtn" class="scroll_to_top_btn" onclick="scrollToTop()">
<%@ include file="footer.jsp" %>
</body>
<script>
    // 피드 상세 보기
    document.getElementById('feedDetailBtn').addEventListener('click', function() {
        var modal = document.getElementById("feedDetail");
        modal.style.display = "flex";
        var modalContent = document.querySelector("feed_detail_content_div");
        var windowHeight = window.innerHeight;
        var modalHeight = modalContent.clientHeight;
        var topMargin = (windowHeight - modalHeight) / 2;
        modalContent.style.marginTop = topMargin + "px";
    });

    // X버튼 누르면 피드 상세 보기 닫기
    document.getElementById('closeFeedDetail').addEventListener('click', function() {
        document.getElementById('feedDetail').style.display = 'none';
    });

    // 피드 상세 보기 영역이 아닌 부분 클릭해도 피드 상세 보기 닫기
    document.addEventListener('click', function(event) {
        if(event.target === document.getElementById('feedDetail')) {
            document.getElementById('feedDetail').style.display = 'none';
        }
    });

    // 위 화살표 버튼을 클릭하면 맨 위로 스크롤
    function scrollToTop() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE, and Opera
    }
    
 	// 팔로잉(친구추가)
    function addFollowing(member_idx) {	
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			const followBtn = document.getElementById('follow'+result.to);
    			let followingBtn = document.getElementById('following'+result.to);
    			const parentDiv = followBtn.parentNode;
    			
    			if(parentDiv) {
    				parentDiv.removeChild(followBtn); // 팔로우 버튼 없앰
    				document.getElementById('follow_count_span').innerHTML = result.followerCount;
    				
    				if(!followingBtn) {
    					followingBtn = document.createElement("input");
    					followingBtn.type = "button";
    					followingBtn.value = "팔로잉";
    					followingBtn.id = "following"+result.to;
    					followingBtn.className = "btn btn-secondary follow_list_del_btn";
    					followingBtn.onclick = () => {
    						cancelFollowing(result.to);
    					}
    					
    					if(parentDiv) {
    						parentDiv.appendChild(followingBtn);
    					}
    				}
    			}
    		}
    	}
    	XHR.open('POST', '/catstagram/account/followingCount', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('to='+member_idx);
    }
    
    // 팔로잉 취소(친구삭제)
    function cancelFollowing(member_idx) {
    	const param = 'to='+member_idx;
    	sendRequest('/catstagram/account/cancelFollowingCount', param, cancelFollowingCallBack, 'POST');
    }
    
    function cancelFollowingCallBack() {
    	if(XHR.readyState == 4) {
    		if(XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			const followingBtn = document.getElementById('following'+result.to);
    			let followBtn = document.getElementById('follow'+result.to);
    			const parentDiv = followingBtn.parentNode;
    			
    			if(parentDiv) {
    				parentDiv.removeChild(followingBtn); // 팔로잉(취소) 버튼 없앰
    				document.getElementById('follow_count_span').innerHTML = result.followerCount;
    				
    				if(!followBtn) {
    					followBtn = document.createElement("input");
    					followBtn.type = "button";
    					followBtn.value = "팔로우";
    					followBtn.id = "follow"+result.to;
    					followBtn.className = "btn btn-primary catstagram_follow_btn";
    					followBtn.onclick = () => {
    						addFollowing(result.to);
    					}
    					
    					if(parentDiv) {
    						parentDiv.appendChild(followBtn);
    					}
    				}
    			}
    		}
    	}
    }
</script>
</html>