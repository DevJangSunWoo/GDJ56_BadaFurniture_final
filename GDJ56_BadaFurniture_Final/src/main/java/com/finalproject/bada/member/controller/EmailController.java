package com.finalproject.bada.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.bada.member.model.service.MemberService;
import com.finalproject.bada.member.model.service.RegisterMail;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class EmailController {
	
	private final RegisterMail registerMail;
	private MemberService service;
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public EmailController(RegisterMail registerMail, MemberService service, BCryptPasswordEncoder passwordEncoder) {
		this.registerMail = registerMail;
		this.service = service;
		this.passwordEncoder = passwordEncoder;
	}
	
	//인증번호
    @PostMapping("member/login/mailConfirm")
    @ResponseBody
    public String mailConfirm(@RequestParam String email) throws Exception {
    	String code = registerMail.sendSimpleMessage(email);
        log.info("인증코드 : " + code);
        return code;
    }
    
    
    //임시비밀번호 
    @PostMapping("member/searchPw")
    @ResponseBody
    public String mailConfirm2(@RequestParam String email,@RequestParam String memberName, @RequestParam String inputId) throws Exception {
    	Map param = new HashMap();
    	param.put("email", email);
    	param.put("memberName", memberName);
    	
    	String memberId = service.searchId(param);
    	log.debug("searchPw(resultId): {}", memberId);
    	
    	
    	if(memberId!=null && memberId.equals(inputId)) {
    		String code = registerMail.sendSimpleMessage2(email);
    		log.info("인증코드 : " + code);
    		
    		String encodePassword = passwordEncoder.encode(code);
			param.put("password_new",encodePassword);
    		param.put("memberId",memberId);
    		int result = service.updatePassword(param);
    		
    		if(result>0) {
    			return code;
    		}
    		
    	}
    	return "false";
    }


}
