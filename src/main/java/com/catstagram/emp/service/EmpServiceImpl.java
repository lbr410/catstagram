package com.catstagram.emp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catstagram.emp.model.EmpDTO;
import com.catstagram.mapper.EmpMapper;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpMapper mapper;
	
	@Override
	public int empAdd(EmpDTO dto) throws Exception {
		int result = mapper.empAdd(dto);
		return result;
	}
}