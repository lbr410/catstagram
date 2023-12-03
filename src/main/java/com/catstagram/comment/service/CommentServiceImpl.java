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
}