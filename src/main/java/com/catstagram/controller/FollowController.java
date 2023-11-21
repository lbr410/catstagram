package com.catstagram.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
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
	
	// 팔로워 목록 페이지로 이동(나를 친구 추가한 사람)
	@GetMapping("/catstagram/follower")
	public String followerForm() {
		return "follower";
	}
	
	// 팔로잉 목록 페이지로 이동(내가 친구 추가한 사람)
	@GetMapping("/catstagram/following")
	public String followingForm() {
		return "following";
	}
}