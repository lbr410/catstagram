package com.catstagram.mapper;

import com.catstagram.follow.model.FollowDTO;

public interface FollowMapper {
	public int following(FollowDTO dto);
}