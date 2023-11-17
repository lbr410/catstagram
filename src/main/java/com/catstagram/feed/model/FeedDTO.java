package com.catstagram.feed.model;

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
public class FeedDTO {
	private int feed_idx;
	private int member_idx;
	private String feed_img;
	private String feed_content;
	private int feed_like_count;
	private Date feed_date;
}