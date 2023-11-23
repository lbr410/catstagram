package com.catstagram.follow.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.follow.model.FollowDTO;
import com.catstagram.mapper.FollowMapper;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	private FollowMapper mapper;
	
	// 팔로잉(친구추가)
	@Override
	public int following(FollowDTO dto) throws Exception {
		int result = mapper.following(dto);
		return result;
	}
	
	// 팔로잉 취소(친구삭제)
	@Override
	public int cancelFollowing(FollowDTO dto) throws Exception {
		int result = mapper.cancelFollowing(dto);
		return result;
	}
	
	// 나를 팔로워한(친구 추가한) 사람을 팔로워 목록에서 삭제
	@Override
	public int delFollower(int member_idx, int sidx) throws Exception {
		Map map = new HashMap();
		map.put("member_from", member_idx);
		map.put("member_to", sidx);
		int result = mapper.delFollower(map);
		return result;
	}
}