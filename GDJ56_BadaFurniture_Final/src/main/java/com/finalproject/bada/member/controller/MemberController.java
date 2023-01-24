package com.finalproject.bada.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.finalproject.bada.member.model.service.MemberService;
import com.finalproject.bada.member.model.vo.Member;

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
	
	//로그인
	@RequestMapping("/login.do")
	public String loginMember(Member m, HttpSession session) {
//		System.out.println(m);
		Member loginMember = service.selectMemberById(m);
//		System.out.println(loginMember);
		
		if(loginMember!=null) {
			session.setAttribute("loginMember", loginMember);
		}
		
//		if(loginMember!=null && passwordEncoder.matches(m.getPassword(), loginMember.getPassword())) {
//			session.setAttribute("loginMember", loginMember);
//		}
		return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logoutMember(SessionStatus session) {
		if(!session.isComplete()) {
			session.setComplete();
		}
		return "redirect:/";
	}
	
	//회원가입페이지이동
	@RequestMapping("/enrollMember.do")
	public String enrollMember() {
		return "/member/enroll";
	}
	
	//이메일 중복확인
//	@RequestMapping("/duplicateEmail.do")
 
}
