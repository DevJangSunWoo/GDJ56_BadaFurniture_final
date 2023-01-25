package com.finalproject.bada.resell.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.resell.model.vo.Resell;

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
	public ModelAndView writeEndResell(ModelAndView mv, Resell resell, 
			HttpSession session, MultipartFile[] upFile) {
		
		log.debug("{}",resell);
		log.debug("{}",upFile[0]);
		log.debug("{}",upFile[1]);
		
		String msg = "gg";
		String loc = "zz";
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		return mv;
	}
	
	
	
	
	
	
	
}
