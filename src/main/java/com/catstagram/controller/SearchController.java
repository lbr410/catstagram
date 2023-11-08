package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchController {
	
	// 나중에 수정할 예정(post와 parameter)
	@GetMapping("/catstagram/search")
	public String search() {
		return "search";
	}
}