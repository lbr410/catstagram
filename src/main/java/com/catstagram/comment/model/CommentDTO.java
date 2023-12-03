package com.catstagram.comment.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommentDTO {
	private int comment_idx;
	private int feed_idx;
	private int member_idx;
	private String feed_content;
	private int comment_like_count;
	private Date comment_date;
	private String member_id;
}