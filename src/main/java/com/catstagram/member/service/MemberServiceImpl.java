package com.catstagram.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	public MemberMapper mapper;

	@Override
	public String idCheck(String id) throws Exception {
		String result = mapper.idCheck(id);
		return result;
	}
}