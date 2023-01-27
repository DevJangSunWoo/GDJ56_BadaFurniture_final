package com.finalproject.bada.product.controller;


import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.product.model.service.ProductService;
import com.finalproject.bada.product.model.vo.Product;

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
	
	@RequestMapping("/order/orderComplete.do")
	public String orderComplete() {
		return "product/orderComplete";
		
	}
	
	
	//상세화면 표출하기
	@RequestMapping("/product/view.do")
	public ModelAndView productView(ModelAndView mv, int productNo) {
		
		Product  productData=service.selectProduct(productNo);
		
		for(int i=0;i<productData.getFiles().size();i++) {
		log.debug("{}",productData.getFiles().get(i));
		}
		mv.addObject("productData",productData);
		mv.setViewName("product/productView");
		
		return mv;
		
	}
	

	
	
	@RequestMapping("product/productList.do")
	@ResponseBody
	public List<Product> productList(@RequestBody Map map) throws IOException{
		log.debug("{}",map);
		
		List<Product> list = service.selectProductList(map);
		
		return list;
	}

	
			
		
	
	@RequestMapping("/product/cartBtn.do")
	public void  cartBtn (int cartProductNo,int cartMemberNo,HttpServletResponse response )  {

	}
	
	
}
