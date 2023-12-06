package com.catstagram.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class IndexController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 화면으로 이동
	@GetMapping("/catstagram")
	public ModelAndView index(HttpSession session) {
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		if(sidx == null) {
			mav.setViewName("index");
		} else {
			mav.addObject("msg", "로그아웃 후 이동할 수 있습니다.");
			mav.addObject("goUrl", "/catstagram/main");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
	
	// 로그인
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
			// 아이디 저장하기 쿠키 생성
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
			MemberDTO dto = new MemberDTO();
			try {
				dto = memberService.sessionInfo(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("sidx", dto.getMember_idx());
			session.setAttribute("sid", dto.getMember_id());
			session.setAttribute("sname", dto.getMember_name());
			session.setAttribute("simg", dto.getMember_img());
			
			System.out.println(dto.getMember_idx());
			System.out.println(dto.getMember_id());
			System.out.println(dto.getMember_name());
			System.out.println(dto.getMember_img());
			
			mav.setViewName("redirect:/catstagram/main");
		} else if(result == memberService.LOGIN_FAIL || result == memberService.ERROR) {
			mav.addObject("msg", "아이디 또는 비밀번호를 확인바랍니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else if(result == memberService.QUIT) {
			mav.addObject("msg", "로그인이 불가능한 계정입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
	
	@GetMapping("/catstagram/login")
	public ModelAndView loginGetReq(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram/main");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
}