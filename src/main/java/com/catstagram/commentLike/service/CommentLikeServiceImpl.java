package com.catstagram.commentLike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.commentLike.model.CommentLikeDTO;
import com.catstagram.mapper.CommentLikeMapper;

@Service
public class CommentLikeServiceImpl implements CommentLikeService {
	
	@Autowired
	private CommentLikeMapper mapper;
	
	// 피드 댓글 좋아요
	@Override
	public int likeFeedComment(CommentLikeDTO dto) throws Exception {
		int result = mapper.likeFeedComment(dto);
		return result;
	}
	
	// 피드 댓글 좋아요 취소
	@Override
	public int likeFeedCommentCancel(CommentLikeDTO dto) throws Exception {
		int result = mapper.likeFeedCommentCancel(dto);
		return result;
	}
	
	// 내가 이 댓글에 좋아요를 눌렀는지 여부
	@Override
	public Integer feedLikeCommentYN(CommentLikeDTO dto) throws Exception {
		Integer result = mapper.feedLikeCommentYN(dto);
		return result;
	}
}