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

import com.finalproject.bada.common.PageFactory;
import com.finalproject.bada.member.model.vo.Member;
import com.finalproject.bada.mypage.model.service.MypageService;
import com.finalproject.bada.mypage.model.vo.Alert;
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
	
	// 장바구니 기능 
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
	
	//알림기능
	@RequestMapping("/mypage/alert.do")
	public ModelAndView alertList(ModelAndView mv, HttpSession session,
			@RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		int numPerpage = 5;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		List<Alert> alerts = service.selectAlertList(loginMember.getMemberNo(), cPage, numPerpage);
		int totalData = service.selectAlertCount(loginMember.getMemberNo());
		String pageBar = PageFactory.getPage(cPage, numPerpage, totalData, "alert.do");
		
		mv.addObject("pageBar",pageBar);
		mv.addObject("alerts",alerts);
		mv.setViewName("mypage/alertList");
		
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
