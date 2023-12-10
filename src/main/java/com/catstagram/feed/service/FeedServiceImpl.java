package com.catstagram.feed.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.commentLike.model.CommentLikeDTO;
import com.catstagram.etc.model.MainFollowingFeedDTO;
import com.catstagram.feed.model.FeedDTO;
import com.catstagram.feedLike.model.FeedLikeDTO;
import com.catstagram.mapper.CommentLikeMapper;
import com.catstagram.mapper.CommentMapper;
import com.catstagram.mapper.FeedLikeMapper;
import com.catstagram.mapper.FeedMapper;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedMapper mapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private FeedLikeMapper feedLikeMapper;
	
	@Autowired
	private CommentLikeMapper commentLikeMapper;
	
	// 메인 페이지에서 팔로잉(내가 친구 추가한 사람들)이 올린 피드 목록와 내가 쓴 피드
	@Override
	public List<MainFollowingFeedDTO> mainFollowingFeed(int sidx) throws Exception {
		List<MainFollowingFeedDTO> dto = mapper.mainFollowingFeed(sidx);
		
		// 내가 해당 피드에 좋아요를 눌렀는지
		for(int i=0; i<dto.size(); i++) {
			FeedLikeDTO fldto = new FeedLikeDTO();
			fldto.setFeed_idx(dto.get(i).getFeed_idx());
			fldto.setMember_idx(sidx);
			dto.get(i).setFeed_like_idx(feedLikeMapper.feedLikeYN(fldto));
		}
		
		// 해당 피드에 대한 댓글 목록
		for(int i=0; i<dto.size(); i++) {
			dto.get(i).setFeed_comment_list(commentMapper.feedCommentList(dto.get(i).getFeed_idx()));
			for(int j=0; j<dto.get(i).getFeed_comment_list().size(); j++) {
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
				
				// 내가 이 댓글에 좋아요를 눌렀는지에 대한 여부
				CommentLikeDTO cldto = new CommentLikeDTO();
				cldto.setComment_idx(dto.get(i).getFeed_comment_list().get(j).getComment_idx());
				cldto.setMember_idx(sidx);
				dto.get(i).getFeed_comment_list().get(j).setComment_like_idx(commentLikeMapper.feedLikeCommentYN(cldto));
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
	
	// 수정할 피드의 정보
	@Override
	public FeedDTO feedUpdateInfo(int feed_idx) throws Exception {
		FeedDTO dto = mapper.feedUpdateInfo(feed_idx);
		return dto;
	}
	
	// 해당 피드 작성자의 idx(피드 수정 페이지 이동 시 필요)
	@Override
	public Integer feedMemberIdx(int feed_idx) throws Exception {
		Integer result = mapper.feedMemberIdx(feed_idx) != null ? mapper.feedMemberIdx(feed_idx) : 0;
		return result;
	}
	
	// 피드 수정
	@Override
	public int feedUpdate(FeedDTO dto) throws Exception {
		int result = mapper.feedUpdate(dto);
		return result;
	}
	
	// 피드 삭제
	@Override
	public int feedDel(int feed_idx) throws Exception {
		int result = mapper.feedDel(feed_idx);
		return result;
	}
	
	// 피드 좋아요수 증가
	@Override
	public int feedLikeCountPlus(int feed_idx) throws Exception {
		int result = mapper.feedLikeCountPlus(feed_idx);
		return result;
	}
	
	// 피드 좋아요수 감소
	@Override
	public int feedLikeCountMinus(int feed_idx) throws Exception {
		int result = mapper.feedLikeCountMinus(feed_idx);
		return result;
	}
	
	// 피드 좋아요수
	@Override
	public int feedLikeCount(int feed_idx) throws Exception {
		int result = mapper.feedLikeCount(feed_idx);
		return result;
	}
	
	// catstagram 피드 목록
	@Override
	public List<MainFollowingFeedDTO> feedList(int member_idx, int sidx) throws Exception {
		List<MainFollowingFeedDTO> dto = mapper.feedList(member_idx);
		
		// 내가 해당 피드에 좋아요를 눌렀는지
		for(int i=0; i<dto.size(); i++) {
			FeedLikeDTO fldto = new FeedLikeDTO();
			fldto.setFeed_idx(dto.get(i).getFeed_idx());
			fldto.setMember_idx(sidx);
			dto.get(i).setFeed_like_idx(feedLikeMapper.feedLikeYN(fldto));
		}
		
		// 해당 피드에 대한 댓글 목록
		for(int i=0; i<dto.size(); i++) {
			dto.get(i).setFeed_comment_list(commentMapper.feedCommentList(dto.get(i).getFeed_idx()));
			for(int j=0; j<dto.get(i).getFeed_comment_list().size(); j++) {
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
				
				// 내가 이 댓글에 좋아요를 눌렀는지에 대한 여부
				CommentLikeDTO cldto = new CommentLikeDTO();
				cldto.setComment_idx(dto.get(i).getFeed_comment_list().get(j).getComment_idx());
				cldto.setMember_idx(sidx);
				dto.get(i).getFeed_comment_list().get(j).setComment_like_idx(commentLikeMapper.feedLikeCommentYN(cldto));
			}
		}
		
		return dto;
	}
}