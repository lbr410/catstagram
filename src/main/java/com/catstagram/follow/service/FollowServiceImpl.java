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
	
	// 팔로우 추천(친구 추천, 최대 100명)
	@Override
	public List<FollowDTO> suggestedFollows(int sidx) throws Exception {
		List<FollowDTO> list = mapper.suggestedFollows(sidx);
		return list;
	}
	
	// 랜덤으로 3명 팔로우 추천(메인에서 랜덤으로 3명 친구 추천)
	@Override
	public List<FollowDTO> suggestedFollowersInMain(int sidx) throws Exception {
		List<FollowDTO> list = mapper.suggestedFollowersInMain(sidx);
		return list;
	}
	
	// 다른 회원의 팔로워 수(내가 그 회원을 팔로잉 후 증감변화를 알기 위함)
	@Override
	public int otherFollowerCount(int member_idx) throws Exception {
		int result = mapper.otherFollowerCount(member_idx);
		return result;
	}
	
	// 이 회원은 내 팔로우들 중 누가누가 팔로잉했는지
	@Override
	public FollowDTO whoFollow(int member_idx, int sidx) throws Exception {
		Map map = new HashMap();
		map.put("member_idx", member_idx);
		map.put("sidx", sidx);
		FollowDTO dto = mapper.whoFollow(map);
		return dto;
	}
}