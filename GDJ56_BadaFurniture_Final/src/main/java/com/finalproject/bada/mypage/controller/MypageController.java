package com.finalproject.bada.mypage.controller;


import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.member.model.vo.Member;
import com.finalproject.bada.mypage.model.service.MypageService;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	private MypageService service;
	
	@Autowired
	public MypageController(MypageService service) {
		this.service = service;
	}
	
	@RequestMapping("/mypage/order.do")
	public String orderList() {
		return "mypage/orderList";
	}
	
	@RequestMapping("/mypage/refund.do")
	public String refundList() {
		return "mypage/refundList";
	}
	
	// 장바구니 part
	@RequestMapping("mypage/cart.do")
	public ModelAndView cartList(ModelAndView mv, HttpSession session) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		List<Product> products = service.selectCartProduct(loginMember.getMemberNo());
		
		if(!products.isEmpty()) {
			
			products.stream().forEach(v->log.debug("{}",v));
			
		} else {
			log.debug("ㅜㅜㅜ");
		}
		
		mv.addObject("products",products);
		mv.setViewName("mypage/cartList");
		
		return mv;
	}
	
	@RequestMapping("mypage/alert.do")
	public String alertList() {
		return "mypage/alertList";
	}
	
	@RequestMapping("mypage/quit.do")
	public String quitPage() {
		return "mypage/quitPage";
	}
	
	@RequestMapping("/mypage/test.do")
	public String zzz(@RequestParam(value="productNo") int[] test) {
		
		log.debug(Arrays.toString(test));
		
		return "mypage/cartList";
	}
}
