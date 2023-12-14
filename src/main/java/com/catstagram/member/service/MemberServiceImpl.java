package com.catstagram.member.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.etc.model.AlarmDTO;
import com.catstagram.mapper.MemberMapper;
import com.catstagram.member.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	public MemberMapper mapper;

	// 아이디 중복 검사
	@Override
	public String idCheck(String id) throws Exception {
		String result = mapper.idCheck(id);
		return result;
	}
	
	// 회원가입
	@Override
	public int signup(MemberDTO dto) throws Exception {
		int result = mapper.signup(dto);
		return result;
	}
	
	// 로그인
	@Override
	public int login(String id, String pwd) throws Exception {
		MemberDTO dto = mapper.login(id);
		int result = 0;
		if(dto != null) {
			if(dto.getMember_pwd().equals(pwd)) {				
				if(dto.getMember_quit().equals("n")) {
					result = LOGIN_OK; // 로그인 성공
				} else {
					result = QUIT; // 회원탈퇴한 유저인 경우
				}
			} else {
				result = LOGIN_FAIL; // 비밀번호가 틀렸을 경우
			}
		} else {
			return ERROR; // 아이디에 대한 DB 결과가 존재하지 않는 경우
		}
		return result;
	}
	
	// 세션 정보
	@Override
	public MemberDTO sessionInfo(String id) throws Exception {
		MemberDTO dto = mapper.sessionInfo(id);
		return dto;
	}
	
	// 회원 검색시 리스트 조회
	@Override
	public List<MemberDTO> searchList(String search_id, String sid, int sidx) throws Exception {
		Map map = new HashMap();
		map.put("search_id", search_id);
		map.put("sid", sid);
		map.put("sidx", sidx);
		List<MemberDTO> dto = mapper.searchList(map);
		return dto;
	}
	
	// 이미 저장된 프로필 불러오기
	@Override
	public String profileInfo(int member_idx) throws Exception {
		String result = mapper.profileInfo(member_idx);
		return result;
	}
	
	// 프로필 수정
	@Override
	public int profileUpdate(MemberDTO dto) throws Exception {
		int result = mapper.profileUpdate(dto);
		return result;
	}
	
	// 프로필 이미지 변경
	@Override
	public int profileImgUpdate(MemberDTO dto) throws Exception {
		int result = mapper.profileImgUpdate(dto);
		return result;
	}
	
	// 회원 정보 수정
	@Override
	public int infoUpdate(MemberDTO dto) throws Exception {
		int result = mapper.infoUpdate(dto);
		return result;
	}
	
	// 비밀번호 확인(회원 정보 수정에서)
	@Override
	public String pwdChk(int sidx) throws Exception {
		String result = mapper.pwdChk(sidx);
		return result;
	}
	
	// 비밀번호 변경
	@Override
	public int pwdUpdateOk(MemberDTO dto) throws Exception {
		int result = mapper.pwdUpdateOk(dto);
		return result;
	}
	
	// 회원탈퇴
	@Override
	public int quit(int sidx) throws Exception {
		int result = mapper.quit(sidx);
		return result;
	}
	
	// 팔로워 목록(나를 친구 추가한 사람)
	@Override
	public List<MemberDTO> followerList(int sidx) throws Exception {
		List<MemberDTO> dto = mapper.followerList(sidx);
		return dto;
	}
	
	// 팔로잉 목록(내가 친구 추가한 사람)
	@Override
	public List<MemberDTO> followingList(int sidx) throws Exception {
		List<MemberDTO> dto = mapper.followingList(sidx);
		return dto;
	}
	
	// 회원들의 Catstagram 주소로 이동하기 위한 idx와 아이디, 그 외 정보들 조회
	@Override
	public MemberDTO urlIdxIdSelect(String member_id, int sidx) throws Exception {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("sidx", sidx);
		MemberDTO dto = mapper.urlIdxIdSelect(map);
		return dto;
	}
	
	// 회원들의 팔로워 & 팔로잉 목록으로 이동하기 위한 idx와 아이디 조회
	@Override
	public MemberDTO followListOtherInfo(String member_id) throws Exception {
		MemberDTO dto = mapper.followListOtherInfo(member_id);
		return dto;
	}
	
	// 다른 회원의 팔로워 목록
	@Override
	public List<MemberDTO> otherFollowerList(int member_idx, int sidx) throws Exception {
		Map map = new HashMap();
		map.put("member_idx", member_idx);
		map.put("sidx", sidx);
		List<MemberDTO> list = mapper.otherFollowerList(map);
		return list;
	}
	
	// 다른 회원의 팔로잉 목록
	@Override
	public List<MemberDTO> otherFollowingList(int member_idx, int sidx) throws Exception {
		Map map = new HashMap();
		map.put("member_idx", member_idx);
		map.put("sidx", sidx);
		List<MemberDTO> list = mapper.otherFollowingList(map);
		return list;
	}
	
	// Header의 알림 목록
	@Override
	public List<AlarmDTO> alarmList(int sidx) throws Exception {
		List<AlarmDTO> list = mapper.alarmList(sidx);
		return list;
	}
}