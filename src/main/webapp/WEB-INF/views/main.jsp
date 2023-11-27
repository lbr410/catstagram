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
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script type="text/javascript" src="/js/xmlHttpRequest.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="all_div">
<div class="feed_div">
    <!-- first -->
    <div>
        <div>
            <a href="#"><img src="/img/profile2.jpg" class="feed_profile_img"></a>
            <a href="#" class="feed_profile_id">&nbsp;ramiee__l</a>
            <a class="feed_time">&nbsp;2시간</a>
        </div>
        <div class="feed_img_div">
            <img src="/img/feed_sample.jpg" class="feed_feed_img">
        </div>
        <div class="feed_icon_div">
            <a href="#"><img src="/img/heart.png" class="feed_icon_heart_img"></a>
            <a href="#"><img src="/img/reple.png" class="feed_icon_reple_img"></a>
        </div>
        <div class="like_div">
            <span class="like_span">좋아요 1004개</span>
        </div>
        <div class="feed_content_div">
            <a href="#" class="feed_content_id">ramiee__l</a>
            <span class="feed_content_content">사랑스러운 우리 뭉이 😘 뭘 그렇게 보니? 귀여운 것❤ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br><br><br><br><br></span>
        </div>
        <div class="feed_detail_btn_div">
            <a id="feedDetailBtn" class="feed_detail_btn">피드 상세 보기</a>
        </div>
        <div class="feed_comment_div">
            <span class="feed_comment">
                <a href="#" class="feed_comment_id">ss_hhwan</a>
                <div class="feed_comment_comment">뭉이가 너무 사랑스럽네요 💕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
            </span>
            <span class="feed_comment_icon">
                <img src="/img/heart.png" class="feed_comment_icon_heart_img">
                <img src="/img/trash.png" class="feed_comment_icon_trash_img">
            </span>
        </div>
        <div class="feed_comment_insert_div">
            <input type="text" name="comment_content" placeholder="댓글 달기..." maxlength="1000" class="feed_comment_insert_input">
            <img src="/img/dm.png" class="feed_comment_insert_icon_img">
        </div>
        <hr>
    </div>

    <!-- second -->
    <div>
        <div>
            <a href="#"><img src="/img/profile2.jpg" class="feed_profile_img"></a>
            <a href="#" class="feed_profile_id">&nbsp;ramiee__l</a>
            <a class="feed_time">&nbsp;2시간</a>
        </div>
        <div class="feed_img_div">
            <img src="/img/feed_sample.jpg" class="feed_feed_img">
        </div>
        <div class="feed_icon_div">
            <a href="#"><img src="/img/heart.png" class="feed_icon_heart_img"></a>
            <a href="#"><img src="/img/reple.png" class="feed_icon_reple_img"></a>
        </div>
        <div class="like_div">
            <span class="like_span">좋아요 1004개</span>
        </div>
        <div class="feed_content_div">
            <a href="#" class="feed_content_id">ramiee__l</a>
            <span class="feed_content_content">사랑스러운 우리 뭉이 😘 뭘 그렇게 보니? 귀여운 것❤</span>
        </div>
        <div class="feed_detail_btn_div">
            <a id="feedDetailBtn" class="feed_detail_btn">피드 상세 보기</a>
        </div>
        <div class="feed_comment_div">
            <span class="feed_comment">
                <a href="#" class="feed_comment_id">ss_hhwan</a>
                <div class="feed_comment_comment">뭉이가 너무 사랑스럽네요 💕</div>
            </span>
            <span class="feed_comment_icon">
                <img src="/img/heart.png" class="feed_comment_icon_heart_img">
                <img src="/img/trash.png" class="feed_comment_icon_trash_img">
            </span>
        </div>
        <div class="feed_comment_insert_div">
            <input type="text" name="comment_content" placeholder="댓글 달기..." maxlength="1000" class="feed_comment_insert_input">
            <img src="/img/dm.png" class="feed_comment_insert_icon_img">
        </div>
        <hr>
    </div>
    
</div>

<!-- Menu of Right -->
<div class="suggestion_div">
    <div>
        <c:if test="${empty sessionScope.simg}">
			<img src="/img/default_photo2.png" class="feed_profile_img">
		</c:if>
		<c:if test="${!empty sessionScope.simg}">
			<img src="/upload/member/${sessionScope.simg}" class="feed_profile_img">
		</c:if>
        <div class="id_and_name_div">
            <a href="#" class="id_and_name_id">${sessionScope.sid}</a><br>
            <a href="#" class="id_and_name_name">${sessionScope.sname}</a>
        </div>
    </div>

    <div class="suggestion_list_msg_div">
        <div class="suggestion_list_msg">회원님을 위한 추천<a href="/catstagram/suggestedFollows" class="more_suggested_follow">더보기</a></div>
    </div>

    <c:forEach var="suggestedFollowers" items="${suggestedFollowersInMain}" varStatus="loop">
	    <div class="suggestion_list_div">
	        <div class="img_and_id_and_name_div">
	        	<c:if test="${empty suggestedFollowers.following_img_of_my_following}">
					<img src="/img/default_photo2.png" class="feed_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
				</c:if>
				<c:if test="${!empty suggestedFollowers.following_img_of_my_following}">
					<img src="/upload/member/${suggestedFollowers.following_img_of_my_following}" class="feed_profile_img" data-bs-toggle="dropdown" aria-expanded="false">
				</c:if>
	            <div class="id_and_name_div">
	                <a href="#" class="suggestion_list_id">${suggestedFollowers.following_id_of_my_following}</a><br>
	                <c:if test="${suggestedFollowers.num_of_followers eq 0}">
	                	<a class="suggestion_follow_who">${suggestedFollowers.my_following_list_arr[0]}님이 팔로우합니다.</a>
	                </c:if>
	                <c:if test="${suggestedFollowers.num_of_followers ne 0}">
	                	<a class="suggestion_follow_who">${suggestedFollowers.my_following_list_arr[0]}님 외 <span id="suggestedFollowListId${loop.index}" data-index="${loop.index}" class="suggestedFollowList">${suggestedFollowers.num_of_followers}명</span>이 팔로우합니다.</a>
	                </c:if> 
	            </div>
	        </div>
	        <div class="suggestion_list_follow_btn_div">
	            <input type="button" value="팔로우" id="follow${suggestedFollowers.following_idx_of_my_following}" onclick="addFollowing(${suggestedFollowers.following_idx_of_my_following})" class="btn btn-primary suggestion_list_follow_btn">
	        </div>
	    </div>

	    <div class="dropdown-center dropdown-center22" id="dropdown-center22${loop.index}">
			<ul class="dropdown-menu dropdown-menu2">
				<c:forEach var="suggestedFollowList" items="${suggestedFollowers.my_following_list_arr}">
					<li><a class="dropdown-item menu_font" href="#">${suggestedFollowList}</a></li>
				</c:forEach>
			</ul>
		</div>
		
    </c:forEach>
    
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
    
 	// 팔로잉(친구추가) - XMLHttpRequest 모듈화 사용 X
    // 서버에서 요청받을 것은 없지만 서버가 잘 처리를 하였는지 명확하게 파악하기 위함으로 CallBack을 이용
    function addFollowing(member_idx) {	
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			const followBtn = document.getElementById('follow'+result);
    			let followingBtn = document.getElementById('following'+result);
    			const parentDiv = followBtn.parentNode;
    			
    			if(parentDiv) {
    				parentDiv.removeChild(followBtn); // 팔로우 버튼 없앰
    				
    				if(!followingBtn) {
    					followingBtn = document.createElement("input");
    					followingBtn.type = "button";
    					followingBtn.value = "팔로잉";
    					followingBtn.id = "following"+result;
    					followingBtn.className = "btn btn-secondary suggestion_list_follow_del_btn";
    					followingBtn.onclick = () => {
    						cancelFollowing(result);
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
    
    // 팔로잉 취소(친구삭제)
    function cancelFollowing(member_idx) {
    	const param = 'to='+member_idx;
    	sendRequest('cancelFollowing', param, cancelFollowingCallBack, 'POST');
    }
    
    function cancelFollowingCallBack() {
    	if(XHR.readyState == 4) {
    		if(XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			const followingBtn = document.getElementById('following'+result);
    			let followBtn = document.getElementById('follow'+result);
    			const parentDiv = followingBtn.parentNode;
    			
    			if(parentDiv) {
    				parentDiv.removeChild(followingBtn); // 팔로잉(취소) 버튼 없앰
    				
    				if(!followBtn) {
    					followBtn = document.createElement("input");
    					followBtn.type = "button";
    					followBtn.value = "팔로우";
    					followBtn.id = "follow"+result;
    					followBtn.className = "btn btn-primary suggestion_list_follow_btn";
    					followBtn.onclick = () => {
    						addFollowing(result);
    					}
    					
    					if(parentDiv) {
    						parentDiv.appendChild(followBtn);
    					}
    				}
    			}
    		}
    	}
    }
    
    document.addEventListener('DOMContentLoaded', function () {
        var activeDropdownIndexes = [];

        // 드롭다운을 활성화할 인덱스 배열
        function showDropdown(index) {
			console.log('Showing dropdown for index:', index);
            var dropdown = document.getElementById('dropdown-center22'+index);
            var suggestedFollowListElement = document.getElementById('suggestedFollowListId'+index);
            if (suggestedFollowListElement) {
                suggestedFollowListElement.classList.add('show');
            }
            if(dropdown) {
                dropdown.classList.add('show');
            }
            
        }

        // 드롭다운을 비활성화할 인덱스 배열
        function hideDropdown(index) {
        	console.log('Hiding dropdown for index:', index);
            var dropdown = document.getElementById('dropdown-center22'+index);
            var suggestedFollowListElement = document.getElementById('suggestedFollowListId'+index);
            if (suggestedFollowListElement) {
                suggestedFollowListElement.classList.remove('show');
            }
            if(dropdown) {
                dropdown.classList.remove('show');
            }
            
        }

        // 각 드롭다운에 이벤트 리스너 추가
        var suggestedFollowListElements = document.getElementsByClassName('suggestedFollowList');
        Array.from(suggestedFollowListElements).forEach(function (element) {
            console.log('Adding event listener to element:', element);
            element.addEventListener('mouseover', function (event) {
                console.log('Mouseover event:', event);
  
                var index = event.target.dataset.index;
                activeDropdownIndexes.push(index);
                showDropdown(index);
            });

            element.addEventListener('mouseout', function (event) {
                console.log('Mouseout event:', event);
                var index = event.target.dataset.index;
                var indexToRemove = activeDropdownIndexes.indexOf(index);
                if (indexToRemove !== -1) {
                    activeDropdownIndexes.splice(indexToRemove, 1);
                }

                hideDropdown(index);
            });
        });
    });
</script>
</html>