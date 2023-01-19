package com.finalproject.bada.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductViewController {
	
	@RequestMapping("/product/view.do")
	public String productView() {
		return "product/productView";
		
	}
	
}
