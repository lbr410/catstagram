package com.catstagram.mapper;

import java.util.List;

import com.catstagram.comment.model.CommentDTO;

public interface CommentMapper {
	public List<CommentDTO> feedCommentList(int feed_idx);
	public int feedCommentInsert(CommentDTO dto);
	public int feedCommentDel(int comment_idx);
	public int feedCommentLikeCountPlus(int comment_idx);
	public int feedCommentLikeCountMinus(int feed_idx);
	public int feedCommentLikeCount(int feed_idx);
}