package com.catstagram.mapper;

import com.catstagram.feed.model.FeedDTO;

public interface FeedMapper {
	public int feedWrite(FeedDTO dto);
}