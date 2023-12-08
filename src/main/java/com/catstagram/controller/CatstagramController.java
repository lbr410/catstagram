package com.catstagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class CatstagramController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/catstagram/{member_id}")
	public ModelAndView catstagram(@PathVariable String member_id) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO dto = null;
		try {
			dto = memberService.urlIdxIdSelect(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dto != null) {
			mav.addObject("member_id", member_id);
			mav.setViewName("catstagram");
		} else {
			mav.setViewName("emptyPage");
		}
		
		return mav;
	}
}