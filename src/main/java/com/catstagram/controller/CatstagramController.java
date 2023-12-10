package com.catstagram.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.service.FeedService;
import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class CatstagramController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private FollowService followService;
	
	@GetMapping("/catstagram/{member_id}")
	public ModelAndView catstagram(@PathVariable String member_id, HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		int sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		DecimalFormat df = new DecimalFormat("#,#");
		
		MemberDTO dto = null;
		List<MainFollowingFeedDTO> feedList = null;
		FollowDTO whoFollow = null;
		String[] followingList = null;
		
		try {
			// catstagram 상단 기본 정보
			dto = memberService.urlIdxIdSelect(member_id, sidx);
			if(dto != null) {
				if(dto.getMember_intro() != null) {
					dto.setMember_intro(dto.getMember_intro().replace("\n", "<br>"));
				}
				
				// 게시글수, 팔로워수, 팔로잉수 1,000 이상 K, 1,000,000이상 M이면서 소수 첫째자리까지만 나타내기
				if(dto.getFeed_count() < 1000) {
					dto.setFeed_count_KM(dto.getFeed_count()+"");
				} else if(dto.getFeed_count() >= 1000 && dto.getFeed_count() <= 999999) {
					dto.setFeed_count_KM(df.format(dto.getFeed_count())+"K");
				} else if(dto.getFeed_count() > 1000000) {
					dto.setFeed_count_KM(df.format(dto.getFeed_count())+"M");
				}
				
				if(dto.getFollower_count() < 1000) {
					dto.setFollower_count_KM(dto.getFollower_count()+"");
				} else if(dto.getFollower_count() >= 1000 && dto.getFollower_count() <= 999999) {
					dto.setFollower_count_KM(df.format(dto.getFollower_count())+"K");
				} else if(dto.getFollower_count() > 1000000) {
					dto.setFollower_count_KM(df.format(dto.getFollower_count())+"M");
				}
				
				if(dto.getFollowing_count() < 1000) {
					dto.setFollowing_count_KM(dto.getFollowing_count()+"");
				} else if(dto.getFollowing_count() >= 1000 && dto.getFollowing_count() <= 999999) {
					dto.setFollowing_count_KM(df.format(dto.getFollowing_count())+"K");
				} else if(dto.getFollowing_count() > 1000000) {
					dto.setFollowing_count_KM(df.format(dto.getFollowing_count())+"M");
				}
				
				// 피드 목록
				feedList = feedService.feedList(dto.getMember_idx(), sidx);
				for(int i=0; i<feedList.size(); i++) {
					// 피드가 작성된지 1시간 미만일 경우
					if(feedList.get(i).getFeed_date_minute() < 60) {
						feedList.get(i).setFeed_date_time(feedList.get(i).getFeed_date_minute()+"분");
					// 피드가 작성된지 24시간(하루) 미만일 경우
					} else if(feedList.get(i).getFeed_date_minute() >= 60 && feedList.get(i).getFeed_date_minute() < 1440) {
						feedList.get(i).setFeed_date_time((int)Math.floor(feedList.get(i).getFeed_date_minute()/60)+"시간");
					// 피드가 작성된지 24시간 이상일 경우
					} else if(feedList.get(i).getFeed_date_minute() >= 1440 && feedList.get(i).getFeed_date_minute() < 10080) {
						feedList.get(i).setFeed_date_time((int)Math.floor(feedList.get(i).getFeed_date_minute()/1440)+"일");
					// 피드가 작성된지 7일(일주일) 이상일 경우
					} else if(feedList.get(i).getFeed_date_minute() >= 10080) {
						feedList.get(i).setFeed_date_time((int)Math.floor(feedList.get(i).getFeed_date_minute()/10080)+"주");
					}
					
					// 피드 내용 개행 처리
					feedList.get(i).setFeed_content(feedList.get(i).getFeed_content().replaceAll("\n", "<br>"));
					
				}
				
				// 해당 회원은 내 팔로우들 중 누가누가 팔로잉했는지
				whoFollow = followService.whoFollow(dto.getMember_idx(), sidx);
				if(whoFollow.getNum_of_followers() == -1) {
					whoFollow.setNum_of_followers(0);
				}
				if(whoFollow.getMy_following_list() != null) {
					followingList = whoFollow.getMy_following_list().split(",");
					whoFollow.setMy_following_list_arr(followingList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dto != null && w_sidx != null) {
			mav.addObject("dto", dto);
			mav.addObject("whoFollow", whoFollow);
			mav.addObject("feedList", feedList);
			mav.setViewName("catstagram");
		} else if(dto == null) {
			mav.setViewName("emptyPage");
		} else if(w_sidx == null) {
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		
		return mav;
	}
}