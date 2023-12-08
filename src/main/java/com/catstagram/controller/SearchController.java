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
	@GetMapping("/catstagram/account/search")
	public ModelAndView search(@RequestParam(value = "id", defaultValue = "") String search_id, HttpSession session) {
		String sid = (String)session.getAttribute("sid");
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(!search_id.equals("") && search_id != null && sidx != null && sid != null) {
			List<MemberDTO> list = null;
			try {
				list = memberService.searchList(search_id, sid, sidx);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.addObject("list", list);
			mav.addObject("search_id", search_id);
			mav.setViewName("search");
		} else if(search_id.equals("") || search_id == null || sidx == null || sid == null) {
			mav.addObject("goUrl", "/catstagram"); 
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("msg/msg");	
		}
		
		return mav;
	}
}