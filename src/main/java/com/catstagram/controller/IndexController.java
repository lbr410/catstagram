package com.catstagram.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.service.FeedService;
import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class IndexController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private FeedService feedService;
	
	// 로그인 화면으로 이동
	@GetMapping("/catstagram")
	public ModelAndView index(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		if(w_sidx == null) {
			mav.setViewName("index");
			System.out.println("sidx : "+session.getAttribute("sidx"));
			System.out.println("sid : "+session.getAttribute("sid"));
			System.out.println("sname : "+session.getAttribute("sname"));
			System.out.println("simg : "+session.getAttribute("simg"));
		} else {
			int sidx = (Integer)session.getAttribute("sidx");
			
			// 팔로잉(내가 친구 추가한 사람들)이 올린 피드 목록
			List<MainFollowingFeedDTO> mainFollowingFeed = null;
	
			try {
				mainFollowingFeed = feedService.mainFollowingFeed(sidx);
				for(int i=0; i<mainFollowingFeed.size(); i++) {
					// 피드가 작성된지 1시간 미만일 경우
					if(mainFollowingFeed.get(i).getFeed_date_minute() < 60) {
						mainFollowingFeed.get(i).setFeed_date_time(mainFollowingFeed.get(i).getFeed_date_minute()+"분");
					// 피드가 작성된지 24시간(하루) 미만일 경우
					} else if(mainFollowingFeed.get(i).getFeed_date_minute() >= 60 && mainFollowingFeed.get(i).getFeed_date_minute() < 1440) {
						mainFollowingFeed.get(i).setFeed_date_time((int)Math.floor(mainFollowingFeed.get(i).getFeed_date_minute()/60)+"시간");
					// 피드가 작성된지 24시간 이상일 경우
					} else if(mainFollowingFeed.get(i).getFeed_date_minute() >= 1440 && mainFollowingFeed.get(i).getFeed_date_minute() < 10080) {
						mainFollowingFeed.get(i).setFeed_date_time((int)Math.floor(mainFollowingFeed.get(i).getFeed_date_minute()/1440)+"일");
					// 피드가 작성된지 7일(일주일) 이상일 경우
					} else if(mainFollowingFeed.get(i).getFeed_date_minute() >= 10080) {
						mainFollowingFeed.get(i).setFeed_date_time((int)Math.floor(mainFollowingFeed.get(i).getFeed_date_minute()/10080)+"주");
					}
					
					// 피드 내용 개행 처리
					mainFollowingFeed.get(i).setFeed_content(mainFollowingFeed.get(i).getFeed_content().replaceAll("\n", "<br>"));
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			// 회원님을 위한 추천
			List<FollowDTO> suggestedFollowersInMain = null;
			String[] followingList = null;
			
			try {
				suggestedFollowersInMain = followService.suggestedFollowersInMain(sidx);
				for(int i=0; i<suggestedFollowersInMain.size(); i++) {
					followingList = suggestedFollowersInMain.get(i).getMy_following_list().split(",");
					suggestedFollowersInMain.get(i).setMy_following_list_arr(followingList);
				}
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
			mav.addObject("mainFollowingFeed", mainFollowingFeed);
			mav.addObject("suggestedFollowersInMain", suggestedFollowersInMain);
			mav.setViewName("main");
		}
		
		
		return mav;
	}
	
	// 로그인
	@PostMapping("/catstagram/account/login")
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
				ck.setPath("/");
				resp.addCookie(ck);
			} else {
				Cookie ck = new Cookie("saveid", id);
				ck.setMaxAge(60*60*24*30); // 30일
				ck.setPath("/");
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
			
			mav.setViewName("redirect:/catstagram");
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
	
	@GetMapping("/catstagram/account/login")
	public ModelAndView loginGetReq(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", "잘못된 접근입니다.");
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}
}