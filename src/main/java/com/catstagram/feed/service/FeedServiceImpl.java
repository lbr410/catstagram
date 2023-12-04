package com.catstagram.feed.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.model.FeedDTO;
import com.catstagram.mapper.CommentMapper;
import com.catstagram.mapper.FeedMapper;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedMapper mapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	// 메인 페이지에서 팔로잉(내가 친구 추가한 사람들)이 올린 피드 목록
	@Override
	public List<MainFollowingFeedDTO> mainFollowingFeed(int sidx) throws Exception {
		List<MainFollowingFeedDTO> dto = mapper.mainFollowingFeed(sidx);
		
		for(int i=0; i<dto.size(); i++) {
			dto.get(i).setFeed_comment_list(commentMapper.feedCommentList(dto.get(i).getFeed_idx()));
			for(int j=0; j<dto.get(i).getFeed_comment_list().size(); j++) {
				dto.get(i).getFeed_comment_list().get(j).setComment_date_time(null);
				// 댓글이 작성된지 1시간 미만일 경우
				if(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute() < 60) {
					dto.get(i).getFeed_comment_list().get(j).setComment_date_time(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute()+"분");
				// 댓글이 작성된지 24시간(하루) 미만일 경우
				} else if(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute() >= 60 && dto.get(i).getFeed_comment_list().get(j).getComment_date_minute() < 1440) {
					dto.get(i).getFeed_comment_list().get(j).setComment_date_time((int)Math.floor(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute()/60)+"시간");
				// 댓글이 작성된지 24시간 이상일 경우
				} else if(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute() >= 1440 && dto.get(i).getFeed_comment_list().get(j).getComment_date_minute() < 10080) {
					dto.get(i).getFeed_comment_list().get(j).setComment_date_time((int)Math.floor(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute()/1440)+"일");
				// 댓글이 작성된지 7일(일주일) 이상일 경우
				} else if(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute() >= 10080) {
					dto.get(i).getFeed_comment_list().get(j).setComment_date_time((int)Math.floor(dto.get(i).getFeed_comment_list().get(j).getComment_date_minute()/10080)+"주");
				}
			}
		}
		return dto;
	}
	
	// 피드 등록
	@Override
	public int feedWrite(FeedDTO dto) throws Exception {
		int result = mapper.feedWrite(dto);
		return result;
	}
}