package com.finalproject.bada;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.product.model.service.ProductService;

@Controller
public class HomeController {
	
	private ProductService service;
	
	@Autowired
	public HomeController(ProductService service) {
		super();
		this.service = service;
	}

	@RequestMapping("/")
	public ModelAndView index(ModelAndView mv) {
//		String[] color=new String[]{"블랙", "화이트", "브라운", "그레이", "레드", "옐로우", "그린", "블루", "네이비", "퍼플"};
//		String[] material = {"철제", "플라스틱", "합판", "원목", "가죽", "패브릭", "메쉬", "유리"};
//		String[] grade= {"최상", "상", "중"}; 
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("color", color[0]);
//		map.put("material", material);
//		map.put("grade", grade);
//		map.put("item", "전체");
//		map.put("width", "전체");
//		map.put("sort", "최근등록일순");
		
		mv.addObject("productList",service.productList());
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("mypage.do")
	public String mypageMain() {
		return "mypage/mypageMain";
	}
	

	

}
