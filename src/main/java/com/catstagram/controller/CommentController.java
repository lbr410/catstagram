package com.catstagram.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catstagram.comment.model.CommentDTO;
import com.catstagram.comment.service.CommentService;
import com.catstagram.commentLike.model.CommentLikeDTO;
import com.catstagram.commentLike.service.CommentLikeService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CommentLikeService commentLikeService;
	
	// 피드(게시글) 댓글 작성
	@ResponseBody
	@PostMapping("/catstagram/account/feedCommentInsert")
	public List<CommentDTO> feedCommentInsert(@RequestParam("feed_idx") int feed_idx,
										  @RequestParam("comment_content") String comment_content,
										  HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		CommentDTO dto = new CommentDTO();
		dto.setMember_idx(sidx);
		dto.setFeed_idx(feed_idx);
		dto.setComment_content(comment_content);
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
				
				// 내가 이 댓글에 좋아요를 눌렀는지에 대한 여부
				CommentLikeDTO cldto = new CommentLikeDTO();
				cldto.setComment_idx(list.get(i).getComment_idx());
				cldto.setMember_idx(sidx);
				list.get(i).setComment_like_idx(commentLikeService.feedLikeCommentYN(cldto));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	// 피드(게시글) 댓글 삭제
	@PostMapping("/catstagram/account/feedCommentDel")
	public String feedCommentDel(@RequestParam("comment_idx") int comment_idx) {
		try {
			commentService.feedCommentDel(comment_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main";
	}
	
	// 피드 댓글 좋아요
	@ResponseBody
	@PostMapping("/catstagram/account/likeFeedComment")
	public int likeFeedComment(@RequestParam("comment_idx") int comment_idx, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		CommentLikeDTO dto = new CommentLikeDTO();
		dto.setComment_idx(comment_idx);
		dto.setMember_idx(sidx);
		
		int commentLikeCount = 0;
		try {
			commentLikeService.likeFeedComment(dto);
			commentService.feedCommentLikeCountPlus(comment_idx);
			commentLikeCount = commentService.feedCommentLikeCount(comment_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return commentLikeCount;
	}
	
	// 피드 댓글 좋아요 취소
	@ResponseBody
	@PostMapping("/catstagram/account/likeFeedCommentCancel")
	public int likeFeedCommentCancel(@RequestParam("comment_idx") int comment_idx, HttpSession session) {
		int sidx = (Integer)session.getAttribute("sidx");
		CommentLikeDTO dto = new CommentLikeDTO();
		dto.setComment_idx(comment_idx);
		dto.setMember_idx(sidx);
		
		int commentLikeCount = 0;
		try {
			commentLikeService.likeFeedCommentCancel(dto);
			commentService.feedCommentLikeCountMinus(comment_idx);
			commentLikeCount = commentService.feedCommentLikeCount(comment_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return commentLikeCount;
	}
}