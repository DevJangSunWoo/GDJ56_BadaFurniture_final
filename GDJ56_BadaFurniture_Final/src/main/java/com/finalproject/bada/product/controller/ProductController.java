package com.finalproject.bada.product.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.product.model.service.ProductService;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
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
	
	@RequestMapping("/order/orderComplete.do")
	public String orderComplete() {
		return "product/orderComplete";
		
	}
	
	private ProductService service;
	
	@Autowired
	public ProductController(ProductService service) {
		super();
		this.service = service;
	}
	
	
	//상세화면 표출하기
	@RequestMapping("/product/view.do")
	public ModelAndView  productView(ModelAndView mv, int productNo) {
		
		Product  productData=service.selectProduct(productNo);
		
		for(int i=0;i<productData.getFiles().size();i++) {
		log.debug("{}",productData.getFiles().get(i));
		}
		mv.addObject("productData",productData);
		mv.setViewName("product/productView");
		
		return mv;
		
	}
	
	
	@RequestMapping("/product/cartBtn.do")
	public void  cartBtn (int cartProductNo,int cartMemberNo,HttpServletResponse response )  {
	
			
		
	}
	
	
	
	
}
