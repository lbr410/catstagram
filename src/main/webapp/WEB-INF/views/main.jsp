<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catstagram</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/main.css">
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

<!-- Right Menu -->
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
        <div class="suggestion_list_msg">회원님을 위한 추천</div>
    </div>

    <!-- 첫 번째 추천 -->
    <div class="suggestion_list_div">
        <div class="img_and_id_and_name_div">
            <a href="#"><img src="/img/profile2.jpg" class="feed_profile_img"></a>&nbsp;
            <div class="id_and_name_div">
                <a href="#" class="suggestion_list_id">ramiee__l</a><br>
                <a class="suggestion_follow_who">ss_hhwan님이 팔로우합니다.</a>  
            </div>
        </div>
        <div class="suggestion_list_follow_btn_div">
            <input type="button" value="팔로우" class="btn btn-primary suggestion_list_follow_btn">
        </div>
    </div>

    <!-- 두 번째 추천 -->
    <div class="suggestion_list_div">
        <div class="img_and_id_and_name_div">
            <a href="#"><img src="/img/profile2.jpg" class="feed_profile_img"></a>&nbsp;
            <div class="id_and_name_div">
                <a href="#" class="suggestion_list_id">ramiee__l</a><br>
                <a class="suggestion_follow_who">mng_zoe님이 팔로우합니다.</a>  
            </div>
        </div>
        <div class="suggestion_list_follow_btn_div">
            <input type="button" value="팔로우" class="btn btn-primary suggestion_list_follow_btn">
        </div>
    </div>

    <!-- 세 번째 추천 -->
    <div class="suggestion_list_div">
        <div class="img_and_id_and_name_div">
            <a href="#"><img src="/img/profile2.jpg" class="feed_profile_img"></a>&nbsp;
            <div class="id_and_name_div">
                <a href="#" class="suggestion_list_id">ramiee__l</a><br>
                <a class="suggestion_follow_who">ss_hhwan님 외 1명이 팔로우합니다.</a>  
            </div>
        </div>
        <div class="suggestion_list_follow_btn_div">
            <input type="button" value="팔로우" class="btn btn-primary suggestion_list_follow_btn">
        </div>
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
</script>
</html>