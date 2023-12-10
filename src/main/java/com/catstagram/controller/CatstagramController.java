package com.catstagram.controller;

import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;

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
	public ModelAndView catstagram(@PathVariable String member_id, HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		int sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		DecimalFormat df = new DecimalFormat("#,#");
		
		MemberDTO dto = null;
		try {
			dto = memberService.urlIdxIdSelect(member_id, sidx);
			if(dto != null) {
				if(dto.getMember_intro() != null) {
					dto.setMember_intro(dto.getMember_intro().replace("\n", "<br>"));
				}
				
				// 게시글수, 팔로워수, 팔로잉수 1,000 이상 K, 1,000,000이상 M이면서 소수 첫째자리까지만 나타내기
				if(dto.getFeed_count() < 1000) {
					dto.setFeed_count_KM(dto.getFeed_count()+"");
				} else if(dto.getFeed_count() >= 1000 && dto.getFeed_count() <= 999999) {
					dto.setFeed_count_KM(df.format(dto.getFeed_count())+"K");
				} else if(dto.getFeed_count() > 1000000) {
					dto.setFeed_count_KM(df.format(dto.getFeed_count())+"M");
				}
				
				if(dto.getFollower_count() < 1000) {
					dto.setFollower_count_KM(dto.getFollower_count()+"");
				} else if(dto.getFollower_count() >= 1000 && dto.getFollower_count() <= 999999) {
					dto.setFollower_count_KM(df.format(dto.getFollower_count())+"K");
				} else if(dto.getFollower_count() > 1000000) {
					dto.setFollower_count_KM(df.format(dto.getFollower_count())+"M");
				}
				
				if(dto.getFollowing_count() < 1000) {
					dto.setFollowing_count_KM(dto.getFollowing_count()+"");
				} else if(dto.getFollowing_count() >= 1000 && dto.getFollowing_count() <= 999999) {
					dto.setFollowing_count_KM(df.format(dto.getFollowing_count())+"K");
				} else if(dto.getFollowing_count() > 1000000) {
					dto.setFollowing_count_KM(df.format(dto.getFollowing_count())+"M");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dto != null && w_sidx != null) {
			mav.addObject("dto", dto);
			mav.setViewName("catstagram");
		} else if(dto == null) {
			mav.setViewName("emptyPage");
		} else if(w_sidx == null) {
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		
		return mav;
	}
}