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
	@GetMapping("/catstagram/search")
	public ModelAndView search(@RequestParam(value = "id", defaultValue = "") String search_id, HttpSession session) {
		String sid = (String)session.getAttribute("sid");
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(!search_id.equals("") && sidx != null && sid != null) {
			List<MemberDTO> list = null;
			try {
				list = memberService.searchList(search_id, sid, sidx);
			} catch (Exception e) {
				e.printStackTrace();
			}

			mav.addObject("list", list);
			mav.addObject("search_id", search_id);
			mav.setViewName("search");
		} else if(search_id.equals("") || search_id == null) {
			if(sidx != null) { // 로그인한 상태
				mav.addObject("msg", "잘못된 접근입니다.");
				mav.addObject("goUrl", "/catstagram/main");
				mav.setViewName("msg/msg");	
			} else { // 로그인하지 않은 상태
				mav.addObject("msg", "잘못된 접근입니다.");
				mav.addObject("goUrl", "/catstagram"); 
				mav.setViewName("msg/msg");			
			}
		} else if(sidx == null || sid == null) {
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("goUrl", "/catstagram"); 
			mav.setViewName("msg/msg");
		}
		
		return mav;
	}
}