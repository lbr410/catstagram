package com.catstagram.feedLike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.feedLike.model.FeedLikeDTO;
import com.catstagram.mapper.FeedLikeMapper;

@Service
public class FeedLikeServiceImpl implements FeedLikeService {
	
	@Autowired
	private FeedLikeMapper mapper;
	
	// 피드 좋아요
	@Override
	public int likeFeed(FeedLikeDTO dto) throws Exception {
		int result = mapper.likeFeed(dto);
		return result;
	}
	
	// 피드 좋아요 취소
	@Override
	public int likeFeedCancel(FeedLikeDTO dto) throws Exception {
		int result = mapper.likeFeedCancel(dto);
		return result;
	}
	
	// 내가 이 피드에 좋아요를 눌렀는지 여부
	@Override
	public Integer feedLikeYN(FeedLikeDTO dto) throws Exception {
		Integer result = mapper.feedLikeYN(dto);
		return result;
	}
}