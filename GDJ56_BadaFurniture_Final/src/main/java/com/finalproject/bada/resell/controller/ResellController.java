package com.finalproject.bada.resell.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.member.model.vo.Member;
import com.finalproject.bada.resell.model.service.ResellService;
import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResellController {
	
	private ResellService service;
	
	@Autowired
	public ResellController(ResellService service) {
		super();
		this.service = service;
	}
	
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
	public ModelAndView writeEndResell(ModelAndView mv, Resell r, 
			HttpSession session, MultipartFile[] upFile,
			@RequestParam(value="memberNo") int memberNo) {
		
//		log.debug("{}",r);
//		log.debug("{}",upFile[0]);
//		log.debug("{}",upFile[1]);
		
		String msg = "gg";
		String loc = "zz";
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		String path = session.getServletContext().getRealPath("/resources/upload/resell");
		
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		List<FileResell> files = new ArrayList();
		for(int i=0;i<upFile.length;i++) {
			if(!upFile[i].isEmpty()) {
				String originalFileName = upFile[i].getOriginalFilename();
				String ext=originalFileName.substring(originalFileName.lastIndexOf(".")); //확장자
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*100000+1);
				String renamedFileName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext; //절대 겹칠 수 없는 임의의 이름 만들어주기 
				
				try {
					upFile[i].transferTo(new File(path+renamedFileName));
					files.add(FileResell.builder()
						.originalFileName(originalFileName)
						.renamedFileName(renamedFileName)
						.thumbnail(i==0?"Y":"N")
						.build());
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		Resell resell = Resell.builder().member(Member.builder().memberNo(memberNo).build())
							.item(r.getItem()).grade(r.getGrade()).widths(r.getWidths())
							.depths(r.getDepths()).heights(r.getHeights()).color(r.getColor())
							.detail(r.getDetail()).postCode(r.getPostCode()).address(r.getAddress())
							.addressDetail(r.getAddressDetail()).pickUpDate(r.getPickUpDate())
							.hopePrice(r.getHopePrice()).bankName(r.getBankName()).depositorName(r.getDepositorName())
							.accountCode(r.getAccountCode()).files(files).build();
		Member m = Member.builder().memberNo(memberNo).build();
		
		System.out.println(resell);
		
		return mv;
	}
	
	
	
	
	
	
	
}
