package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfoController {
	
	@GetMapping("/catstagram/pwdChk")
	public String pwdChk() {
		return "pwdChk";
	}
	
	@GetMapping("catstagram/infoUpdate")
	public String profileUpdate() {
		return "infoUpdate";
	}
	
	@GetMapping("catstagram/pwdUpdate")
	public String pwdUpdate() {
		return "pwdUpdate";
	}
	
	@GetMapping("catstagram/quit")
	public String quit() {
		return "quit";
	}
}