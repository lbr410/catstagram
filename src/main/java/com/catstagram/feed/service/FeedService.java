package com.catstagram.feed.service;

import java.util.*;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.model.FeedDTO;

public interface FeedService {
	public List<MainFollowingFeedDTO> mainFollowingFeed(int sidx) throws Exception;
	public int feedWrite(FeedDTO dto) throws Exception;
	public Integer feedMemberIdx(int feed_idx) throws Exception;
	public FeedDTO feedUpdateInfo(int feed_idx) throws Exception;
	public int feedUpdate(FeedDTO dto) throws Exception;
	public int feedDel(int feed_idx) throws Exception;
	public int feedLikeCountPlus(int feed_idx) throws Exception;
	public int feedLikeCountMinus(int feed_idx) throws Exception;
	public int feedLikeCount(int feed_idx) throws Exception;
	public List<MainFollowingFeedDTO> feedList(int member_idx, int sidx) throws Exception;
}