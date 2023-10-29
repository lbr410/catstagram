package com.catstagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.member.service.MemberService;

@Controller
public class SignUpController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/catstagram/signup")
	public String signUp() {
		return "member/signup";
	}
	
	@ResponseBody
	@PostMapping("/catstagram/idCheck")
	//public ModelAndView idCheck(@RequestParam("id") String id) {
	public String idCheck(@RequestParam("id") String id) {
		String member_id = null;
		try {
			member_id = memberService.idCheck(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//ModelAndView mav = new ModelAndView();
		//mav.addObject("member_id", member_id);
		//mav.setViewName("/member/signup");
		//return mav;
		return member_id;
	}
}