package com.catstagram.etc.model;

import java.util.Date;

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
public class AlarmDTO {
	private String activity_type;
	private String member_id;
	private int follow_idx;
	private int feed_idx;
	private String feed_img;
	private int feed_like_idx;
	private int comment_idx;
	private String comment_content;
	private int comment_like_idx;
	private Date alarm_date;
	private int alarm_date_minute;
	private String alarm_date_string; // 분, 일, 주로 나타낸 것
}