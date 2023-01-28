package com.finalproject.bada.order.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.order.model.service.OrderService;
import com.finalproject.bada.product.model.vo.Product;

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
		
		//log.debug(Arrays.toString(productNos));
		//제품들에 대한 상품 정보  배열 형태

		
		HashMap map = new HashMap();
		map.put("productNos",productNos);  // map의 키값은  productNos
 
		
		List<Product> list=service.selectOrderSheetProductList(map);

		if(list==null) {
			log.debug("{}"," x 데이터 못 가져옴");
			
		}else {
			log.debug("{}","  o 가져옴");
		}
				
	
		

		
		mv.addObject("products",list);
		mv.setViewName("product/orderSheet");
		
		return mv;
		
		
	}
	
//	@RequestMapping("/order/orderPayment.do")
//	public ModelAndView orderPayment(ModelAndView mv,) {
//		
//		
//		return mv
//	}
//	
	
	
	
}
