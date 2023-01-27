package com.finalproject.bada.order.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.order.model.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrderController {
	
	private OrderService service;

	@Autowired
	public OrderController(OrderService service) {
		super();
		this.service = service;
	}
	
	
	@RequestMapping("/order/orderSheet.do")
	public ModelAndView orderSheet(ModelAndView mv,
			@RequestParam(value="productNo") int[]productNos) {
		
		log.debug(Arrays.toString(productNos));
		//단품에 대한 상품 정보
//		Product ospi=service.selectOrderSheet(productNo);
//		
//		list.add(ospi);
		
		//mv.addObject("ospi",ospi);
		mv.setViewName("product/orderSheet");
		
		return mv;
		
		
	}
	
	
	
	
	
}
