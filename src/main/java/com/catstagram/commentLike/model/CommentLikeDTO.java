package com.catstagram.commentLike.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CommentLikeDTO {
	private int comment_like_idx;
	private int comment_idx;
	private int member_idx;
	private Date comment_like_date;
}