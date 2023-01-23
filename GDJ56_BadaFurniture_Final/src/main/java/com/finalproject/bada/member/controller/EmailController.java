package com.finalproject.bada.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.bada.member.model.service.RegisterMail;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class EmailController {
	
	private final RegisterMail registerMail;

    @PostMapping("member/login/mailConfirm")
    @ResponseBody
    public String mailConfirm(@RequestParam String email) throws Exception {
    	String code = registerMail.sendSimpleMessage(email);
        log.info("인증코드 : " + code);
        return code;
    }
}
