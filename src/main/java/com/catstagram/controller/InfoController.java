package com.catstagram.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.encryption.Encryption;
import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class InfoController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원 정보 수정 페이지로 이동
	@GetMapping("catstagram/account/infoUpdate")
	public ModelAndView infoUpdateForm(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		int sidx = (Integer)session.getAttribute("sidx");
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
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
			mav.setViewName("infoUpdate");
		}
		return mav;
	}
	
	// 회원 정보 수정
	@PostMapping("/catstagram/account/infoUpdate")
	public ModelAndView infoUpdate(MemberDTO dto, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		
		dto.setMember_idx(sidx);
		int result = 0;
		try {
			result = memberService.infoUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("msg", "회원 정보가 수정되었습니다.");
			session.setAttribute("sid", dto.getMember_id());
			session.setAttribute("sname", dto.getMember_name());
			mav.setViewName("msg/msg");			
		} else {
			mav.addObject("msg", "회원 정보 수정 실패!");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
	
	// 비밀번호 확인 페이지(비밀번호 수정)
	@GetMapping("/catstagram/account/pwdUpdate")
	public ModelAndView pwdChkFormForPwdUpdate(@RequestParam(value = "page", defaultValue = "") String page,
								   HttpSession session) {
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(!page.equals("") && page.equals("p") && page != null && sidx != null) {
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
			mav.addObject("page", page);
			mav.setViewName("pwdChk");
		} else if(page.equals("") || page == null || !page.equals("p") || sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram"); 
			mav.setViewName("msg/msg");
		}

		return mav;
	}
	
	// 비밀번호 확인 페이지(회원탈퇴)
	@GetMapping("/catstagram/account/quit")
	public ModelAndView pwdChkFormForQuit(@RequestParam(value = "page", defaultValue = "") String page,
								   HttpSession session) {
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(!page.equals("") && page.equals("q") && page != null && sidx != null) {
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
			mav.addObject("page", page);
			mav.setViewName("pwdChk");
		} else if(page.equals("") || page == null || !page.equals("q") || sidx == null) {
			mav.addObject("goUrl", "/catstagram");
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.setViewName("msg/msg");
		}

		return mav;
	}
	
	// 비밀번호 확인
	@PostMapping({"/catstagram/account/pwdUpdate", "/catstagram/account/quit"})
	public ModelAndView pwdChk(@RequestParam(value = "page", defaultValue = "") String page,
						 	   @RequestParam("member_pwd") String member_pwd, HttpSession session) {
		Integer sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		String dbPwd = null;
		try {
			dbPwd = memberService.pwdChk(sidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dbPwd.equals(Encryption.sha256(member_pwd))) {
			if(!page.equals("") && page != null && sidx != null) {
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
				
				if(page.equals("p")) {
					mav.setViewName("pwdUpdate");
				} else if(page.equals("q")) {
					mav.setViewName("quit");
				}
			} else if(page.equals("") || page == null) {
				mav.addObject("goUrl", "/catstagram");
				mav.addObject("msg", "잘못된 접근입니다.");
				mav.setViewName("msg/msg");
			}
		} else {
			mav.addObject("msg", "비밀번호를 확인바랍니다.");
			mav.setViewName("msg/msgNoDeco");
		}
		return mav;
	}
	
	// 비밀번호 변경
	@PostMapping("/catstagram/account/pwdUpdateOk")
	public ModelAndView pwdUpdateOk(@RequestParam("member_pwd") String pwd, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		MemberDTO dto = new MemberDTO();
		dto.setMember_pwd(Encryption.sha256(pwd));
		dto.setMember_idx(sidx);
		int result = 0;
		try {
			result = memberService.pwdUpdateOk(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = result>0 ? "비밀번호가 수정되었습니다." : "비밀번호 수정 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}
	
	@GetMapping("/catstagram/account/pwdUpdateOk")
	public ModelAndView pwdUpdateOkGet() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "잘못된 접근입니다.");
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}
	
	// 회원탈퇴
	@PostMapping("/catstagram/account/quitOk")
	public ModelAndView quitOk(HttpSession session, HttpServletResponse resp) {
		int sidx = (Integer)session.getAttribute("sidx");
		String sid = (String)session.getAttribute("sid");
		
		int result = 0;
		try {
			result = memberService.quit(sidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		String msg = null;
		if(result>0) {
			msg = "나중에 또 만나요. 😭";
			
			mav.addObject("msg", msg);
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
			
			// 아이디 저장하기 쿠키 삭제
			Cookie ck = new Cookie("saveid", sid);
			ck.setMaxAge(0);
			ck.setPath("/");
			resp.addCookie(ck);
			
			// 세션 삭제
			session.removeAttribute("sidx");
			session.removeAttribute("sid");
			session.removeAttribute("sname");
			session.removeAttribute("simg");
		} else {
			msg = "회원탈퇴 실패!";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		return mav;
	}
	
	@GetMapping("/catstagram/account/quitOk")
	public ModelAndView quitOkGet() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "잘못된 접근입니다.");
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}
}