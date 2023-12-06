package com.catstagram.mapper;

import com.catstagram.feedLike.model.FeedLikeDTO;

public interface FeedLikeMapper {
	public int likeFeed(FeedLikeDTO dto);
	public int likeFeedCancel(FeedLikeDTO dto);
	public Integer feedLikeYN(FeedLikeDTO dto);
}