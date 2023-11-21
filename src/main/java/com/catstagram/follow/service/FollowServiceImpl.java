package com.catstagram.follow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.follow.model.FollowDTO;
import com.catstagram.mapper.FollowMapper;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	private FollowMapper mapper;
	
	@Override
	public int following(FollowDTO dto) throws Exception {
		int result = mapper.following(dto);
		return result;
	}
	
	@Override
	public int cancelFollowing(FollowDTO dto) throws Exception {
		int result = mapper.cancelFollowing(dto);
		return result;
	}
}