package com.catstagram.feed.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.feed.model.FeedDTO;
import com.catstagram.mapper.FeedMapper;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedMapper mapper;
	
	@Override
	public int feedWrite(FeedDTO dto) throws Exception {
		int result = mapper.feedWrite(dto);
		return result;
	}
}