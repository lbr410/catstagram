package com.catstagram.feed.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.model.FeedDTO;
import com.catstagram.mapper.FeedMapper;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedMapper mapper;
	
	// 메인 페이지에서 팔로잉(내가 친구 추가한 사람들)이 올린 피드 목록
	@Override
	public List<MainFollowingFeedDTO> mainFollowingFeed(int sidx) throws Exception {
		List<MainFollowingFeedDTO> dto = mapper.mainFollowingFeed(sidx);
		return dto;
	}
	
	// 피드 등록
	@Override
	public int feedWrite(FeedDTO dto) throws Exception {
		int result = mapper.feedWrite(dto);
		return result;
	}
}