package com.catstagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catstagram.emp.model.EmpDTO;
import com.catstagram.emp.service.EmpService;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService service;
	
	@GetMapping("/emp")
	public String emp() {
		return "emp/emp";
	}
	
	@PostMapping("/empAdd")
	public ModelAndView empAdd(EmpDTO dto) {
		System.out.println(dto.toString());
		int result = 0;
		try {
			result = service.empAdd(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg = result>0 ? "사원 등록 성공!" : "사원 등록 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
}