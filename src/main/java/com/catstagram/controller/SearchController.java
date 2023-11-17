package com.catstagram.controller;

import javax.servlet.http.HttpSession;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class SearchController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원 아이디 검색
	@PostMapping("/catstagram/search")
	public ModelAndView search(@RequestParam("search_id") String search_id, HttpSession session) {
		String member_id = (String) session.getAttribute("sid");
		List<MemberDTO> list = null;
		try {
			list = memberService.searchList(search_id, member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("member_id", member_id);
		mav.setViewName("search");
		return mav;
	}
}