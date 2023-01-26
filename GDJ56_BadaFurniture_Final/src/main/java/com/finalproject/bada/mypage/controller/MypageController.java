package com.finalproject.bada.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("/mypage/order.do")
	public String orderList() {
		return "mypage/orderList";
	}
	
	@RequestMapping("/mypage/refund.do")
	public String refundList() {
		return "mypage/refundList";
	}
	
	@RequestMapping("mypage/cart.do")
	public String cartList() {
		return "mypage/cartList";
	}
	
	@RequestMapping("mypage/alert.do")
	public String alertList() {
		return "mypage/alertList";
	}
	
	@RequestMapping("mypage/quit.do")
	public String quitPage() {
		return "mypage/quitPage";
	}
	
}
