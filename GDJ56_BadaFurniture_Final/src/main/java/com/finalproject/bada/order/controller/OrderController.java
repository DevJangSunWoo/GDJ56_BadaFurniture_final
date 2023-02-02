package com.finalproject.bada.order.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.order.model.service.OrderService;
import com.finalproject.bada.order.model.vo.OrderSheet;
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
//			log.debug("{}"," x 데이터 못 가져옴");
			
		}else {
		//	log.debug("{}","  o 가져옴");
		}
				
	
		

		
		mv.addObject("products",list);
		mv.setViewName("product/orderSheet");
		
		return mv;
		
		
	}
	
	@RequestMapping("/order/orderPayment.do")
	public ModelAndView orderPayment(ModelAndView mv
			,@RequestParam(value="badaLoginMemberNo",required=false)int loginMemberNo 
			,@RequestParam(value="badaDepositName",required=false)String depositName
			,@RequestParam(value="badaTotalPrice",required=false)int totalPrice
			,@RequestParam(value="badaReceiverName",required=false) String receiverName
			,@RequestParam(value="badaPostCode",required=false)String  postCode 
			,@RequestParam(value="badaAddress",required=false)String address
			,@RequestParam(value="badaAddressDetail",required=false)String addressDetail
//			,@RequestParam(value="badaProductList",required=false)List<Product> productList  //NG
			,@RequestParam(value="badaProductNo",required=false) int[]productNos
			)
		throws IOException {
//		log.debug("{}",loginMemberNo);  
//		log.debug("{}",depositName);  
//		log.debug("{}",totalPrice);	
//		log.debug("{}",receiverName);
//		log.debug("{}",postCode);
//		log.debug("{}",address);
//		log.debug("{}",addressDetail);
//		log.debug("{}",productList);   //ng
//		log.debug("{}",productNos);
		
		
		//import java.util.Date 
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd_hh:mm:ss");
		String dateToStr = dateFormat.format(date);
		//log.debug("{}",dateToStr);
		
		//난수
		//중복되지 않는 난수 생성?
//		double min = 0;
//		double max = 100000;
//		double random = (int) ((Math.random() * (max - min)) + min);
//		String val= Double.toString(random);
		int rnd=(int)(Math.random()*100000+1);
		
		
		//주문식별번호=날짜+난수
		String merchantUid=dateToStr +rnd;
		log.debug("{}",merchantUid);
		
		
		HashMap map = new HashMap();
		map.put("seqOrderSheet",0);  // 시퀀스에 대한 임의의 키값
		map.put("loginMemberNo",loginMemberNo); 
		map.put("merchantUid",merchantUid);
		map.put("depositName",depositName); 
		map.put("totalPrice",totalPrice); 
		map.put("receiverName",receiverName); 
		map.put("postCode",postCode); 
		map.put("address",address);
		map.put("addressDetail",addressDetail);
		map.put("productNos",productNos);
		//주문서 작성 로직
		service.insertOrderSheet(map);		
		
		
		
		//장바구니 담겨있는 데이터들  delete 
		//회원번호  ,제품 번호들
		
		
		
		
		
	//1형태
		//가구의  판매상태변경  update
		//map 객체에 제품번호 확인
//		int[] productNosAfter = (int[])map.get("productNos");
//		
//		//for문을 도는 순간 여기서  배열을   일반 int형 데이터가 됨
//		for(int productNo : productNosAfter) {
//			
//		//log.debug("{}",productNo);
//			
//		}
//		
//		int resultSoldOutState=service.updateSoldOutState(map);
//		
			
		
		
		//주문완료서에 데이터 표출하기
		int orderSheetNo=Integer.parseInt(map.get("seqOrderSheet").toString());
		//log.debug("주문서 번호+{}",orderSheetNo);		
		
		List<OrderSheet> oss=service.selectOrderComplete(orderSheetNo);		
		
		if(oss==null) {
			//log.debug("{}","데이터x");
			
		}else {
			//log.debug("{}","데이터넘어옴");
			
		}
				
		
		mv.addObject("oss",oss);
		mv.setViewName("product/orderComplete");
		
		return mv ;
	}
	
	
	
	
}
