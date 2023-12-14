package com.catstagram.controller;

import java.io.*;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class ProfileController {
	
	@Autowired
	private MemberService memberService;
	
	// 프로필 수정 페이지로 이동 & 이미 저장된 프로필 불러오기
	@GetMapping("/catstagram/account/profileUpdate")
	public ModelAndView profileUpdateForm(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx != null) {
			int sidx = (Integer)session.getAttribute("sidx");
			String content = null;
			try {
				content = memberService.profileInfo(sidx);
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
			mav.addObject("member_content", content);
			mav.setViewName("profileUpdate");
		} else {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");	
		}
		return mav;
	}
	
	// 프로필 수정
	@PostMapping("/catstagram/account/profileUpdate")
	public String profileUpdate(Model model, MemberDTO dto, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_idx(sidx);
		int result = 0;
		try {
			result = memberService.profileUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = result>0 ? "프로필을 수정하였습니다." : "프로필 수정 실패!";
		model.addAttribute("msg", msg);
		model.addAttribute("goUrl", "/catstagram/account/profileUpdate");
		return "msg/msg";
	}
	
	// 프로필 이미지 변경 팝업창 열기
	@GetMapping("/catstagram/account/profileImgPopup")
	public ModelAndView profileImgPopup(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
			mav.setViewName("profileImgPopup");
		}
		return mav;
	}
	
	// 프로필 이미지 변경
	@PostMapping("/catstagram/account/profileImgUpdate")
	public ModelAndView profileImgUpdate(HttpSession session, MultipartHttpServletRequest req) {
		MultipartFile upl = req.getFile("member_img");
		String upload = upl.getOriginalFilename();
		
		int member_idx = (Integer)session.getAttribute("sidx");
		MemberDTO dto = new MemberDTO();
		dto.setMember_idx(member_idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(!upload.equals("")) {
			String noExt = upload.substring(0, upload.lastIndexOf("."));
			String ext = upload.substring(upload.lastIndexOf(".") + 1);
			String savePath = "src/main/resources/static/upload/member/";
			String saveFileName = "";
			
			try {
				byte bytes[] = upl.getBytes();
				String filefull = savePath + upload;
				File f = new File(filefull);
				if(f.isFile()) {
					boolean ex = true;
					int index = 0;
					while(ex) {
						index++;
						saveFileName = noExt+"("+index+")."+ext;
						String dictFile = savePath + saveFileName;
						ex = new File(dictFile).isFile();
						f = new File(dictFile);
					}
				} else if(!f.isFile()) {
					saveFileName = upload;
				}
				
				FileOutputStream fos = new FileOutputStream(f);
				fos.write(bytes);
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			dto.setMember_img(saveFileName);
			session.setAttribute("simg", saveFileName);
		} else {
			dto.setMember_img("");
			session.setAttribute("simg", "");
		}
		
		int result = 0;
		try {
			result = memberService.profileImgUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = result>0? "프로필 이미지가 수정되었습니다." : "프로필 이미지 수정 실패!";
		mav.addObject("msg", msg);
		mav.setViewName("msg/msgPopup");
		
		return mav;
	}
	
	@GetMapping("/catstagram/account/profileImgUpdate")
	public ModelAndView profileImgUpdateGet() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "잘못된 접근입니다.");
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		
		return mav;
	}
}