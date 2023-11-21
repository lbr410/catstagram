package com.catstagram.member.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}