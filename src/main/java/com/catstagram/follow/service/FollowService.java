package com.catstagram.follow.service;

import java.util.*;

import com.catstagram.follow.model.FollowDTO;

public interface FollowService {
	public int following(FollowDTO dto) throws Exception;
	public int cancelFollowing(FollowDTO dto) throws Exception;
	public int delFollower(int member_idx, int sidx) throws Exception;
	public List<FollowDTO> suggestedFollows(int sidx) throws Exception;
	public List<FollowDTO> suggestedFollowersInMain(int sidx) throws Exception;
	public int otherFollowerCount(int member_idx) throws Exception;
}