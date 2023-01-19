package com.finalproject.bada;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("mypage.do")
	public String mypageMain() {
		return "mypage/mypageMain";
	}
	
}
