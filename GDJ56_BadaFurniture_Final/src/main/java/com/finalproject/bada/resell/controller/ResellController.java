package com.finalproject.bada.resell.controller;

import javax.mail.Multipart;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResellController {
	
	
	
	@RequestMapping("/resell/write.do")
	public String writeResell() {
		return "resell/writeResell";
	}
	
	@RequestMapping("/resell/read.do")
	public String readResell() {
		return "resell/readResell";
	}
	
	@RequestMapping("/resell/update.do")
	public String updateResell() {
		return "resell/updateResell";
	}
	
	@RequestMapping("/resell/writeEnd.do")
	public ModelAndView writeEndResell(ModelAndView mv, Product p, 
			HttpSession session, Multipart[] upFile) {
		
		log.debug("{}",p);
		log.debug("{}",upFile[0]);
		log.debug("{}",upFile[1]);
		
		String msg = "gg";
		String loc = "zz";
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		return mv;
	}
	
	
	
	
	
	
	
}
