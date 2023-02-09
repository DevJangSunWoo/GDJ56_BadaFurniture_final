package com.finalproject.bada.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.config.AES256Config;
import com.finalproject.bada.member.model.service.MemberService;
import com.finalproject.bada.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	private MemberService service;
	private BCryptPasswordEncoder passwordEncoder; //단반향암호화
	private AES256Config aes; // 양방향암호와

	@Autowired
	public MemberController(MemberService service, BCryptPasswordEncoder passwordEncoder, AES256Config aes) {
		this.service = service;
		this.passwordEncoder = passwordEncoder;
		this.aes = aes;
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------------------	

	
	//security를 사용할 경우 security 맵핑주소와 동일한 mapping주소를 쓰면 안됨 
	//security로그인 실패 나오는 페이지 연결
//	@RequestMapping("/errorPage.do")
//	public String errorPage () {
//		return "member/errorPage";
//	}
	
	@RequestMapping("/errorPage.do")
	public ModelAndView errorPage (ModelAndView mv) {
		
		mv.addObject("msg","로그인 실패 X﹏X");
		mv.addObject("loc","/#demo-modal");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
//	//로그인
//	@RequestMapping("/login.do")
//	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
////		log.debug("{}",m);
//		Member loginMember = service.selectMemberById(m);
//		log.debug("loginMember: {}",loginMember);
//		
//		if(loginMember!=null && passwordEncoder.matches(m.getPassword(), loginMember.getPassword())) {
//			session.setAttribute("loginMember", loginMember);
//			mv.addObject("msg","로그인 완료");
//			mv.addObject("loc","/");
//		}else {
//			mv.addObject("msg","아이디와 비밀번호를 다시 확인해주세요.");
//			mv.addObject("loc","/");
//		}
//		mv.setViewName("common/msg");
//		return mv;
//	}
//	
//	//로그아웃
//	@RequestMapping("/logout.do")
//	public String logoutMember(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}

	//아이디찾기 페이지연결
	@RequestMapping("/searchId.do")
	public String searchId() {
		return "/member/searchId";
	}
	
	//아이디찾기 완료
	@RequestMapping("/searchIdEnd.do")
	public ModelAndView searchIdEnd(@RequestParam Map param, ModelAndView mv) {
		//log.debug("searchId: {}",param);
		String memberId = service.searchId(param);
		//log.debug("searchId(result): {}",memberId);
		
		if(memberId!=null) {
			mv.addObject("memberId",memberId);
			mv.setViewName("member/searchIdResult");
		}else {
			mv.addObject("msg","입력된 정보와 일치하는 회원이 없습니다. 다시 입력해주세요.");
			mv.addObject("loc","/member/searchId.do");
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	//비밀번호찾기 페이지연결
	@RequestMapping("/searchPw.do")
	public String searchPw() {
		return "member/searchPw";
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
		
		//비밀번호 단방향암호화
		String encodePassword = passwordEncoder.encode(m.getPassword());
		m.setPassword(encodePassword);
		
		//계좌번호 양방향 암호화
		if(m.getAccountCode()!=null) {
			try {
				m.setAccountCode(aes.encrypt(m.getAccountCode()));
				//log.debug("계좌번호 암호화 후 : {}", m.getAccountCode());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
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
	public ModelAndView updateMember(ModelAndView mv, String id) {
		Member member = service.selectMemberById(Member.builder().memberId(id).build());
		
		if(member.getAccountCode()!=null) {
			try {
				//계좌번호 암호화해제
				member.setAccountCode(aes.decrypt(member.getAccountCode()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("accountCode",member.getAccountCode());
		}
		mv.setViewName("mypage/member/updateMember");
		return mv;
	}
	
	//비밀번호변경 페이지이동
	@RequestMapping("/updatePassword.do")
	public String updatePassword() {
		return "mypage/member/updatePassword";
	}
	
	//비밀번호 변경 :
	@RequestMapping("/updatePasswordEnd.do")
	public ModelAndView updatePasswordEnd(@RequestParam Map param, ModelAndView mv, HttpServletRequest request) {
		//log.debug("{}",param);
		Member member = service.selectMemberById(Member.builder().memberId((String)param.get("memberId")).build());
		
		if(member!=null && passwordEncoder.matches((String)(param.get("password")), member.getPassword())) {
			
			String encodePassword = passwordEncoder.encode((String)(param.get("password_new")));
			param.put("password_new",encodePassword);
			
			int result = service.updatePassword(param);
			
			if(result>0) {
				String script = "close();";
//				String script = "opener.location.replace('"+request.getContextPath()+"/member/logout.do');close();";
				mv.addObject("msg","비밀번호 변경완료!");
				//mv.addObject("loc","mypage/member/updateMember.do");
				mv.addObject("script", script);
				
			}else {
				mv.addObject("msg","비밀번호 변경 실패!");
				mv.addObject("loc","/member/updatePassword.do?userId="+(String)param.get("memberId"));
			}
			
		}else {
			mv.addObject("msg","기존 비밀번호가 일치하지 않습니다! 다시 시도하세요!");
			mv.addObject("loc","/member/updatePassword.do?userId="+(String)param.get("memberId"));
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	//정보수정완료
	@RequestMapping("/updateMemberEnd.do" )
	public ModelAndView updateMember(Member m, ModelAndView mv, HttpSession session) {
		
		log.debug("updateMemberEnd: {}",m);
		
		//계좌번호 양방향 암호화
		if(m.getAccountCode()!=null) {
			try {
				m.setAccountCode(aes.encrypt(m.getAccountCode()));
				//log.debug("계좌번호 암호화 후 : {}", m.getAccountCode());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		int result = service.updateMember(m);
		log.debug("updateMemberEnd(result): {}",result);
		
		if(result>0) {
			mv.addObject("msg","회원정보 수정완료");
			mv.addObject("loc","/member/logout.do");
		}else {
			mv.addObject("msg","회원정보 수정실패");
			mv.addObject("loc","mypage/member/updateMember.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------------------
	
	//패스워드 확인
	@RequestMapping("/deleteMember.do")
	@ResponseBody
	public String deleteMember(Member m) {
		Member loginMember = service.selectMemberById(m);
		//log.debug("loginMember: {}",loginMember);
		
		if(loginMember!=null && passwordEncoder.matches(m.getPassword(), loginMember.getPassword())) {
			return "true";
		}
		return "false";
	}
	
	//탈퇴동의 페이지이동
	@RequestMapping("/deleteMemberEnd.do")
	public String deleteMemberEnd() {
		return "mypage/member/deleteMemberEnd";
	}
	
	//회원탈퇴
	@RequestMapping("/deleteMemberResult.do")
	public ModelAndView deleteMemberResult(ModelAndView mv, @RequestParam String memberNo, HttpSession session) {
		System.out.println(memberNo);
		
		int result = service.deleteMember(Integer.parseInt(memberNo));
		//log.debug("deleteMember(result): {}",result);
		
		if(result>0) {
			session.invalidate();
			mv.addObject("msg","탈퇴가 완료되었습니다. 그동안 이용해주셔셔 감사합니다.<(＿　＿)>");
			mv.addObject("loc","/member/logout.do");  //시큐리티에 설정된 로그아웃 URL로 연결해서 세션 없어지면서 로그아웃 됨 
		}else {
			mv.addObject("msg","회원삭제 실패");
			mv.addObject("loc","mypage/member/deleteMemberEnd.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
}
