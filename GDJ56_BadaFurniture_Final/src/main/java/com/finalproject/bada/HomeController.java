package com.finalproject.bada;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.common.PageFactoryAjax;
import com.finalproject.bada.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	private ProductService service;
	
	@Autowired
	public HomeController(ProductService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("mypage.do")
	public String mypageMain() {
		return "mypage/mypageMain";
	}
	
	
	//메인페이지출력(+가구리스트)
	@RequestMapping("/")
	public ModelAndView index(ModelAndView mv, @RequestParam (value="cPage", defaultValue = "1") int cPage) { 
		
		mv.addObject("productList",service.productList(Map.of("cPage",cPage, "numPerpage",10)));
		
		int totalData = service.selectProductCount();
		mv.addObject("pageBar", PageFactoryAjax.getPage(cPage, 10, totalData, "/bada"));
		
		mv.setViewName("index");
		return mv;
	}
}
