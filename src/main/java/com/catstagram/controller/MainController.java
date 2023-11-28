package com.catstagram.controller;


import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;

@Controller
public class MainController {
	
	@Autowired
	private FollowService followService;
	
	// 메인 페이지
	@GetMapping("/catstagram/main")
	public ModelAndView main(HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		List<FollowDTO> suggestedFollowersInMain = null;
		String[] followingList = null;
		ModelAndView mav = new ModelAndView();
		
		try {
			suggestedFollowersInMain = followService.suggestedFollowersInMain(sidx);
			for(int i=0; i<suggestedFollowersInMain.size(); i++) {
				followingList = suggestedFollowersInMain.get(i).getMy_following_list().split(",");
				suggestedFollowersInMain.get(i).setMy_following_list_arr(followingList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("suggestedFollowersInMain", suggestedFollowersInMain);
		mav.setViewName("main");
		return mav;
	}
}