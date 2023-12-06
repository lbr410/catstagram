package com.catstagram.feedLike.service;

import com.catstagram.feedLike.model.FeedLikeDTO;

public interface FeedLikeService {
	public int likeFeed(FeedLikeDTO dto) throws Exception;
	public int likeFeedCancel(FeedLikeDTO dto) throws Exception;
	public Integer feedLikeYN(FeedLikeDTO dto) throws Exception;
}