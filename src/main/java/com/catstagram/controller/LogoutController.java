package com.catstagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {
	
	@GetMapping("/catstagram/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("sidx");
		session.removeAttribute("sid");
		session.removeAttribute("sname");
		session.removeAttribute("simg");
		
		return "redirect:/catstagram";
	}
}