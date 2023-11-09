package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {
	
	@GetMapping("/catstagram/profileUpdate")
	public String profileUpdate() {
		return "profileUpdate";
	}
	
	@GetMapping("/catstagram/profileImgPopup")
	public String profileImgPopup() {
		return "profileImgPopup";
	}
}