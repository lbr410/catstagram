package com.catstagram.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class AlarmController {
	
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("/catstagram/account/checkAlarm")
//	public String headerAlarm(HttpSession session) {
//		ZonedDateTime koreaTime = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
//		LocalDateTime currentDateTime = koreaTime.toLocalDateTime();
//		Timestamp currentTimestamp = Timestamp.valueOf(currentDateTime);
//		System.out.println("시간 : "+currentTimestamp);
//	}
	
	@GetMapping("/catstagram/**")
	public ModelAndView alarmList(HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		List<AlarmDTO> alarmList = null;
		
		try {
			alarmList = memberService.alarmList(sidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(alarmList != null) {
			for(int i=0; i<alarmList.size(); i++) {
				System.out.println(alarmList.get(i).getActivity_type());
			}
		}
		
		mav.addObject("alarmList", alarmList);
		mav.setViewName("header");
		
		return mav;
	}
}