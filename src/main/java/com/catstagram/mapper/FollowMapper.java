package com.catstagram.mapper;

import java.util.*;

import com.catstagram.follow.model.FollowDTO;

public interface FollowMapper {
	public int following(FollowDTO dto);
	public int cancelFollowing(FollowDTO dto);
	public int delFollower(Map map);
	public FollowDTO suggestedFollowers(int sidx);
	public FollowDTO suggestedFollowersInMain(int sidx);
}