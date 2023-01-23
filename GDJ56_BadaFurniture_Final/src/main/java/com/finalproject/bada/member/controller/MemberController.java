package com.finalproject.bada.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.finalproject.bada.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {

	private MemberService service;
//	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MemberController(MemberService service) {
		this.service = service;
//		this.passwordEncoder = passwordEncoder;
	}
	
	
	//회원가입페이지이동
	@RequestMapping("/enrollMember.do")
	public String enrollMember() {
		return "/member/enroll";
	}
	
	//이메일 중복확인
//	@RequestMapping("/duplicateEmail.do")
 
}
