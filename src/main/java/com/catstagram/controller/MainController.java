package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/catstagram/main")
	public String main() {
		return "main";
	}
}