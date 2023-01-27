package com.finalproject.bada.mypage.controller;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// Cart
	@RequestMapping("/mypage/cart.do")
	public ModelAndView cartList(ModelAndView mv, HttpSession session) {	
		Member loginMember = (Member)session.getAttribute("loginMember");	
		List<Product> products = service.selectCartProduct(loginMember.getMemberNo());	
		mv.addObject("products",products);
		mv.setViewName("mypage/cartList");
		
		return mv;
	}
	
	@RequestMapping("/cart/delete.do")
	public ModelAndView deleteCart(ModelAndView mv, HttpSession session, @RequestParam(value="productNo")List<Integer> productNos) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		//log.debug("{}",productNos);
		
		Map<String, Object> param = new HashMap();
		param.put("memberNo", loginMember.getMemberNo());
		param.put("productNos", productNos);
		
		int result = service.deleteCart(param);
		//log.debug("result : {}",result);
		
		String loc = "/mypage/cart.do";
		String msg = "";
		if(result > 0) {
			msg = "삭제 완료";
		} else {
			msg = "삭제 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/mypage/order.do")
	public String orderList() {
		return "mypage/orderList";
	}
	
	@RequestMapping("/mypage/refund.do")
	public String refundList() {
		return "mypage/refundList";
	}
	
	@RequestMapping("/mypage/alert.do")
	public String alertList() {
		return "mypage/alertList";
	}
	
	@RequestMapping("/mypage/quit.do")
	public String quitPage() {
		return "mypage/quitPage";
	}
	
	@RequestMapping("/mypage/test.do")
	public String zzz(@RequestParam(value="productNo") int[] test) {
		
		log.debug(Arrays.toString(test));
		
		return "mypage/cartList";
	}
}
