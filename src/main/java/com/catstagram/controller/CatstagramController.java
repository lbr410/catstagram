package com.catstagram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CatstagramController {
//	@GetMapping("/catstagram/sample")
//	public String catstagram() {
//		return "catstagram";
//	}
	
	@GetMapping("/catstagram/{member_id}")
	public ModelAndView catstagram(@PathVariable String member_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_id", member_id);
		mav.setViewName("catstagram");
		
		return mav;
	}
}