package com.catstagram.mapper;

import java.util.*;

import com.catstagram.member.model.MemberDTO;

public interface MemberMapper {
	public String idCheck(String id);
	public int signup(MemberDTO dto);
	public MemberDTO login(String id);
	public MemberDTO sessionInfo(String id);
	public List<MemberDTO> searchList(Map map);
	public String profileInfo(int member_idx);
	public int profileUpdate(MemberDTO dto);
	public int profileImgUpdate(MemberDTO dto);
	public int infoUpdate(MemberDTO dto);
	public String pwdChk(int sidx);
	public int pwdUpdateOk(MemberDTO dto);
	public int quit(int sidx);
	public List<MemberDTO> followerList(int sidx);
	public List<MemberDTO> followingList(int sidx);
}