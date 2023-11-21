package com.catstagram.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.feed.model.FeedDTO;
import com.catstagram.feed.service.FeedService;

@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	// 피드 등록 페이지로 이동
	@GetMapping("/catstagram/feedWrite")
	public String feedWriteForm() {
		return "feedWrite";
	}
	
	// 피드 등록
	@PostMapping("/catstagram/feedWrite")
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
		mav.addObject("goUrl", "/catstagram/main");
		mav.setViewName("msg/msg");
		return mav;
	}
	
	// 수정할 예정
	@GetMapping("/catstagram/feedUpdate")
	public String feedUpdate() {
		return "feedUpdate";
	}
}