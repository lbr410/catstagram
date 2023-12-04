package com.catstagram.etc.model;

import java.sql.Date;
import java.util.List;

import com.catstagram.comment.model.CommentDTO;

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
public class MainFollowingFeedDTO {
	private int follow_idx;
	private int member_idx;
	private String member_id;
	private String member_img;
	private int feed_idx;
	private String feed_img;
	private String feed_content;
	private int feed_like_count;
	private Date feed_date;
	private int feed_date_minute;
	private String feed_date_time;
	private List<CommentDTO> feed_comment_list;
}