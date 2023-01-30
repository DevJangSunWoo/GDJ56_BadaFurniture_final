package com.finalproject.bada.member.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.member.model.service.MemberService;
import com.finalproject.bada.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {

	private MemberService service;
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MemberController(MemberService service, BCryptPasswordEncoder passwordEncoder) {
		this.service = service;
		this.passwordEncoder = passwordEncoder;
	}
	
	
//--------------------------------------------------------------------------------------------------------------------------------------------------	
	//로그인
	@RequestMapping("/login.do")
	public String loginMember(Member m, HttpSession session) {

		Member loginMember = service.selectMemberById(m);
		
		if(loginMember!=null && passwordEncoder.matches(m.getPassword(), loginMember.getPassword())) {
			session.setAttribute("loginMember", loginMember);
		}
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

	//아이디찾기
	@RequestMapping("/searchId.do")
	public String searchId() {
		return "/member/searchId";
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------------------
	 
	//회원가입페이지이동
	@RequestMapping("/enrollMember.do")
	public String enrollMember() {
		return "/member/enroll";
	}
	
	//아이디 중복확인
	@RequestMapping("/idDuplicate.do")
	public void duplicateId(String memberId, HttpServletResponse response) throws IOException{

		Member m = service.selectMemberById(Member.builder().memberId(memberId).build());
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(m!=null ? true : false);
	}
	
	//이메일 중복확인
	@RequestMapping("/emailDuplicate.do")
	public void emailDuplicate(String email, HttpServletResponse response) throws IOException{
		
		Member m = service.selectMemberByEmail(Member.builder().email(email).build());
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(m!=null ? true : false);
	}
	
	//회원가입완료
	@RequestMapping("/enrollMemberEnd.do")
	public ModelAndView enrollMemberEne(Member m, ModelAndView mv) {
		String encodePassword = passwordEncoder.encode(m.getPassword());
		m.setPassword(encodePassword);
		
		int result = service.insertMember(m);
		if(result>0) {
			mv.addObject("msg","회원가입 완료 o(*￣▽￣*)ブ");
			mv.addObject("loc","/");
		}else {
			mv.addObject("msg","회원가입 실패 /(ㄒoㄒ)/");
			mv.addObject("loc","/member/enrollMember.do");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
	

//--------------------------------------------------------------------------------------------------------------------------------------------------
 
	//정보수정페이지 이동
	@RequestMapping("/updateMember.do")
	public String updateMember() {
		return "/member/updateMember";
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------------------
	
	//회원탈퇴페이지 이동
	@RequestMapping("/deleteMember.do")
	public String deleteMember() {
		return "/mypage/deleteMember";
	}
}
