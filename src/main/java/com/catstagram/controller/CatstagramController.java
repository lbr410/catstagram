package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CatstagramController {
	@GetMapping("/catstagram/sample")
	public String catstagram() {
		return "catstagram";
	}
}