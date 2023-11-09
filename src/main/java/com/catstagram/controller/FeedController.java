package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedController {
	
	@GetMapping("/catstagram/feedWrite")
	public String feedWrite() {
		return "feedWrite";
	}
	
	// 수정할 예정
	@GetMapping("/catstagram/feedUpdate")
	public String feedUpdate() {
		return "feedUpdate";
	}
}