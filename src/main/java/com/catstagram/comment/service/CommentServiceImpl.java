package com.catstagram.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.comment.model.CommentDTO;
import com.catstagram.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	public CommentMapper mapper;
	
	@Override
	public int feedCommentInsert(CommentDTO dto) throws Exception {
		int result = mapper.feedCommentInsert(dto);
		return result;
	}
}