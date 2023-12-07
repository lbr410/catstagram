package com.catstagram.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.comment.model.CommentDTO;
import com.catstagram.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	public CommentMapper mapper;
	
	// 피드(게시글) 댓글 목록
	@Override
	public List<CommentDTO> feedCommentList(int feed_idx) throws Exception {
		List<CommentDTO> dto = mapper.feedCommentList(feed_idx);
		return dto;
	}
	
	// 피드(게시글) 댓글 작성
	@Override
	public int feedCommentInsert(CommentDTO dto) throws Exception {
		int result = mapper.feedCommentInsert(dto);
		return result;
	}
	
	// 피드(게시글) 댓글 삭제
	@Override
	public int feedCommentDel(int comment_idx) throws Exception {
		int result = mapper.feedCommentDel(comment_idx);
		return result;
	}
	
	// 피드 댓글 좋아요수 증가
	@Override
	public int feedCommentLikeCountPlus(int comment_idx) throws Exception {
		int result = mapper.feedCommentLikeCountPlus(comment_idx);
		return result;
	}
	
	// 피드 댓글 좋아요수 감소
	@Override
	public int feedCommentLikeCountMinus(int comment_idx) throws Exception {
		int result = mapper.feedCommentLikeCountMinus(comment_idx);
		return result;
	}
	
	// 피드 댓글 좋아요수
	@Override
	public int feedCommentLikeCount(int comment_idx) throws Exception {
		int result = mapper.feedCommentLikeCount(comment_idx);
		return result;
	}
}