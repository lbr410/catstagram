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
    <c:forEach var="mainFollowingFeed" items="${mainFollowingFeed}" varStatus="loop">
	    <div>
	        <div>
	            <c:if test="${empty mainFollowingFeed.member_img}">
					<img src="/img/default_photo2.png" class="feed_profile_img">
				</c:if>
				<c:if test="${!empty mainFollowingFeed.member_img}">
					<img src="/upload/member/${mainFollowingFeed.member_img}" class="feed_profile_img">
				</c:if>
	            <a href="#" class="feed_profile_id">&nbsp;${mainFollowingFeed.member_id}</a>
	            <a class="feed_time">&nbsp;${mainFollowingFeed.feed_date_time}</a>
	        </div>
	        <div class="feed_img_div">
	            <img src="/upload/feed/${mainFollowingFeed.feed_img}" class="feed_feed_img">
	        </div>
	        <div class="feed_icon_div">
	            <a href="#"><img src="/img/heart.png" class="feed_icon_heart_img"></a>
	            <a href="#"><img src="/img/reple.png" class="feed_icon_reple_img"></a>
	        </div>
	        <div class="like_div">
	            <span class="like_span">좋아요 ${mainFollowingFeed.feed_like_count}개</span>
	        </div>
	        <div class="feed_content_div">
	            <a href="#" class="feed_content_id">${mainFollowingFeed.member_id}</a>
	            <span class="feed_content_content">${mainFollowingFeed.feed_content}</span>
	        </div>
	        <div class="feed_detail_btn_div">
	            <a id="feedDetailBtn${loop.index}" class="feed_detail_btn">피드 상세 보기</a>
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
	            <input type="text" name="comment_content" placeholder="댓글 달기..." maxlength="1000" class="feed_comment_insert_input" onkeydown="feedCommentInsert(event)">
	            <img src="/img/dm.png" class="feed_comment_insert_icon_img">
	        </div>
	        <hr>
	    </div>
	    
		<!-- feed detail -->
		<div id="feedDetail${loop.index}" class="feed_detail_div">
		    <span id="closeFeedDetail" class="feed_detail_close_btn">&times;</span>
		    <div class="feed_detail_content_div">
		        <div class="feed_detail_img_div">
		            <img src="/upload/feed/${mainFollowingFeed.feed_img}" class="feed_detail_img">
		        </div>
		
		        <div class="feed_detail_content_content_div">
		            <div class="feed_detail_info_div">
		                <div class="feed_detail_info_span">
		                    
		                    <c:if test="${empty mainFollowingFeed.member_img}">
								<img src="/img/default_photo2.png" class="feed_detail_profile_img">
							</c:if>
							<c:if test="${!empty mainFollowingFeed.member_img}">
								<img src="/upload/member/${mainFollowingFeed.member_img}" class="feed_detail_profile_img">
							</c:if>
							
		                    <a href="#" class="feed_profile_id">&nbsp;${mainFollowingFeed.member_id}</a>
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
		                    ${mainFollowingFeed.feed_content}
		                </p>
		            </div>
		            <div class="feed_detail_content_time_div">${mainFollowingFeed.feed_date_time}</div>
		            <div class="feed_detail_content_comment_div">
		                <!-- 첫 번째 댓글 -->
		                <div class="feed_detail_comment_div">
		                    <span class="feed_detail_comment">
		                        <a href="#"><img src="/img/profile2.jpg" class="feed_detail_profile_comment_img"></a> 
		                        <span class="feed_detail_comment_comment">
		                            <a href="#" class="feed_detail_comment_id">ss_hhwan</a>
		                            뭉이가 너무 사랑스럽네요 💕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>
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
		                        좋아요 ${mainFollowingFeed.feed_like_count}개
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
	    
	    
    </c:forEach>
    
   
    <!-- 테스트로 남겨둔 것. 나중에 지우기! -->
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
					<img src="/img/default_photo2.png" class="feed_profile_img2">
				</c:if>
				<c:if test="${!empty suggestedFollowers.following_img_of_my_following}">
					<img src="/upload/member/${suggestedFollowers.following_img_of_my_following}" class="feed_profile_img2">
				</c:if>
	            <div class="id_and_name_div">
	            	<div class="id_and_name_div2">
		                <a href="#" class="suggestion_list_id">${suggestedFollowers.following_id_of_my_following}</a><br>
		                <c:if test="${suggestedFollowers.num_of_followers eq 0}">
		                	<a class="suggestion_follow_who">${suggestedFollowers.my_following_list_arr[0]}님이 팔로우합니다.</a>
		                </c:if>
		                <c:if test="${suggestedFollowers.num_of_followers ne 0}">
		                	<span class="suggestion_follow_who">${suggestedFollowers.my_following_list_arr[0]}님 외 
		                	<span id="suggestedFollowListId${loop.index}"
		                		class="suggestedFollowList" data-bs-toggle="dropdown" aria-expanded="false">
		                		${suggestedFollowers.num_of_followers}명</span>이 팔로우합니다.
		                	
								<div class="dropdown">
									<ul class="dropdown-menu">
										<c:forEach var="suggestedFollowList" items="${suggestedFollowers.my_following_list_arr}">
											<li><a class="dropdown-item menu_font" href="#">${suggestedFollowList}</a></li>
										</c:forEach>
									</ul>
			                	</div>
							</span>
		                </c:if>
	                </div>
	            </div>
	        </div>
	        <div class="suggestion_list_follow_btn_div">
	            <input type="button" value="팔로우" id="follow${suggestedFollowers.following_idx_of_my_following}" onclick="addFollowing(${suggestedFollowers.following_idx_of_my_following})" class="btn btn-primary suggestion_list_follow_btn">
	        </div>
	    </div>
    </c:forEach>
</div>
</div>


<img src="/img/upArrow.png" id="scrollToTopBtn" class="scroll_to_top_btn" onclick="scrollToTop()">
<%@ include file="footer.jsp" %>
</body>
<script>
    // 피드 상세 보기
    /*document.getElementById('feedDetailBtn').addEventListener('click', function() {
        let modal = document.getElementById('feedDetail');
        modal.style.display = 'flex';
        let modalContent = document.querySelector('feed_detail_content_div');
        let windowHeight = window.innerHeight;
        let modalHeight = modalContent.clientHeight;
        let topMargin = (windowHeight - modalHeight) / 2;
        modalContent.style.marginTop = topMargin + 'px';
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
    });*/
    
    
    
    
 	// 피드 상세 보기
    document.addEventListener('DOMContentLoaded', function() {
        // forEach 루프로 각각의 피드에 대한 이벤트 리스너 추가
        <c:forEach var="mainFollowingFeed" items="${mainFollowingFeed}" varStatus="loop">
            document.getElementById('feedDetailBtn${loop.index}').addEventListener('click', function() {
                // 해당 피드의 모달을 보이게 함
                document.getElementById('feedDetail${loop.index}').style.display = 'flex';
                let modalContent = document.querySelector('.feed_detail_content_div');
                let windowHeight = window.innerHeight;
                let modalHeight = modalContent.clientHeight;
                let topMargin = (windowHeight - modalHeight) / 2;
                modalContent.style.marginTop = topMargin + 'px';
            });
        </c:forEach>

		// X버튼 누르면 피드 상세 보기 닫기
        document.querySelectorAll('.feed_detail_close_btn').forEach(function(closeBtn) {
            closeBtn.addEventListener('click', function() {
                this.closest('.feed_detail_div').style.display = 'none';
            });
        });

		// 피드 상세 보기 영역이 아닌 부분 클릭해도 피드 상세 보기 닫기
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('feed_detail_div')) {
                event.target.style.display = 'none';
            }
        });
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
    
    function feedCommentInsert(event) {
        if (event.key === 'Enter') {
            // 엔터 키가 눌렸을 때 수행할 동작
            //event.preventDefault(); // 폼 전송 방지
            window.alert('asdfsdf'); // 원하는 함수 호출
        }
    }
</script>
</html>