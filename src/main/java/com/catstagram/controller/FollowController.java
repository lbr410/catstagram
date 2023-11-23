package com.catstagram.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private MemberService memberService;
	
	// 팔로잉(친구추가)
	@ResponseBody
	@PostMapping("/catstagram/following")
	public int following(@RequestParam("to") int to, HttpSession session) {
		FollowDTO dto = new FollowDTO();
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_from(sidx);
		dto.setMember_to(to);
		
		try {
			followService.following(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return to;
	}
	
	// 팔로잉 취소(친구삭제)
	@ResponseBody
	@PostMapping("/catstagram/cancelFollowing")
	public int cancelFollowing(@RequestParam("to") int to, HttpSession session) {
		FollowDTO dto = new FollowDTO();
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_from(sidx);
		dto.setMember_to(to);
		
		try {
			followService.cancelFollowing(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return to;
	}
	
	// 팔로워 목록 페이지(나를 친구 추가한 사람)
	@GetMapping("/catstagram/follower")
	public ModelAndView followerForm(HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		List<MemberDTO> list = memberService.followerList(sidx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("follower");
		
		return mav;
	}
	
	// 나를 팔로워한(친구 추가한) 사람을 팔로워 목록에서 삭제하기
	@PostMapping("/catstagram/delFollower")
	public String delFollower(@RequestParam("to") int member_idx, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		try {
			followService.delFollower(member_idx, sidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "follower";
	}
	
	// 팔로잉 목록 페이지(내가 친구 추가한 사람)
	@GetMapping("/catstagram/following")
	public ModelAndView followingForm(HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		List<MemberDTO> list = memberService.followingList(sidx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("following");
		
		return mav;	
	}
}