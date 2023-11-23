package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfoController {
	
	// 비밀번호 확인 페이지
	@GetMapping("/catstagram/pwdChk")
	public String pwdChk() {
		return "pwdChk";
	}
	
	// 회원 정보 수정 페이지로 이동
	@GetMapping("catstagram/infoUpdate")
	public String profileUpdateForm() {
		return "infoUpdate";
	}
	
	// 회원 정보 수정
	
	
	@GetMapping("catstagram/pwdUpdate")
	public String pwdUpdate() {
		return "pwdUpdate";
	}
	
	@GetMapping("catstagram/quit")
	public String quit() {
		return "quit";
	}
}