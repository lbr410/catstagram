package com.catstagram.mapper;

import java.util.*;

import com.catstagram.member.model.MemberDTO;

public interface MemberMapper {
	public String idCheck(String id);
	public int signup(MemberDTO dto);
	public MemberDTO login(String id);
	public MemberDTO sessionInfo(String id);
	public List<MemberDTO> searchList(Map map);
}