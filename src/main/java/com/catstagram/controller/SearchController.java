package com.catstagram.controller;

import javax.servlet.http.HttpSession;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
		mav.addObject("search_id", search_id);
		mav.setViewName("search");
		return mav;
	}
	
	// 검색 페이지를 GET 방식으로 접근할 경우
	@GetMapping("/catstagram/search")
	public ModelAndView getSearch(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer sidx = (Integer) session.getAttribute("sidx");
		if(sidx != null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram/main");
			mav.setViewName("msg/msg");	
		} else {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram"); 
			mav.setViewName("msg/msg");			
		}
		return mav;
	}
}