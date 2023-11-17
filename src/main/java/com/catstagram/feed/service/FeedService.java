package com.catstagram.feed.service;

import com.catstagram.feed.model.FeedDTO;

public interface FeedService {
	public int feedWrite(FeedDTO dto) throws Exception;
}