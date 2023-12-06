package com.catstagram.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.service.FeedService;
import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;

@Controller
public class MainController {
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private FeedService feedService;
	
	// 메인 페이지
	@GetMapping("/catstagram/main")
	public ModelAndView main(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx != null) {
			int sidx = (Integer)session.getAttribute("sidx");
			// 팔로잉(내가 친구 추가한 사람들)이 올린 피드 목록
			List<MainFollowingFeedDTO> mainFollowingFeed = null;
	
			try {
				mainFollowingFeed = feedService.mainFollowingFeed(sidx);
				for(int i=0; i<mainFollowingFeed.size(); i++) {
					// 피드가 작성된지 1시간 미만일 경우
					if(mainFollowingFeed.get(i).getFeed_date_minute() < 60) {
						mainFollowingFeed.get(i).setFeed_date_time(mainFollowingFeed.get(i).getFeed_date_minute()+"분");
					// 피드가 작성된지 24시간(하루) 미만일 경우
					} else if(mainFollowingFeed.get(i).getFeed_date_minute() >= 60 && mainFollowingFeed.get(i).getFeed_date_minute() < 1440) {
						mainFollowingFeed.get(i).setFeed_date_time((int)Math.floor(mainFollowingFeed.get(i).getFeed_date_minute()/60)+"시간");
					// 피드가 작성된지 24시간 이상일 경우
					} else if(mainFollowingFeed.get(i).getFeed_date_minute() >= 1440 && mainFollowingFeed.get(i).getFeed_date_minute() < 10080) {
						mainFollowingFeed.get(i).setFeed_date_time((int)Math.floor(mainFollowingFeed.get(i).getFeed_date_minute()/1440)+"일");
					// 피드가 작성된지 7일(일주일) 이상일 경우
					} else if(mainFollowingFeed.get(i).getFeed_date_minute() >= 10080) {
						mainFollowingFeed.get(i).setFeed_date_time((int)Math.floor(mainFollowingFeed.get(i).getFeed_date_minute()/10080)+"주");
					}
					
					// 피드 내용 개행 처리
					mainFollowingFeed.get(i).setFeed_content(mainFollowingFeed.get(i).getFeed_content().replaceAll("\n", "<br>"));
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			// 회원님을 위한 추천
			List<FollowDTO> suggestedFollowersInMain = null;
			String[] followingList = null;
			
			try {
				suggestedFollowersInMain = followService.suggestedFollowersInMain(sidx);
				for(int i=0; i<suggestedFollowersInMain.size(); i++) {
					followingList = suggestedFollowersInMain.get(i).getMy_following_list().split(",");
					suggestedFollowersInMain.get(i).setMy_following_list_arr(followingList);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mav.addObject("mainFollowingFeed", mainFollowingFeed);
			mav.addObject("suggestedFollowersInMain", suggestedFollowersInMain);
			mav.setViewName("main");
		} else {
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		return mav;
	}	
}