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
                    	<span>
	                    	<c:if test="${dto.is_follow eq 0}">
	                    		<input type="button" value="팔로우" class="btn btn-primary catstagram_follow_btn" id="follow${dto.member_idx}" onclick="addFollowing(${dto.member_idx})">
	                    	</c:if>
	                    	<c:if test="${dto.is_follow ne 0}">
	                    		<input type="button" value="팔로잉" class="btn btn-secondary follow_list_del_btn" id="following${dto.member_idx}" onclick="cancelFollowing(${dto.member_idx})">
	                    	</c:if>
                    	</span>
                    	<input type="button" value="메시지 보내기" class="btn btn-secondary send_msg_btn">
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
            
            <c:if test="${!empty whoFollow.my_following_list_arr && dto.member_idx != sessionScope.sidx}">
				<c:if test="${whoFollow.num_of_followers eq 0}">
					<div class="who_follow_div"><a class="first_following" href="/catstagram/${whoFollow.my_following_list_arr[0]}">${whoFollow.my_following_list_arr[0]}</a>님이 팔로우합니다.</div>
				</c:if>
				<c:if test="${whoFollow.num_of_followers ne 0}">
					<div class="who_follow_div"><a class="first_following" href="/catstagram/${whoFollow.my_following_list_arr[0]}">${whoFollow.my_following_list_arr[0]}</a>님 외 
						<span class="suggestedFollowList" data-bs-toggle="dropdown" aria-expanded="false">
	                		${whoFollow.num_of_followers}명</span>이 팔로우합니다.
	                	
						<div class="dropdown">
							<ul class="dropdown-menu">
								<c:forEach var="whoFollowList" items="${whoFollow.my_following_list_arr}">
									<li><a class="dropdown-item menu_font" href="/catstagram/${whoFollowList}">${whoFollowList}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:if>
			</c:if>
			<c:if test="${empty whoFollow.my_following_list_arr}">
				<div class="who_follow_div"> </div>
			</c:if>
            
        </div>
    </div>
    
    <!-- 피드 목록 -->
    <div class="catstagram_feed_div">
        <c:forEach var="feed" items="${feedList}" varStatus="loopStatus">
		    <c:if test="${loopStatus.index % 3 == 0}">
		        <div class="catstagram_feed_img_div">
		            <c:forEach var="innerIndex" begin="${loopStatus.index}" end="${loopStatus.index + 2}" varStatus="innerStatus">
		                <c:if test="${innerIndex < feedList.size()}">
		                    <img src="/upload/feed/${feedList[innerIndex].feed_img}" class="catstagram_feed_img" id="feedDetailBtn${innerStatus.index}">
		                    
		                    <!-- feed detail -->
							<div id="feedDetail${innerStatus.index}" class="feed_detail_div">
							    <span id="closeFeedDetail" class="feed_detail_close_btn">&times;</span>
							    <div class="feed_detail_content_div">
							        <div class="feed_detail_img_div">
							            <img src="/upload/feed/${feedList[innerIndex].feed_img}" class="feed_detail_img">
							        </div>
							
							        <div class="feed_detail_content_content_div">
							            <div class="feed_detail_info_div">
							                <div class="feed_detail_info_span">
							                    
							                    <c:if test="${empty feedList[innerIndex].member_img}">
													<img src="/img/default_photo2.png" class="feed_detail_profile_img" onclick="javascript: location.href='/catstagram/${feedList[innerIndex].member_id}'">
												</c:if>
												<c:if test="${!empty feedList[innerIndex].member_img}">
													<img src="/upload/member/${feedList[innerIndex].member_img}" class="feed_detail_profile_img" onclick="javascript: location.href='/catstagram/${feedList[innerIndex].member_id}'">
												</c:if>
												
							                    <a href="/catstagram/${feedList[innerIndex].member_id}" class="feed_profile_id">&nbsp;${feedList[innerIndex].member_id}</a>
							                </div>
							                
							                <c:if test="${feedList[innerIndex].member_idx eq sessionScope.sidx}">
								                <div class="feed_detail_more_view_btn_div">
								                    <img src="/img/3dots.png" class="feed_detail_more_view_btn" data-bs-toggle="dropdown" aria-expanded="false">
								                    <div class="dropdown-center">
								                        <ul class="dropdown-menu dropdown-menu2">
								                            <li><a class="dropdown-item menu_font" href="/catstagram/account/feedUpdate?feed_idx=${feedList[innerIndex].feed_idx}">수정</a></li>
								                            <li><hr class="dropdown-divider"></li>
							                            	<li>
								                            	<form id="feedDelForm${feedList[innerIndex].feed_idx}" action="/catstagram/account/feedDel" method="post">
							                            			<input type="hidden" name="feed_idx" value="${feedList[innerIndex].feed_idx}">
							                            			<a class="dropdown-item menu_font" onclick="feedDel(${feedList[innerIndex].feed_idx})">삭제</a>
							                            		</form>
						                            		</li>
								                        </ul>
								                    </div>
								                </div>
							                </c:if>
							            </div>
							            <div class="feed_detail_content_content">
							                <p class="feed_detail_content_content_p">
							                    ${feedList[innerIndex].feed_content}
							                </p>
							            </div>
							            <div class="feed_detail_content_time_div">${feedList[innerIndex].feed_date_time}</div>
							            
							            <div class="feed_detail_content_comment_div" id="feedDetailContentCommentDiv${feedList[innerIndex].feed_idx}">
							                <c:forEach var="feedContentList" items="${feedList[innerIndex].feed_comment_list}">
								                <div class="feed_detail_comment_div" id="feedDetailCommentDiv${feedContentList.comment_idx}">
								                    <span class="feed_detail_comment"> 
								                        <c:if test="${empty feedContentList.member_img}">
															<img src="/img/default_photo2.png" class="feed_detail_profile_comment_img"
															onclick="javascript: location.href='/catstagram/${feedContentList.member_id}'">
														</c:if>
														<c:if test="${!empty feedContentList.member_img}">
															<img src="/upload/member/${feedContentList.member_img}" class="feed_detail_profile_comment_img"
															onclick="javascript: location.href='/catstagram/${feedContentList.member_id}'">
														</c:if>
								                        <span class="feed_detail_comment_comment">
								                            <a href="/catstagram/${feedContentList.member_id}" class="feed_detail_comment_id">${feedContentList.member_id}</a>
								                            ${feedContentList.comment_content}
								                        </span>
								                    </span>
								                    <span class="feed_detail_comment_icon">
								                        <c:if test="${feedList[innerIndex].member_idx eq sessionScope.sidx
								                        				|| feedContentList.member_idx eq sessionScope.sidx}">
									                        <img src="/img/trash.png" class="feed_comment_icon_trash_img"
									                        onclick="feedCommentDel(${feedContentList.comment_idx})">
								                        </c:if>
								                        <c:if test="${empty feedContentList.comment_like_idx}">
											                <img src="/img/heart.png" class="feed_comment_icon_heart_img2"
									                        id="detailCommentHeart${feedContentList.comment_idx}"
									                        onclick="feedCommentLike(${feedContentList.comment_idx})">
										                </c:if>
										                <c:if test="${!empty feedContentList.comment_like_idx}">
											                <img src="/img/heart2.png" class="feed_comment_icon_heart_img2"
											                id="detailCommentHeartFull${feedContentList.comment_idx}"
											                onclick="feedCommentLikeCancel(${feedContentList.comment_idx})">
										                </c:if>
								                    </span>
								                </div>
								                <div class="feed_detail_comment_time_like_div" id="feedDetailCommentTimeLikeDiv${feedContentList.comment_idx}">
								                    	${feedContentList.comment_date_time}
								                    <span id="detailCommentLikeSpan${feedContentList.comment_idx}">
									                    <c:if test="${feedContentList.comment_like_count ne 0}">
									                    	&nbsp;&nbsp;좋아요 ${feedContentList.comment_like_count}개
									                    </c:if>
								                    </span>
								                </div>
							                </c:forEach>
							            </div>
							
							            <div class="feed_detail_comment_write_div">
							                <div class="feed_detail_icon_div">
							                    <c:if test="${empty feedList[innerIndex].feed_like_idx}">
										            <img src="/img/heart.png" class="feed_icon_heart_img"
										            onclick="likeFeed(${feedList[innerIndex].feed_idx})" id="detailHeart${feedList[innerIndex].feed_idx}">
									            </c:if>
									            <c:if test="${!empty feedList[innerIndex].feed_like_idx}">
										            <img src="/img/heart2.png" class="feed_icon_heart_img"
										            onclick="likeFeedCancel(${feedList[innerIndex].feed_idx})" id="detailHeartFull${feedList[innerIndex].feed_idx}">
									            </c:if>
							                    <img src="/img/reple.png" class="feed_icon_reple_img">
							                </div>
							                <div class="feed_detail_like_div">
							                    <div class="feed_detail_like" id="detailLikeCountSpan${feedList[innerIndex].feed_idx}">
							                        <c:if test="${feedList[innerIndex].feed_like_count ne 0}">
						            					좋아요 <span id="detailLikeCount${feedList[innerIndex].feed_idx}">${feedList[innerIndex].feed_like_count}</span>개
						            				</c:if>
						            				<c:if test="${feedList[innerIndex].feed_like_count eq 0}">
						            					아직 좋아요가 없습니다.
						            				</c:if>
							                    </div>
							                </div>
							                <div class="feed_detail_comment_write_write_div">
							                    <div class="feed_detail_comment_input">
							                        <input type="text" name="comment_content" placeholder="댓글 달기..."
							                        	id="feedDetailComment${feedList[innerIndex].feed_idx}"
							                        	maxlength="1000" class="feed_detail_comment_insert_input" onkeydown="feedDetailCommentInsertEnterKey(event, ${feedList[innerIndex].feed_idx}, ${feedList[innerIndex].member_idx})">
							                        <img src="/img/dm.png" class="feed_comment_insert_icon_img" onclick="feedDetailCommentInsertClick(${feedList[innerIndex].feed_idx}, ${feedList[innerIndex].member_idx})">
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div> <!-- 여기까지 feed detail -->
		                </c:if>
		            </c:forEach>
		        </div>
		    </c:if>
		</c:forEach>
    </div>
</div>




<img src="/img/upArrow.png" id="scrollToTopBtn" class="scroll_to_top_btn" onclick="scrollToTop()">
<%@ include file="footer.jsp" %>
</body>
<script>
	//피드 상세 보기
	document.addEventListener('DOMContentLoaded', function() {
	    // forEach 루프로 각각의 피드에 대한 이벤트 리스너 추가
	    <c:forEach var="feedList" items="${feedList}" varStatus="loop">
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
    
    // 피드 상세보기 댓글 달기(엔터키 눌렀을 시 실행되게)
    function feedDetailCommentInsertEnterKey(event, feed_idx, member_idx) {
    	let feedDetailComment = document.getElementById('feedDetailComment'+feed_idx).value;
        if(event.key == 'Enter') {
        	if(feedDetailComment == '') {
        		window.alert('댓글을 입력해주세요.');
        	} else {
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
    
    // 피드 댓글 달기 & 새로 댓글 목록 불러오기
    function feedCommentInsert(feed_idx, feedComment, member_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const result = JSON.parse(XHR.responseText);
    			
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
        				imgElement.onclick = () => {
        					location.href = '/catstagram/'+result[i].member_id;
        				}
        				commentSpan.appendChild(imgElement);
        			} else {
        				let imgElement = document.createElement('img');
        				imgElement.src = '/img/default_photo2.png';
        				imgElement.classList.add('feed_detail_profile_comment_img');
        				imgElement.onclick = () => {
        					location.href = '/catstagram/'+result[i].member_id;
        				}
        				commentSpan.appendChild(imgElement);
        			}
        			
        			const commentCommentSpan = document.createElement('span');
        			commentCommentSpan.classList.add('feed_detail_comment_comment2');
        			commentSpan.appendChild(commentCommentSpan);
        			
        			const commentIdLink = document.createElement('a');
    				commentIdLink.textContent = result[i].member_id;
    				commentIdLink.href = '/catstagram/'+result[i].member_id;
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
					if(result[i].comment_like_idx == null) {
						heartImgElement.src = '/img/heart.png';
						heartImgElement.classList.add('feed_comment_icon_heart_img2');
						heartImgElement.id = 'detailCommentHeart'+result[i].comment_idx;
						heartImgElement.onclick = () => {
							feedCommentLike(result[i].comment_idx);
						}
					} else {
						heartImgElement.src = '/img/heart2.png';
						heartImgElement.classList.add('feed_comment_icon_heart_img2');
						heartImgElement.id = 'detailCommentHeartFull'+result[i].comment_idx;
						heartImgElement.onclick = () => {
							feedCommentLikeCancel(result[i].comment_idx);
						}
					}
    				commentIconSpan.appendChild(heartImgElement);

					commentDiv.appendChild(commentSpan);
					commentDiv.appendChild(commentIconSpan);

					const commentTimeLikeDiv = document.createElement('div');
					commentTimeLikeDiv.classList.add('feed_detail_comment_time_like_div');
					const detailCommentLikeSpan = document.createElement('span');
					detailCommentLikeSpan.setAttribute('id', 'detailCommentLikeSpan'+result[i].comment_idx);
					commentTimeLikeDiv.innerHTML = result[i].comment_date_time;
					if(result[i].comment_like_count != 0) {
						detailCommentLikeSpan.innerHTML = '&nbsp;&nbsp;&nbsp;좋아요 ' + result[i].comment_like_count +'개';
					}
					commentTimeLikeDiv.setAttribute('id', 'feedDetailCommentTimeLikeDiv'+result[i].comment_idx);
					commentTimeLikeDiv.appendChild(detailCommentLikeSpan);

					feedDetailContentCommentDiv.appendChild(commentDiv);
					feedDetailContentCommentDiv.appendChild(commentTimeLikeDiv);
    			}			
    		}
    	}
    	
    	XHR.open('POST', '/catstagram/account/feedCommentInsert', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('feed_idx='+feed_idx+'&comment_content='+feedComment);
    	
    	document.getElementById('feedDetailComment'+feed_idx).value = '';
    }
    
    // 피드 댓글 삭제
    function feedCommentDel(comment_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = function() {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const feedDetailCommentDiv = document.getElementById('feedDetailCommentDiv'+comment_idx);
    			const feedDetailCommentTimeLikeDiv = document.getElementById('feedDetailCommentTimeLikeDiv'+comment_idx);
    			
    			if(feedDetailCommentDiv) {
	    			feedDetailCommentDiv.remove();    				
    			}
    			if(feedDetailCommentTimeLikeDiv) {
	    			feedDetailCommentTimeLikeDiv.remove();    				
    			}
    		}
    	}
    	
    	XHR.open('POST', '/catstagram/account/feedCommentDel', true);
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
    			newDetailFeedLike.style.transform = 'scale(1.2)';
    			setTimeout(() => {
    				newDetailFeedLike.style.transform = 'scale(1)';
    			}, 100);
    			oldDetailFeedLike.parentNode.replaceChild(newDetailFeedLike, oldDetailFeedLike);
    			document.getElementById('detailLikeCountSpan'+feed_idx).innerHTML = '좋아요 '+feedLikeCount+'개';
    		}
    	}
    	
    	XHR.open('POST', '/catstagram/account/likeFeed', true);
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
    	
    	XHR.open('POST', '/catstagram/account/likeFeedCancel', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('feed_idx='+feed_idx);
    }
    
    // 피드 댓글 좋아요
    function feedCommentLike(comment_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = () => {
    		if(XHR.readyState == 4 && XHR.status == 200) {
    			const commentLikeCount = JSON.parse(XHR.responseText);

    			// 좋아요 하트색 변경 & 좋아요수 증가 보이기
    			// 상세보기 피드 댓글
    			let oldDetailFeedCommentLike = document.getElementById('detailCommentHeart'+comment_idx);
    			let newDetailFeedCommentLike = document.createElement('img');
    			newDetailFeedCommentLike.src = '/img/heart2.png';
    			newDetailFeedCommentLike.classList = 'feed_comment_icon_heart_img2';
    			newDetailFeedCommentLike.id = 'detailCommentHeartFull'+comment_idx;
    			newDetailFeedCommentLike.onclick = () => {
    				feedCommentLikeCancel(comment_idx);
    			}
    			newDetailFeedCommentLike.style.transition = 'transform 0.2s ease-in-out';
    			newDetailFeedCommentLike.style.transform = 'scale(1.2)';
    			setTimeout(() => {
    				newDetailFeedCommentLike.style.transform = 'scale(1)';
    			}, 100);
    			oldDetailFeedCommentLike.parentNode.replaceChild(newDetailFeedCommentLike, oldDetailFeedCommentLike);
    			
    			document.getElementById('detailCommentLikeSpan'+comment_idx).innerHTML = '&nbsp;&nbsp;&nbsp;좋아요 '+commentLikeCount+'개';
    			
    		}
    	}
    	XHR.open('POST', '/catstagram/account/likeFeedComment', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('comment_idx='+comment_idx);
    }
    
    // 피드 댓글 좋아요 취소
    function feedCommentLikeCancel(comment_idx) {
    	const XHR = new XMLHttpRequest();
    	XHR.onreadystatechange = () => {
    		if(XHR.readyState == 4 && XHR.status == 200) {
				const commentLikeCount = JSON.parse(XHR.responseText);
    			
    			// 좋아요 하트색 변경 & 좋아요수 감소 보이기
    			// 상세보기 피드 댓글
    			let oldDetailFeedCommentLike = document.getElementById('detailCommentHeartFull'+comment_idx);
    			let newDetailFeedCommentLike = document.createElement('img');
    			newDetailFeedCommentLike.src = '/img/heart.png';
    			newDetailFeedCommentLike.classList = 'feed_comment_icon_heart_img2';
    			newDetailFeedCommentLike.id = 'detailCommentHeart'+comment_idx;
    			newDetailFeedCommentLike.onclick = () => {
    				feedCommentLike(comment_idx);
    			}
    			oldDetailFeedCommentLike.parentNode.replaceChild(newDetailFeedCommentLike, oldDetailFeedCommentLike);
    			if(commentLikeCount == 0) {
    				document.getElementById('detailCommentLikeSpan'+comment_idx).innerHTML = '';
    			} else {
	    			document.getElementById('detailCommentLikeSpan'+comment_idx).innerHTML = '&nbsp;&nbsp;&nbsp;좋아요 '+commentLikeCount+'개';    				
    			}
    		}
    	}
    	XHR.open('POST', '/catstagram/account/likeFeedCommentCancel', true);
    	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	XHR.send('comment_idx='+comment_idx);
    }
</script>
</html>