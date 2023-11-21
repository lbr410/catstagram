package com.catstagram.follow.service;

import com.catstagram.follow.model.FollowDTO;

public interface FollowService {
	public int following(FollowDTO dto) throws Exception;
	public int cancelFollowing(FollowDTO dto) throws Exception;
}