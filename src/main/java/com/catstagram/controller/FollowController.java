package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FollowController {
	
	@GetMapping("/catstagram/follower")
	public String follower() {
		return "follower";
	}
	
	@GetMapping("/catstagram/following")
	public String following() {
		return "following";
	}
}