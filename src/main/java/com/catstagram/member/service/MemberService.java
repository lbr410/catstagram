package com.catstagram.member.service;

import java.util.List;

import com.catstagram.member.model.MemberDTO;

public interface MemberService {
	
	int LOGIN_OK = 1; // 로그인 성공
	int LOGIN_FAIL = 2; // 아이디 또는 비밀번호 틀렸을 시
	int QUIT = 3; // 회원탈퇴인 경우
	int ERROR = 4;
	
	public String idCheck(String id) throws Exception;
	public int signup(MemberDTO dto) throws Exception;
	public int login(String id, String pwd) throws Exception;
	public MemberDTO sessionInfo(String id) throws Exception;
	public List<MemberDTO> searchList(String search_id, String sid, int sidx) throws Exception;
	public String profileInfo(int member_idx) throws Exception;
	public int profileUpdate(MemberDTO dto) throws Exception;
	public int profileImgUpdate(MemberDTO dto) throws Exception;
	public List<MemberDTO> followerList(int sidx);
	public List<MemberDTO> followingList(int sidx);
}