package com.catstagram.comment.service;

import java.util.List;

import com.catstagram.comment.model.CommentDTO;

public interface CommentService {
	public List<CommentDTO> feedCommentList(int feed_idx) throws Exception;
	public int feedCommentInsert(CommentDTO dto) throws Exception;
	public int feedCommentDel(int comment_idx) throws Exception;
	public int feedCommentLikeCountPlus(int comment_idx) throws Exception;
	public int feedCommentLikeCountMinus(int comment_idx) throws Exception;
	public int feedCommentLikeCount(int comment_idx) throws Exception;
}