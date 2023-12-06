package com.catstagram.feedLike.model;

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
public class FeedLikeDTO {
	private int feed_like_idx;
	private int feed_idx;
	private int member_idx;
	private Date feed_like_date;
}