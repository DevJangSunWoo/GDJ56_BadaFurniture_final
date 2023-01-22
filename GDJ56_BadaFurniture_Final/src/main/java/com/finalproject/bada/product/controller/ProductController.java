package com.finalproject.bada.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping("/product/view.do")
	public String productView() {
		return "product/productView";
		
	}
	
	@RequestMapping("/order/orderSheet.do")
	public String orderSheet() {
		return "product/orderSheet";
		
	}
	
	@RequestMapping("/order/orderComplete.do")
	public String orderComplete() {
		return "product/orderComplete";
		
	}
	
}
