package com.catstagram.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class AlarmController {
	
	@Autowired
	private MemberService memberService;

	// session에 내가 본 마지막 알림의 시간을 저장
	@ResponseBody
	@PostMapping("/catstagram/account/lastAlarmTimeSave")
	public String lastAlarmTimeSave(@RequestParam("lastAlarmTime") String lastAlarmTime, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		
		if(lastAlarmTime != null && !lastAlarmTime.isEmpty()) {
			try {
				SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
				Date utilDate = dateFormat.parse(lastAlarmTime);
					        
		        Timestamp timestampDate = new Timestamp(utilDate.getTime());
				
				memberService.lastAlarmSave(timestampDate, sidx);
				session.setAttribute("lastTime", timestampDate);	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "success"; // 응답할 게 따로 없음
	}
	
	// 새로운 알림이 떴는지에 대한 여부
	@ResponseBody
	@PostMapping("/catstagram/account/lastAlarmTime")
	public int lastAlarmTime(@RequestParam("lastAlarmTime") String lastAlarmTime, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		Date lastTime = (Date)session.getAttribute("lastTime");

		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
        Date utilDate = null;
		try {
			utilDate = dateFormat.parse(lastAlarmTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<AlarmDTO> alarmList = null;
		try {
			alarmList = memberService.alarmList(sidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		int result = 0;
		if(utilDate != null) {
			Timestamp timestampDate = new Timestamp(utilDate.getTime());
			if(lastTime != null && timestampDate != null) {
				if(lastTime.before(timestampDate)) {
					// 알림에 빨간 동그라미 표시
					result = 1;
				} else {
					// 빨간 동그라미 표시 X
					result = 0;
				}
			} else if(alarmList != null) {
				if(alarmList.size() == 1) {
					result = 1;
				}
			}
		}
		return result;
	}
}