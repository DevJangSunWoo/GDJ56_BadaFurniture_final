package com.finalproject.bada.resell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResellController {
	
	
	
	@RequestMapping("/resell.do")
	public String writeResell() {
		return "resell/writeResell";
	}
	
	@RequestMapping("/resell/read.do")
	public String readResell(int resellNo) {
		
		
		return "";
	}
	
}
