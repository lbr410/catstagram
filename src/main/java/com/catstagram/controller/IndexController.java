package com.catstagram.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.encryption.Encryption;
import com.catstagram.member.service.MemberService;

@Controller
public class IndexController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/catstagram")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@PostMapping("/catstagram/login")
	public ModelAndView login(@RequestParam("member_id") String id, 
							  @RequestParam("member_pwd") String pwd,
							  @RequestParam(value = "saveidChk", required = false) String saveid,
							  HttpServletResponse resp,
							  HttpSession session) {
		String EncryptPwd = Encryption.sha256(pwd);
		int result = 0;
		try {
			result = memberService.login(id, EncryptPwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		if(result == memberService.LOGIN_OK) {
			// 쿠키 생성
			if(saveid == null) {
				Cookie ck = new Cookie("saveid", id);
				ck.setMaxAge(0);
				resp.addCookie(ck);
			} else {
				Cookie ck = new Cookie("saveid", id);
				ck.setMaxAge(60*60*24*30); // 30일
				resp.addCookie(ck);
			}
			
			// 세션 생성
			int sidx = 0;
			try {
				sidx = memberService.sessionInfo(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("sidx", sidx);
			
			mav.setViewName("redirect:/catstagram/main");
		} else if(result == memberService.LOGIN_FAIL || result == memberService.ERROR) {
			mav.addObject("msg", "아이디 또는 비밀번호를 확인바랍니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else if(result == memberService.QUIT) {
			mav.addObject("msg", "탈퇴한 계정입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
}