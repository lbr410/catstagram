package com.catstagram.controller;

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
public class SignUpController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 페이지로 이동
	@GetMapping("/catstagram/signup")
	public ModelAndView signUp(HttpSession session) {
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		if(sidx == null) {
			mav.setViewName("signup");
		} else {
			mav.addObject("msg", "로그아웃 후 이동할 수 있습니다.");
			mav.addObject("goUrl", "/catstagram/main");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
	
	// 아이디 중복 검사
	@ResponseBody
	@PostMapping("/catstagram/idCheck")
	public String idCheck(@RequestParam("id") String id) {
		String member_id = null;
		try {
			member_id = memberService.idCheck(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return member_id;
	}
	
	@GetMapping("/catstagram/idCheck")
	public ModelAndView idCheckGet(HttpSession session) {
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

	// 회원가입
	@PostMapping("/catstagram/signup")
	public ModelAndView signup(MemberDTO dto) {
		dto.setMember_pwd(Encryption.sha256(dto.getMember_pwd())); // 비밀번호 암호화
		int result = 0;
		try {
			result = memberService.signup(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mav = new ModelAndView();
		String msg = result>0 ? "🎉 회원가입을 축하합니다. 🎉" : "회원가입 실패! 관리자에게 문의하세요.";
		
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}
}