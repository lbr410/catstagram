package com.catstagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	// 피드(게시글) 댓글 작성
	@GetMapping("/catstagram/feedCommentInsert")
	public ModelAndView feedCommentInsert() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}