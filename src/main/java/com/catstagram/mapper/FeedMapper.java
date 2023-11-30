package com.catstagram.mapper;

import java.util.*;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.model.FeedDTO;

public interface FeedMapper {
	public List<MainFollowingFeedDTO> mainFollowingFeed(int sidx);
	public int feedWrite(FeedDTO dto);
}