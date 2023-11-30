package com.catstagram.feed.service;

import java.util.*;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.model.FeedDTO;

public interface FeedService {
	public List<MainFollowingFeedDTO> mainFollowingFeed(int sidx) throws Exception;
	public int feedWrite(FeedDTO dto) throws Exception;
}