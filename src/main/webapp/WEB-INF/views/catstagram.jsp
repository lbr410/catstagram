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
</head>
<body>
<%@ include file="header.jsp" %>
<div class="catstagram_div">
    <div class="catstagram_profile_div">
        <img src="/img/profile2.jpg" class="catstagram_profile_img">
        <div class="catstagram_profile_info_div">
            <div class="catstagram_profile_id_div">
                <span class="catstagram_profile_id_span">ramiee__l</span>
                <span class="catstagram_profile_update_btn_span">
                    <input type="button" value="프로필 수정" class="btn btn-secondary catstagram_profile_update_btn">
                </span>
                <span>
                    <img src="/img/setting.png" class="catstagram_profile_setting_img">
                </span>
            </div>
            <div class="catstagram_statistics_div">
                게시물 <span class="cnt_span">25</span>
                팔로워 <span class="cnt_span">150</span>
                팔로잉 <span class="cnt_span">150</span>
            </div>
            <div class="catstagram_profile_name_div">
                이보람
            </div>
            <div class="catstagram_profile_intro_div">
                뭉이&조이 2015년 6월생<br>
                2015.08~ 2016.06~<br><br>

                💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙<br>
                ㄴㅇㅁㄹㄴㅇㄹㅇㄴㅁㄻㅇㄴㄹㅇㄴ
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
</script>
</html>