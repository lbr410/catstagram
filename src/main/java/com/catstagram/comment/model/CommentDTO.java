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
	private String comment_content;
	private int comment_like_count;
	private Date comment_date;
	private String member_id;
	private String member_img;
	private int comment_date_minute;
	private String comment_date_time;
	private Integer comment_like_idx; // 내가 이 댓글에 좋아요를 눌렀는지 여부를 알기 위한 변수
}