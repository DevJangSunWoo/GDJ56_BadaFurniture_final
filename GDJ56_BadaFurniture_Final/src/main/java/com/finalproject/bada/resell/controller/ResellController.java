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

import com.finalproject.bada.common.PageFactory;
import com.finalproject.bada.member.model.vo.Member;
import com.finalproject.bada.resell.model.service.ResellService;
import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;
import com.finalproject.bada.resell.model.vo.ResellComment;

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
	
	@RequestMapping("/mypage/resell.do")
	public ModelAndView resellList(ModelAndView mv, HttpSession session,
			@RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		int numPerpage = 5;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		List<Resell> resells = service.selectResellList(loginMember.getMemberNo(), cPage, numPerpage);
		int totalData = service.selectResellCount(loginMember.getMemberNo());
		String pageBar = PageFactory.getPage(cPage, numPerpage, totalData, "resell.do");
		
		
		mv.addObject("pageBar",pageBar);
		mv.addObject("resells",resells);
		mv.setViewName("mypage/resellList");
		
		return mv;
	}
	
	@RequestMapping("/resell/read.do")
	public ModelAndView readResell(ModelAndView mv,
			@RequestParam(value="resellNo") int resellNo) {
		
		Resell resell = service.selectResell(resellNo);
		
		//log.debug("readResell : {}",resell);
		//log.debug("resellFiles : {}",resell.getFiles());
		//log.debug("resellComments : {}",resell.getComments());
		mv.addObject("resell", resell);
		mv.setViewName("resell/readResell");
		
		return mv;
	}
	
	@RequestMapping("/resell/update.do")
	public ModelAndView updateResell(ModelAndView mv, 
			@RequestParam(value="resellNo") int resellNo) {
		
		Resell resell = service.selectResell(resellNo);
		
		mv.addObject(resell);
		mv.setViewName("resell/updateResell");
		
		return mv;
	}
	
	@RequestMapping("/resell/updateEnd.do")
	public ModelAndView updateEndResell(ModelAndView mv, Resell r) {
		
		log.debug("{}",r);
		
		int result = service.updateResell(r);
		
		String msg="";
		String script="";
		if(result > 0) {
			msg = "수정 완료";
			script = "opener.document.location.reload();self.close();";
		}
		else {
			msg = "수정 실패.";
			script = "self.close();";
		}
		mv.addObject("msg", msg);
		mv.addObject("script",script);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/resell/write.do")
	public String writeResell() {
		return "resell/writeResell";
	}
	
	@RequestMapping("/resell/writeEnd.do")
	public ModelAndView writeEndResell(ModelAndView mv, Resell r, 
			HttpSession session, MultipartFile[] upFile,
			@RequestParam(value="memberNo") int memberNo) {
		
//		log.debug("{}",r);
//		log.debug("{}",upFile[0]);
//		log.debug("{}",upFile[1]);
		
		String path = session.getServletContext().getRealPath("/resources/upload/resell/");
		
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
		//log.debug("resell : {}",resell);
		String msg = "";
		String loc = "";
		try {
			service.insertResell(resell);
			msg = "내가구팔기 신청이 완료되었습니다.";
			loc = "/mypage/resell.do";
		} catch(RuntimeException e) {
			e.printStackTrace();
			msg = "내가구팔기 신청 실패.";
			loc = "/resell/write.do";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/resell/delete.do")
	public ModelAndView deleteResell(ModelAndView mv, 
			@RequestParam(value="resellNo") int resellNo, HttpSession session) {
		
		Resell resell = service.selectResell(resellNo);
		
		int result = service.deleteResell(resellNo);
		
		String msg = "";
		if(result>0) {
			msg = "삭제 성공";
			String path = session.getServletContext().getRealPath("/resources/upload/resell/");
			if(resell.getFiles()!=null) {
				for(FileResell fr : resell.getFiles()){
					File delFile = new File(path+fr.getRenamedFileName());
					if(delFile.exists()) delFile.delete(); 
				}
			}
		} else {
			msg = "삭제 실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", "/mypage/resell.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/resell/writeComment.do")
	public ModelAndView writeResellComment(ModelAndView mv, ResellComment resellComment, HttpSession session) {
		
		String msg = "";
		String loc = "/resell/read.do?resellNo="+resellComment.getResellNo();
		try {
			service.insertResellComment(resellComment, session);
			msg = "댓글 입력 성공";
		} catch(RuntimeException e) {
			e.printStackTrace();
			msg = "댓글 입력 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
}
