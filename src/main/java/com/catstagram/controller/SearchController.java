package com.catstagram.controller;

import javax.servlet.http.HttpSession;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.AlarmDTO;
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
			
			// Header의 알림 목록
			List<AlarmDTO> alarmList = null;
			try {
				alarmList = memberService.alarmList(sidx);
				for(int i=0; i<alarmList.size(); i++) {
					// 알림이 생긴지 1시간 미만일 경우
					if(alarmList.get(i).getAlarm_date_minute() < 60) {
						alarmList.get(i).setAlarm_date_string(alarmList.get(i).getAlarm_date_minute()+"분");
					// 알림이 생긴지 24시간(하루) 미만일 경우
					} else if(alarmList.get(i).getAlarm_date_minute() >= 60 && alarmList.get(i).getAlarm_date_minute() < 1440) {
						alarmList.get(i).setAlarm_date_string((int)Math.floor(alarmList.get(i).getAlarm_date_minute()/60)+"시간");
					// 알림이 생긴지 24시간 이상일 경우
					} else if(alarmList.get(i).getAlarm_date_minute() >= 1440 && alarmList.get(i).getAlarm_date_minute() < 10080) {
						alarmList.get(i).setAlarm_date_string((int)Math.floor(alarmList.get(i).getAlarm_date_minute()/1440)+"일");
					// 알림이 생긴지 7일(일주일) 이상일 경우
					} else if(alarmList.get(i).getAlarm_date_minute() >= 10080) {
						alarmList.get(i).setAlarm_date_string((int)Math.floor(alarmList.get(i).getAlarm_date_minute()/10080)+"주");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mav.addObject("alarmList", alarmList);
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