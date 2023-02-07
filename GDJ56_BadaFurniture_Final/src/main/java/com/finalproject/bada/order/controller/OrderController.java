package com.finalproject.bada.order.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.order.model.service.OrderService;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Component
public class OrderController extends QuartzJobBean{ // extends QuartzJobBean
	
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	//해당클래명.class
	
	private OrderService service;
	
	@Value("${context.path}")
	private String contextPath;  // yml 에 설정해주고     @Value를 사용하면 가져와서 쓸수 있음.
	
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
			,@RequestParam(value="MERCHANT_UID",required=false) String merchantUidCard // 카드 주문식별번호
			,@RequestParam(value="IMP_UID",required=false) String impUid
			,@RequestParam(value="RECEIPT_URL",required=false) String receiptUrl			
			,@RequestParam(value="payMethod",required=false) String payMethod	
			,JobExecutionContext context
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
		//카드 결제를 위해 map에 put할것들
//		merchantUidCard
//		impUid
//		receiptUrl
		map.put("merchantUidCard",merchantUidCard);
		map.put("impUid",impUid);
		map.put("receiptUrl",receiptUrl);
		
		//주문결제방식
		map.put("payMethod",payMethod);
		
		
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
		//payMethod 값    orderComplete 화면에 부여해주기
		mv.addObject("payMethod", payMethod);
		
		
		mv.setViewName("product/orderComplete");
		
		
		
		
		return mv ;
	}


	
	
	
	
	//이로직이 바로 실행되고!! 그다음 바로 3일마다 반복되서 실행됨
	//계좌이체로 결제후 3일 후에도 미입금시  해당 결제 주문 취소기키는 로직 
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {	
		
		
		//HttpSession httpSession=(HttpSession)(RequestContextHolder.currentRequestAttributes().resolveReference(RequestAttributes.REFERENCE_SESSION));
		// 톰갯 쓰레드와  job 쓰레드가 다름  즉 작업공간이 달라서   가져와설 쓸수 없음. 		 
		//방안 -> yml에 등록하고 고정값으로 쓸수 밖에없음
	
		
//		log.debug("{}","테스트");
//		log.debug(contextPath);
		
		
		
		 service.updateUndeposited(contextPath);
		 log.debug("{}","20초마다  테스트 성공");			
	
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	//테스트 주소 
	@RequestMapping("/test.do")	
	public ModelAndView test(ModelAndView mv, HttpSession httpSession) {
		
			


		// service.updateUndeposited(httpSession);
		 service.updateUndeposited(contextPath);
		
		mv.setViewName("product/test");
		return mv;
		
	}
	
	
	
	
}