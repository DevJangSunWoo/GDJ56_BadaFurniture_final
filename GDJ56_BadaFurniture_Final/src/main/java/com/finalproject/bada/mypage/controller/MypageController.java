package com.finalproject.bada.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("/mypage/order.do")
	public String readOrderList() {
		return "mypage/readOrderList";
	}
	
}
