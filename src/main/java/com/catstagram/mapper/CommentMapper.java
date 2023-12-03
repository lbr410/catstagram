package com.catstagram.mapper;

import com.catstagram.comment.model.CommentDTO;

public interface CommentMapper {
	public int feedCommentInsert(CommentDTO dto);
}