package com.finalproject.bada.product.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.mypage.model.vo.Cart;
import com.finalproject.bada.product.model.service.ProductService;
import com.finalproject.bada.product.model.vo.Product;
import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	private ProductService service;
	
	@Autowired
	public ProductController(ProductService service) {
		super();
		this.service = service;
	}
	
//	@RequestMapping("/product/view.do")
//	public String productView() {
//		return "product/productView";
//		
//	}
	
//	@RequestMapping("/order/orderSheet.do")
//	public String orderSheet() {
//		return "product/orderSheet";
//		
//	}
	
//	@RequestMapping("/order/orderComplete.do")
//	public String orderComplete() {
//		return "product/orderComplete";
//		
//	}
	
	
	//상세화면 표출하기
	@RequestMapping("/product/view.do")
	public ModelAndView productView(ModelAndView mv, int productNo) {
		
		Product  productData=service.selectProduct(productNo);
		
		for(int i=0;i<productData.getFiles().size();i++) {
//		log.debug("{}",productData.getFiles().get(i));
		}
		mv.addObject("productData",productData);
		mv.setViewName("product/productView");
		
		return mv;
		
	}
	

	//메인페이지 제품리스트 출력(아이템, 조건, 정렬 적용)
	@RequestMapping("product/productList.do")
	@ResponseBody
	public List<Product> productList(@RequestBody Map map) throws IOException{
		log.debug("{}",map);
		
		List<Product> list = service.selectProductList(map);
		
		return list;
	}
	
			
	
	@RequestMapping("/product/cartBtn.do")
	public void  cartBtn (int cartProductNo,int cartMemberNo,HttpServletResponse response ) throws IOException  {
//		log.debug("{}",cartProductNo);
//		log.debug("{}",cartMemberNo);
		Map map = new HashMap();
		map.put("productNo",cartProductNo); 
		map.put("memberNo",cartMemberNo); 
	
		Cart c=service.selectCartCheck(map);
		String msg="";
		
		if(c==null) {
		int count=service.selectCartCount(cartMemberNo);	
		//log.debug("{}",count+"개수");
			if(count<10) {
				int result =service.insertCart(map);
				if(result>0) {
					msg+="장바구니에 등록 성공하였습니다.";
				} else{			
					msg+="장바구니 등록이 실패하였습니다.";
				}
			}else {
				msg+="더이상 장바구니에 담을수 없습니다.";
			}
		}else {
			msg+="이미 장바구니에 있는 제품입니다.";
		}
		
		response.setContentType("application/json;charset=utf-8"); 
		new Gson().toJson(msg,response.getWriter());  
	}
	
}