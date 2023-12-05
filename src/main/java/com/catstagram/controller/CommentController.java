package com.catstagram.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.comment.model.CommentDTO;
import com.catstagram.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	// 피드(게시글) 댓글 작성
	@ResponseBody
	@PostMapping("/catstagram/feedCommentInsert")
	public List<CommentDTO> feedCommentInsert(@RequestParam("feed_idx") int feed_idx,
										  @RequestParam("comment_content") String comment_content,
										  HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		CommentDTO dto = new CommentDTO();
		dto.setMember_idx(sidx);
		dto.setFeed_idx(feed_idx);
		dto.setComment_content(comment_content);
		//int result = 0;
		try {
			commentService.feedCommentInsert(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		List<CommentDTO> list = null;
		try {
			list = commentService.feedCommentList(feed_idx);
			for(int i=0; i<list.size(); i++) {
				// 댓글이 작성된지 1시간 미만일 경우
				if(list.get(i).getComment_date_minute() < 60) {
					list.get(i).setComment_date_time(list.get(i).getComment_date_minute()+"분");
				// 댓글이 작성된지 24시간(하루) 미만일 경우
				} else if(list.get(i).getComment_date_minute() >= 60 && list.get(i).getComment_date_minute() < 1440) {
					list.get(i).setComment_date_time((int)Math.floor(list.get(i).getComment_date_minute()/60)+"시간");
				// 댓글이 작성된지 24시간 이상일 경우
				} else if(list.get(i).getComment_date_minute() >= 1440 && list.get(i).getComment_date_minute() < 10080) {
					list.get(i).setComment_date_time((int)Math.floor(list.get(i).getComment_date_minute()/1440)+"일");
				// 댓글이 작성된지 7일(일주일) 이상일 경우
				} else if(list.get(i).getComment_date_minute() >= 10080) {
					list.get(i).setComment_date_time((int)Math.floor(list.get(i).getComment_date_minute()/10080)+"주");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	// 피드(게시글) 댓글 삭제
	@PostMapping("/catstagram/feedCommentDel")
	public String feedCommentDel(@RequestParam("comment_idx") int comment_idx) {
		System.out.println("comment_idx : "+comment_idx);
		try {
			commentService.feedCommentDel(comment_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main";
	}
}