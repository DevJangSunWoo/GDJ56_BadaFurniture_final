package com.finalproject.bada.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/test")
	public String productView() {
		return "product/test";
		
	}
	
	
}
