package com.catstagram.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.mapper.MemberMapper;
import com.catstagram.member.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	public MemberMapper mapper;

	@Override
	public String idCheck(String id) throws Exception {
		String result = mapper.idCheck(id);
		return result;
	}
	
	@Override
	public int signup(MemberDTO dto) throws Exception {
		int result = mapper.signup(dto);
		return result;
	}
	
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
	
	@Override
	public int sessionInfo(String id) throws Exception {
		int result = mapper.sessionInfo(id);
		return result;
	}
}