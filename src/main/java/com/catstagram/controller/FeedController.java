package com.catstagram.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.feed.model.FeedDTO;
import com.catstagram.feed.service.FeedService;
import com.catstagram.feedLike.model.FeedLikeDTO;
import com.catstagram.feedLike.service.FeedLikeService;
import com.catstagram.member.service.MemberService;

@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private FeedLikeService feedLikeService;
	
	@Autowired
	private MemberService memberService;
	
	// 피드 등록 페이지로 이동
	@GetMapping("/catstagram/account/feedWrite")
	public ModelAndView feedWriteForm(HttpSession session) {
		Integer w_sidx = (Integer)session.getAttribute("sidx");
		ModelAndView mav = new ModelAndView();
		int sidx = (Integer)session.getAttribute("sidx");
		
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
		
		if(w_sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		} else {
			mav.addObject("alarmList", alarmList);
			mav.setViewName("feedWrite");
		}
		return mav;
	}
	
	// 피드 등록
	@PostMapping("/catstagram/account/feedWrite")
	public ModelAndView feedWrite(HttpSession session, MultipartHttpServletRequest req) {
		MultipartFile upl = req.getFile("feed_img");
		String upload = upl.getOriginalFilename();
		String noExt = upload.substring(0, upload.lastIndexOf("."));
		String ext = upload.substring(upload.lastIndexOf(".") + 1);
		
		String savePath = "src/main/resources/static/upload/feed/";
		
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
		}  catch (IOException e) {
			e.printStackTrace();
		}
		
		int member_idx = (Integer)session.getAttribute("sidx");
		FeedDTO dto = new FeedDTO();
		dto.setMember_idx(member_idx);
		dto.setFeed_img(saveFileName);
		dto.setFeed_content(req.getParameter("feed_content"));
		
		int result = 0;
		try {
			result = feedService.feedWrite(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		String msg = result>0 ? "피드 등록 완료!" : "피드 등록 실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}
	
	// 피드 수정 페이지로 이동
	@GetMapping("/catstagram/account/feedUpdate")
	public ModelAndView feedUpdateForm(@RequestParam(value = "feed_idx", defaultValue = "0") int feed_idx, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer sidx = (Integer)session.getAttribute("sidx");
		Integer feed_idx_c = (Integer)feed_idx;
		
		// 해당 피드 작성자의 idx
		Integer member_idx = 0;
		try {
			member_idx = feedService.feedMemberIdx(feed_idx_c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 수정할 피드의 정보
		FeedDTO dto = new FeedDTO();
		try {
			dto = feedService.feedUpdateInfo(feed_idx);
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

		if(feed_idx_c != null && member_idx.equals(sidx)) {
			mav.addObject("alarmList", alarmList);
			mav.addObject("feedInfo", dto);
			mav.setViewName("feedUpdate");
		} else if(feed_idx_c == null || !member_idx.equals(sidx) || sidx == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("goUrl", "/catstagram");
			mav.setViewName("msg/msg");
		}
		
		return mav;
	}
	
	// 피드 수정
	@PostMapping("/catstagram/account/feedUpdate")
	public ModelAndView feedUpdate(FeedDTO dto) {
		int result = 0;
		try {
			result = feedService.feedUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		String msg = result>0 ? "피드를 수정하였습니다." : "피드 수정 실패!";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	// 피드 삭제
	@PostMapping("/catstagram/account/feedDel")
	public ModelAndView feedDel(@RequestParam("feed_idx") int feed_idx) {
		int result = 0;
		try {
			result = feedService.feedDel(feed_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView();
		String msg = result>0 ? "피드가 삭제되었습니다." : "피드 삭제 실패!";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		return mav;
	}

	@GetMapping("/catstagram/account/feedDel")
	public ModelAndView feedDelGet() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "잘못된 접근입니다.");
		mav.addObject("goUrl", "/catstagram");
		mav.setViewName("msg/msg");
		
		return mav;
	}
	
	// 피드 좋아요
	@ResponseBody
	@PostMapping("/catstagram/account/likeFeed")
	public int likeFeed(@RequestParam("feed_idx") int feed_idx, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		FeedLikeDTO dto = new FeedLikeDTO();
		dto.setFeed_idx(feed_idx);
		dto.setMember_idx(sidx);
		
		int feedLikeCount = 0;
		try {
			feedLikeService.likeFeed(dto);
			feedService.feedLikeCountPlus(feed_idx);
			feedLikeCount = feedService.feedLikeCount(feed_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return feedLikeCount;
	}
	
	// 피드 좋아요 취소
	@ResponseBody
	@PostMapping("/catstagram/account/likeFeedCancel")
	public int likeFeedCancel(@RequestParam("feed_idx") int feed_idx, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		FeedLikeDTO dto = new FeedLikeDTO();
		dto.setFeed_idx(feed_idx);
		dto.setMember_idx(sidx);
		
		int feedLikeCount = 0;
		try {
			feedLikeService.likeFeedCancel(dto);
			feedService.feedLikeCountMinus(feed_idx);
			feedLikeCount = feedService.feedLikeCount(feed_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return feedLikeCount;
	}
}