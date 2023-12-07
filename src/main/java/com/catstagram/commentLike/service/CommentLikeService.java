package com.catstagram.commentLike.service;

import com.catstagram.commentLike.model.CommentLikeDTO;

public interface CommentLikeService {
	public int likeFeedComment(CommentLikeDTO dto) throws Exception;
	public int likeFeedCommentCancel(CommentLikeDTO dto) throws Exception;
	public Integer feedLikeCommentYN(CommentLikeDTO dto) throws Exception;
}