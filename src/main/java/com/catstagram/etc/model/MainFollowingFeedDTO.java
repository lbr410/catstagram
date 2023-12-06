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
	private List<CommentDTO> feed_comment_list; // 해당 피드의 댓글 목록
	private Integer feed_like_idx; // 내가 이 피드에 좋아요를 눌렀는지 여부를 알기 위한 변수
}