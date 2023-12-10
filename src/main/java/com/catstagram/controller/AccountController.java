package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
	
	@GetMapping({"/catstagram/account/{url}", "/catstagram/{url}/{url2}"})
	public String accountUrl() {
		return "emptyPage";
	}
}