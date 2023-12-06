<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	        	<c:if test="${empty mainFollowingFeed.feed_like_idx}">
		            <img src="/img/heart.png" class="feed_icon_heart_img"
		            onclick="likeFeed(${mainFollowingFeed.feed_idx})" id="previewHeart${mainFollowingFeed.feed_idx}"> <!-- 미리보기 좋아요 / 나중에 주석 지우기 -->
	            </c:if>
	            <c:if test="${!empty mainFollowingFeed.feed_like_idx}">
		            <img src="/img/heart2.png" class="feed_icon_heart_img"
		            onclick="likeFeedCancel(${mainFollowingFeed.feed_idx})" id="previewHeartFull${mainFollowingFeed.feed_idx}">
	            </c:if>
	            <img src="/img/reple.png" class="feed_icon_reple_img" id="repleBtn${loop.index}">
	        </div>
	        <div class="like_div" id="previewLikeCountSpan${mainFollowingFeed.feed_idx}">
	            <c:if test="${mainFollowingFeed.feed_like_count ne 0}">
	            	좋아요 <span id="previewLikeCount${mainFollowingFeed.feed_idx}">${mainFollowingFeed.feed_like_count}</span>개
	            </c:if>
	            <c:if test="${mainFollowingFeed.feed_like_count eq 0}">
	            	아직 좋아요가 없습니다.
	            </c:if>
	        </div>
	        <div class="feed_content_div">
	            <a href="#" class="feed_content_id">${mainFollowingFeed.member_id}</a>
	            <span class="feed_content_content">${mainFollowingFeed.feed_content}</span>
	        </div>
	        <div class="feed_detail_btn_div">
	            <a id="feedDetailBtn${loop.index}" class="feed_detail_btn">피드 상세 보기</a>
	        </div>
	        
	        
		    <div class="feed_comment_div" id="feedCommentDiv${mainFollowingFeed.feed_idx}">
		        <c:if test="${!empty mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].comment_content}">
			            <span class="feed_comment" id="feedCommentContentSpan${mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].comment_idx}">
			                <a href="#" class="feed_comment_id">${mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].member_id}</a>
			                <div class="feed_comment_comment">
			                	${mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].comment_content}
			                </div>
			            </span>
			            <span class="feed_comment_icon" id="feedCommentIconSpan${mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].comment_idx}">
			                <c:if test="${mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].member_idx eq sessionScope.sidx
			                				|| mainFollowingFeed.member_idx eq sessionScope.sidx}">
			                	<img src="/img/trash.png" class="feed_comment_icon_trash_img"
			                	onclick="feedCommentDel(${mainFollowingFeed.feed_comment_list[fn:length(mainFollowingFeed.feed_comment_list) - 1].comment_idx})">
			                </c:if>
			                <img src="/img/heart.png" class="feed_comment_icon_heart_img">
			            </span>
		        </c:if>
		    </div>
		    
		    
	        <div class="feed_comment_insert_div">
	            <input type="text" name="comment_content" placeholder="댓글 달기..." 
		            id="feedComment${mainFollowingFeed.feed_idx}" maxlength="1000" 
		            class="feed_comment_insert_input" onkeydown="feedCommentInsertEnterKey(event, ${mainFollowingFeed.feed_idx}, ${mainFollowingFeed.member_idx})">
	            <img src="/img/dm.png" class="feed_comment_insert_icon_img" onclick="feedCommentInsertClick(${mainFollowingFeed.feed_idx}, ${mainFollowingFeed.member_idx})">
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
		                
		                <c:if test="${mainFollowingFeed.member_idx eq sessionScope.sidx}">
			                <div class="feed_detail_more_view_btn_div">
			                    <img src="/img/3dots.png" class="feed_detail_more_view_btn" data-bs-toggle="dropdown" aria-expanded="false">
			                    <div class="dropdown-center">
			                        <ul class="dropdown-menu dropdown-menu2">
			                            <li><a class="dropdown-item menu_font" href="/catstagram/feedUpdate?feed_idx=${mainFollowingFeed.feed_idx}">수정</a></li>
			                            <li><hr class="dropdown-divider"></li>
		                            	<li>
			                            	<form id="feedDelForm${mainFollowingFeed.feed_idx}" action="/catstagram/feedDel" method="post">
		                            			<input type="hidden" name="feed_idx" value="${mainFollowingFeed.feed_idx}">
		                            			<a class="dropdown-item menu_font" onclick="feedDel(${mainFollowingFeed.feed_idx})">삭제</a>
		                            		</form>
	                            		</li>
			                        </ul>
			                    </div>
			                </div>
		                </c:if>
		            </div>
		            <div class="feed_detail_content_content">
		                <p class="feed_detail_content_content_p">
		                    ${mainFollowingFeed.feed_content}
		                </p>
		            </div>
		            <div class="feed_detail_content_time_div">${mainFollowingFeed.feed_date_time}</div>
		            
		            
		            <div class="feed_detail_content_comment_div" id="feedDetailContentCommentDiv${mainFollowingFeed.feed_idx}">
		                <c:forEach var="feedContentList" items="${mainFollowingFeed.feed_comment_list}">
			                <div class="feed_detail_comment_div" id="feedDetailCommentDiv${feedContentList.comment_idx}">
			                    <span class="feed_detail_comment"> 
			                        <c:if test="${empty feedContentList.member_img}">
										<img src="/img/default_photo2.png" class="feed_detail_profile_comment_img">
									</c:if>
									<c:if test="${!empty feedContentList.member_img}">
										<img src="/upload/member/${feedContentList.member_img}" class="feed_detail_profile_comment_img">
									</c:if>
			                        
			                        <span class="feed_detail_comment_comment">
			                            <a href="#" class="feed_detail_comment_id">${feedContentList.member_id}</a>
			                            ${feedContentList.comment_content}
			                        </span>
			                    </span>
			                    <span class="feed_detail_comment_icon">
			                        <c:if test="${mainFollowingFeed.member_idx eq sessionScope.sidx
			                        				|| feedContentList.member_idx eq sessionScope.sidx}">
				                        <img src="/img/trash.png" class="feed_comment_icon_trash_img"
				                        onclick="feedCommentDel(${feedContentList.comment_idx})">
			                        </c:if>
			                        <img src="/img/heart.png" class="feed_comment_icon_heart_img2">
			                    </span>
			                </div>
			                <div class="feed_detail_comment_time_like_div" id="feedDetailCommentTimeLikeDiv${feedContentList.comment_idx}">
			                    ${feedContentList.comment_date_time}&nbsp;&nbsp;좋아요 ${feedContentList.comment_like_count}개
			                </div>
		                </c:forEach>
		            </div>
		            
		            
		
		            <div class="feed_detail_comment_write_div">
		                <div class="feed_detail_icon_div">
		                	<!-- 상세보기 좋아요 / 나중에 주석 지우기 -->
		                    <c:if test="${empty mainFollowingFeed.feed_like_idx}">
					            <img src="/img/heart.png" class="feed_icon_heart_img"
					            onclick="likeFeed(${mainFollowingFeed.feed_idx})" id="detailHeart${mainFollowingFeed.feed_idx}">
				            </c:if>
				            <c:if test="${!empty mainFollowingFeed.feed_like_idx}">
					            <img src="/img/heart2.png" class="feed_icon_heart_img"
					            onclick="likeFeedCancel(${mainFollowingFeed.feed_idx})" id="detailHeartFull${mainFollowingFeed.feed_idx}">
				            </c:if>
		                    <img src="/img/reple.png" class="feed_icon_reple_img">
		                </div>
		                <div class="feed_detail_like_div">
		                    <div class="feed_detail_like" id="detailLikeCountSpan${mainFollowingFeed.feed_idx}">
		                        <c:if test="${mainFollowingFeed.feed_like_count ne 0}">
	            					좋아요 <span id="detailLikeCount${mainFollowingFeed.feed_idx}">${mainFollowingFeed.feed_like_count}</span>개
	            				</c:if>
	            				<c:if test="${mainFollowingFeed.feed_like_count eq 0}">
	            					아직 좋아요가 없습니다.
	            				</c:if>
		                    </div>
		                </div>
		                <div class="feed_detail_comment_write_write_div">
		                    <div class="feed_detail_comment_input">
		                        <input type="text" name="comment_content" placeholder="댓글 달기..."
		                        	id="feedDetailComment${mainFollowingFeed.feed_idx}"
		                        	maxlength="1000" class="feed_detail_comment_insert_input" onkeydown="feedDetailCommentInsertEnterKey(event, ${mainFollowingFeed.feed_idx}, ${mainFollowingFeed.member_idx})">
		                        <img src="/img/dm.png" class="feed_comment_insert_icon_img" onclick="feedDetailCommentInsertClick(${mainFollowingFeed.feed_idx}, ${mainFollowingFeed.member_idx})">
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
    </c:forEach>    
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
        
        <c:forEach var="mainFollowingFeed" items="${mainFollowingFeed}" varStatus="loop">
	        document.getElementById('repleBtn${loop.index}').addEventListener('click', function() {
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
    
    // 피드 미리보기 댓글 달기(엔터키 눌렀을 시 실행되게)
    function feedCommentInsertEnterKey(event, feed_idx, member_idx) {
    	let feedComment = document.getElementById('feedComment'+feed_idx).value;
        if(event.key == 'Enter') {
            // 엔터 키가 눌렸을 때 수행할 동작
        	if(feedComment == '') {
        		window.alert('댓글을 입력해주세요.');
        	} else {
        		//event.preventDefault(); // 폼 전송 방지
                feedCommentInsert(feed_idx, feedComment, member_idx);
        	}
        }
    }
    
    // 피드 미리보기 댓글 달기(버튼 클릭 시)
    function feedCommentInsertClick(feed_idx, member_idx) {
    	let feedComment = document.getElementById('feedComment'+feed_idx).value;
    	if(feedComment == '') {
    		window.alert('댓글을 입력해주세요.');
    	} else {
	    	feedCommentInsert(feed_idx, feedComment, member_idx);
    	}
    }
    
    // 피드 상세보기 댓글 달기(엔터키 눌렀을 시 실행되게)
    function feedDetailCommentInsertEnterKey(event, feed_idx, member_idx) {
    	let feedDetailComment = document.getElementById('feedDetailComment'+feed_idx).value;
        if(event.key == 'Enter') {
            // 엔터 키가 눌렸을 때 수행할 동작
        	if(feedDetailComment == '') {
        		window.alert('댓글을 입력해주세요.');
        	} else {
        		//event.preventDefault(); // 폼 전송 방지
                feedCommentInsert(feed_idx, feedDetailComment, member_idx);
        	}
        }
    }
    
    // 피드 상세보기 댓글 달기(버튼 클릭 시)
    function feedDetailCommentInsertClick(feed_idx, member_idx) {
    	let feedDetailComment = document.getElementById('feedDetailComment'+feed_idx).value;
    	if(feedDetailComment == '') {
    		window.alert('댓글을 입력해주세요.');
    	} else {
	    	feedCommentInsert(feed_idx, feedDetailComment, member_idx);
    	}
    }
    
    // 피드 댓글 달기
    function feedCommentInsert(feed_idx, feedComment, member_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			// 피드 미리 보기 댓글
    			const feedCommentDiv = document.getElementById('feedCommentDiv'+feed_idx);
    			feedCommentDiv.innerHTML = '';
    			
    			const commentSpan2 = document.createElement('span');
    			commentSpan2.classList.add('feed_comment');
    			commentSpan2.setAttribute('id', 'feedCommentContentSpan'+result[result.length-1].comment_idx);
    			
    			const commentIdLink2 = document.createElement('a');
    			commentIdLink2.href = '#';
				commentIdLink2.classList.add('feed_comment_id');
				commentIdLink2.textContent = result[result.length-1].member_id;
    			
				const commentDiv2 = document.createElement('div');
				commentDiv2.classList.add('feed_comment_comment');
				commentDiv2.innerHTML = result[result.length-1].comment_content;
				commentSpan2.appendChild(commentIdLink2);
				commentSpan2.appendChild(commentDiv2);
				
				const commentSpan3 = document.createElement('span');
				commentSpan3.classList.add('feed_comment_icon');
				commentSpan3.setAttribute('id', 'feedCommentIconSpan'+result[result.length-1].comment_idx);
				
				let trashImgElement2 = document.createElement('img');
				trashImgElement2.src = '/img/trash.png';
				trashImgElement2.classList.add('feed_comment_icon_trash_img');
				trashImgElement2.onclick = () => {
					feedCommentDel(result[result.length-1].comment_idx);
				}
				if(member_idx == ${sessionScope.sidx} || result[result.length-1].member_idx == ${sessionScope.sidx}) {
					commentSpan3.appendChild(trashImgElement2);
				}
				
				let heartImgElement2 = document.createElement('img');
				heartImgElement2.src = '/img/heart.png';
				heartImgElement2.classList.add('feed_comment_icon_heart_img2');
				commentSpan3.appendChild(heartImgElement2);
				
				feedCommentDiv.appendChild(commentSpan2);
				feedCommentDiv.appendChild(commentSpan3);
				
    			// 피드 상세 보기 댓글 목록
    			const feedDetailContentCommentDiv = document.getElementById('feedDetailContentCommentDiv'+feed_idx);
    			feedDetailContentCommentDiv.innerHTML = '';
    			
    			for(let i=0; i<result.length; i++) {
    				const commentDiv = document.createElement('div');
        			commentDiv.classList.add('feed_detail_comment_div');
        			commentDiv.setAttribute('id', 'feedDetailCommentDiv'+result[i].comment_idx);
        			
        			const commentSpan = document.createElement('span');
        			commentSpan.classList.add('feed_detail_comment');
        			
        			if(result[i].member_img) {
        				let imgElement = document.createElement('img');
        				imgElement.src = '/upload/member/'+result[i].member_img;
        				imgElement.classList.add('feed_detail_profile_comment_img');
        				commentSpan.appendChild(imgElement);
        			} else {
        				let imgElement = document.createElement('img');
        				imgElement.src = '/img/default_photo2.png';
        				imgElement.classList.add('feed_detail_profile_comment_img');
        				commentSpan.appendChild(imgElement);
        			}
        			
        			const commentCommentSpan = document.createElement('span');
        			commentCommentSpan.classList.add('feed_detail_comment_comment2');
        			commentSpan.appendChild(commentCommentSpan);
        			
        			const commentIdLink = document.createElement('a');
    				commentIdLink.textContent = result[i].member_id;
    				commentIdLink.href = '#';
    				commentIdLink.classList.add('feed_detail_comment_id2');
    				
    				const commentContent = document.createTextNode(result[i].comment_content);
    				
    				commentCommentSpan.appendChild(commentIdLink);
					commentCommentSpan.appendChild(commentContent);
										
					const commentIconSpan = document.createElement('span');
					commentIconSpan.classList.add('feed_detail_comment_icon');
					
    				let trashImgElement = document.createElement('img');
    				trashImgElement.src = '/img/trash.png';
    				trashImgElement.classList.add('feed_comment_icon_trash_img');
    				trashImgElement.onclick = () => {
    					feedCommentDel(result[i].comment_idx);
					}
    				if(member_idx == ${sessionScope.sidx} || result[i].member_idx == ${sessionScope.sidx}) {
    					commentIconSpan.appendChild(trashImgElement);
    				}
    				
					let heartImgElement = document.createElement('img');
					heartImgElement.src = '/img/heart.png';
					heartImgElement.classList.add('feed_comment_icon_heart_img2');
    				commentIconSpan.appendChild(heartImgElement);

					commentDiv.appendChild(commentSpan);
					commentDiv.appendChild(commentIconSpan);

					const commentTimeLikeDiv = document.createElement('div');
					commentTimeLikeDiv.classList.add('feed_detail_comment_time_like_div');
					commentTimeLikeDiv.innerHTML = result[i].comment_date_time + '&nbsp;&nbsp;좋아요 ' + result[i].comment_like_count +'개';
					commentTimeLikeDiv.setAttribute('id', 'feedDetailCommentTimeLikeDiv'+result[i].comment_idx);

					feedDetailContentCommentDiv.appendChild(commentDiv);
					feedDetailContentCommentDiv.appendChild(commentTimeLikeDiv);
    			}			
    		}
    	}
    	
    	XHR.open('POST', 'feedCommentInsert', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('feed_idx='+feed_idx+'&comment_content='+feedComment);
    	
    	document.getElementById('feedComment'+feed_idx).value = '';
    	document.getElementById('feedDetailComment'+feed_idx).value = '';
    }
    
    // 피드 댓글 삭제
    function feedCommentDel(comment_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const feedCommentContentSpan = document.getElementById('feedCommentContentSpan'+comment_idx);
    			const feedCommentIconSpan = document.getElementById('feedCommentIconSpan'+comment_idx);
    			const feedDetailCommentDiv = document.getElementById('feedDetailCommentDiv'+comment_idx);
    			const feedDetailCommentTimeLikeDiv = document.getElementById('feedDetailCommentTimeLikeDiv'+comment_idx);
    			
    			if(feedCommentContentSpan) {
    				feedCommentContentSpan.remove();    				
    			}
    			if(feedCommentIconSpan) {
    				feedCommentIconSpan.remove();    				
    			}
    			if(feedDetailCommentDiv) {
	    			feedDetailCommentDiv.remove();    				
    			}
    			if(feedDetailCommentTimeLikeDiv) {
	    			feedDetailCommentTimeLikeDiv.remove();    				
    			}
    		}
    	}
    	
    	XHR.open('POST', 'feedCommentDel', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('comment_idx='+comment_idx);
    }
    
    // 피드 삭제
    function feedDel(feed_idx) {
    	document.getElementById('feedDelForm'+feed_idx).submit();
    }
    
    // 피드 좋아요
   	function likeFeed(feed_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = () => {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const feedLikeCount = JSON.parse(XHR.responseText);
    			
    			// 좋아요 하트색 변경 & 좋아요수 증가 보이기
    			// 미리보기 피드
    			let oldPreviewFeedLike = document.getElementById('previewHeart'+feed_idx);
    			let newPreviewFeedLike = document.createElement('img');
    			newPreviewFeedLike.src = '/img/heart2.png';
    			newPreviewFeedLike.classList = 'feed_icon_heart_img';
    			newPreviewFeedLike.id = 'previewHeartFull'+feed_idx;
    			newPreviewFeedLike.onclick = () => {
    				likeFeedCancel(feed_idx); 			    
    			}
    			newPreviewFeedLike.style.transition = 'transform 0.2s ease-in-out';
    			newPreviewFeedLike.style.transform = 'scale(1.2)';  // 커졌다가
    			setTimeout(() => {
    			    newPreviewFeedLike.style.transform = 'scale(1)';  // 다시 원래 크기로
    			}, 100);
    			
    			oldPreviewFeedLike.parentNode.replaceChild(newPreviewFeedLike, oldPreviewFeedLike);
    			document.getElementById('previewLikeCountSpan'+feed_idx).innerHTML = '좋아요 '+feedLikeCount+'개';
    			
    			// 상세보기 피드
    			let oldDetailFeedLike = document.getElementById('detailHeart'+feed_idx);
    			let newDetailFeedLike = document.createElement('img');
    			newDetailFeedLike.src = '/img/heart2.png';
    			newDetailFeedLike.classList = 'feed_icon_heart_img';
    			newDetailFeedLike.id = 'detailHeartFull'+feed_idx;
    			newDetailFeedLike.onclick = () => {
    				likeFeedCancel(feed_idx);
    			}
    			newDetailFeedLike.style.transition = 'transform 0.2s ease-in-out';
    			newDetailFeedLike.style.transform = 'scale(1.2)';  // 커졌다가
    			setTimeout(() => {
    				newDetailFeedLike.style.transform = 'scale(1)';  // 다시 원래 크기로
    			}, 100);
    			oldDetailFeedLike.parentNode.replaceChild(newDetailFeedLike, oldDetailFeedLike);
    			document.getElementById('detailLikeCountSpan'+feed_idx).innerHTML = '좋아요 '+feedLikeCount+'개';
    		}
    	}
    	
    	XHR.open('POST', 'likeFeed', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('feed_idx='+feed_idx);
    }
    
    // 피드 좋아요 취소
    function likeFeedCancel(feed_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = () => {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const feedLikeCount = JSON.parse(XHR.responseText);
    			
    			// 좋아요 하트색 변경 & 좋아요수 감소 보이기
    			// 미리보기 피드
    			let oldPreviewFeedLike = document.getElementById('previewHeartFull'+feed_idx);
    			let newPreviewFeedLike = document.createElement('img');
    			newPreviewFeedLike.src = '/img/heart.png';
    			newPreviewFeedLike.classList = 'feed_icon_heart_img';
    			newPreviewFeedLike.id = 'previewHeart'+feed_idx;
    			newPreviewFeedLike.onclick = () => {
    				likeFeed(feed_idx);
    			}
    			oldPreviewFeedLike.parentNode.replaceChild(newPreviewFeedLike, oldPreviewFeedLike);
    			if(feedLikeCount == 0) {
    				document.getElementById('previewLikeCountSpan'+feed_idx).innerHTML = '아직 좋아요가 없습니다.';
    			} else {    				
	    			document.getElementById('previewLikeCountSpan'+feed_idx).innerHTML = '좋아요 '+feedLikeCount+'개';
    			}
    			
    			// 상세보기 피드
    			let oldDetailFeedLike = document.getElementById('detailHeartFull'+feed_idx);
    			let newDetailFeedLike = document.createElement('img');
    			newDetailFeedLike.src = '/img/heart.png';
    			newDetailFeedLike.classList = 'feed_icon_heart_img';
    			newDetailFeedLike.id = 'detailHeart'+feed_idx;
    			newDetailFeedLike.onclick = () => {
    				likeFeed(feed_idx);
    			}
    			oldDetailFeedLike.parentNode.replaceChild(newDetailFeedLike, oldDetailFeedLike);
    			if(feedLikeCount == 0) {
    				document.getElementById('detailLikeCountSpan'+feed_idx).innerHTML = '아직 좋아요가 없습니다.';
    			} else {
	    			document.getElementById('detailLikeCountSpan'+feed_idx).innerHTML = '좋아요 '+feedLikeCount+'개';    				
    			}
    		}
    	}
    	
    	XHR.open('POST', 'likeFeedCancel', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('feed_idx='+feed_idx);
    }
</script>
</html>