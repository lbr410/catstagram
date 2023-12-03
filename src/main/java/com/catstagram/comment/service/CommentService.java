package com.catstagram.comment.service;

import com.catstagram.comment.model.CommentDTO;

public interface CommentService {
	public int feedCommentInsert(CommentDTO dto) throws Exception;
}