package com.catstagram.controller;

import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.follow.model.FollowDTO;
import com.catstagram.follow.service.FollowService;
import com.catstagram.member.model.MemberDTO;
import com.catstagram.member.service.MemberService;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private MemberService memberService;
	
	// 팔로잉(친구추가)
	@ResponseBody
	@PostMapping("/catstagram/account/following")
	public int following(@RequestParam("to") int to, HttpSession session) {
		FollowDTO dto = new FollowDTO();
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_from(sidx);
		dto.setMember_to(to);
		
		try {
			followService.following(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return to;
	}
	
	// 팔로잉 취소(친구삭제)
	@ResponseBody
	@PostMapping("/catstagram/account/cancelFollowing")
	public int cancelFollowing(@RequestParam("to") int to, HttpSession session) {
		FollowDTO dto = new FollowDTO();
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_from(sidx);
		dto.setMember_to(to);
		
		try {
			followService.cancelFollowing(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return to;
	}
	
	// 팔로워 목록 페이지(나를 친구 추가한 사람)
	@GetMapping("/catstagram/account/follower")
	public ModelAndView followerForm(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
			int sidx = (Integer)session.getAttribute("sidx");
			List<MemberDTO> list = null;
			try {
				list = memberService.followerList(sidx);
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
			mav.setViewName("follower");
		}
		return mav;
	}
	
	// 나를 팔로워한(친구 추가한) 사람을 팔로워 목록에서 삭제하기
	@PostMapping("/catstagram/account/delFollower")
	public String delFollower(@RequestParam("to") int member_idx, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		try {
			followService.delFollower(member_idx, sidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "follower";
	}
	
	// 팔로잉 목록 페이지(내가 친구 추가한 사람)
	@GetMapping("/catstagram/account/following")
	public ModelAndView followingForm(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
			int sidx = (Integer)session.getAttribute("sidx");
			List<MemberDTO> list = null;
			try {
				list = memberService.followingList(sidx);
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
			mav.setViewName("following");
		}
		return mav;
	}
	
	// 팔로우 추천 페이지
	@GetMapping("/catstagram/account/suggestedFollows")
	public ModelAndView suggestedFollows(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
			int sidx = (Integer)session.getAttribute("sidx");
			List<FollowDTO> suggestedFollows = null;
			String[] followingList = null;
			
			try {
				suggestedFollows = followService.suggestedFollows(sidx);
				for(int i=0; i<suggestedFollows.size(); i++) {
					followingList = suggestedFollows.get(i).getMy_following_list().split(",");
					suggestedFollows.get(i).setMy_following_list_arr(followingList);
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
			mav.addObject("suggestedFollows", suggestedFollows);
			mav.setViewName("suggestedFollows");
		}
		return mav;
	}
	
	// 다른 사람의 팔로워 목록 페이지
	@GetMapping("/catstagram/{member_id}/follower")
	public ModelAndView followerOther(@PathVariable String member_id, HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		String sid = (String)session.getAttribute("sid");
		ModelAndView mav = new ModelAndView();
		
		MemberDTO dto = null;
		try {
			dto = memberService.followListOtherInfo(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dto != null && w_sidx != null) {
			if(dto.getMember_id().equals(sid)) {
				mav.setViewName("redirect:/catstagram/account/follower");
			} else {
				int sidx = (Integer)session.getAttribute("sidx");
				List<MemberDTO> list = null;
				try {
					list = memberService.otherFollowerList(dto.getMember_idx(), sidx);
					
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
				mav.addObject("member_id", member_id);
				mav.addObject("list", list);
				mav.setViewName("followerOther");				
			}
		} else if(dto == null) {
			mav.setViewName("emptyPage");
		} else if(w_sidx == null) {
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		
		return mav;
	}
	
	// 다른 사람의 팔로잉 목록 페이지
	@GetMapping("/catstagram/{member_id}/following")
	public ModelAndView followingOther(@PathVariable String member_id, HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		String sid = (String)session.getAttribute("sid");
		ModelAndView mav = new ModelAndView();
		
		MemberDTO dto = null;
		try {
			dto = memberService.followListOtherInfo(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dto != null && w_sidx != null) {
			if(dto.getMember_id().equals(sid)) {
				mav.setViewName("redirect:/catstagram/account/following");
			} else {
				int sidx = (Integer)session.getAttribute("sidx");
				List<MemberDTO> list = null;
				try {
					list = memberService.otherFollowingList(dto.getMember_idx(), sidx);
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
				mav.addObject("member_id", member_id);
				mav.addObject("list", list);
				mav.setViewName("followingOther");				
			}
		} else if(dto == null) {
			mav.setViewName("emptyPage");
		} else if(w_sidx == null) {
			mav.addObject("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		
		return mav;
	}
	
	// 다른 회원의 Catstagram에서 팔로잉하기(팔로워 증감수 반환)
	@ResponseBody
	@PostMapping("/catstagram/account/followingCount")
	public Map<String, Object> followingCount(@RequestParam("to") int to, HttpSession session) {
		Map<String, Object> resp = new HashMap<String, Object>();
		FollowDTO dto = new FollowDTO();
		DecimalFormat df = new DecimalFormat("#,#");
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_from(sidx);
		dto.setMember_to(to);
		
		int followerCount = 0;
		String followerCount_s = null;
		try {
			followService.following(dto);
			followerCount = followService.otherFollowerCount(to);
			if(followerCount < 1000) {
				followerCount_s = followerCount+"";
			} else if(followerCount >= 1000 && followerCount <= 999999) {
				followerCount_s = df.format(followerCount)+"K";
			} else if(followerCount > 1000000) {
				followerCount_s = df.format(followerCount)+"M";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.put("to", to);
		resp.put("followerCount", followerCount_s);
		
		return resp;
	}
	
	// 다른 회원의 Catstagram에서 팔로잉 취소하기(팔로워 증감수 반환)
	@ResponseBody
	@PostMapping("/catstagram/account/cancelFollowingCount")
	public Map<String, Object> cancelFollowingCount(@RequestParam("to") int to, HttpSession session) {
		Map<String, Object> resp = new HashMap<String, Object>();
		FollowDTO dto = new FollowDTO();
		DecimalFormat df = new DecimalFormat("#,#");
		int sidx = (Integer)session.getAttribute("sidx");
		dto.setMember_from(sidx);
		dto.setMember_to(to);

		int followerCount = 0;
		String followerCount_s = null;
		try {
			followService.cancelFollowing(dto);
			followerCount = followService.otherFollowerCount(to);
			if(followerCount < 1000) {
				followerCount_s = followerCount+"";
			} else if(followerCount >= 1000 && followerCount <= 999999) {
				followerCount_s = df.format(followerCount)+"K";
			} else if(followerCount > 1000000) {
				followerCount_s = df.format(followerCount)+"M";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.put("to", to);
		resp.put("followerCount", followerCount_s);
		
		return resp;
	}
}