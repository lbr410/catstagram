package com.catstagram.mapper;

import com.catstagram.commentLike.model.CommentLikeDTO;

public interface CommentLikeMapper {
	public int likeFeedComment(CommentLikeDTO dto);
	public int likeFeedCommentCancel(CommentLikeDTO dto);
	public Integer feedLikeCommentYN(CommentLikeDTO dto);
}