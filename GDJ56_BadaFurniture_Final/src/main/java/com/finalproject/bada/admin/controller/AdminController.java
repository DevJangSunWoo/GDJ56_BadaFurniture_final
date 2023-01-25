package com.finalproject.bada.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.admin.model.service.AdminService;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
		
	private AdminService service;
	
	@Autowired
	public AdminController(AdminService service) {
		super();
		this.service = service;
	}
	
 
	//관리자 페이지 메인 연결 - 대시보드
	@RequestMapping("/admin")
	public String adminDashBoard() {
		return "admin/adminDashBoard";
	}
	//가구 올리기 연결
	@RequestMapping("/admin/insert.do")
	public String insertFurniture() {
		return "admin/insertProduct";
	}
	//가구 수정하기 연결
	@RequestMapping("/admin/update.do")
	public String updateFurniture() {
		return "admin/updateProduct";
	}
	//가구 관리 연결
	@RequestMapping("/admin/furniture.do")
	public String manageFurniture() {
		return "admin/manageProduct";
	}
	//주문 관리 연결
	@RequestMapping("/admin/order.do")
	public String manageOrder() {
		return "admin/manageOrder";
	}
	//내가구팔기 관리 연결
	@RequestMapping("/admin/resell.do")
	public String manageResell() {
		return "admin/manageResell";
	}	
	
	
	//가구 올리기
	@RequestMapping("/admin/insertEnd.do")
	public ModelAndView insertProduct(ModelAndView mv,Product p, HttpSession session,
			MultipartFile[] upFile) {
		
//		log.debug("이름 :"+upFile[0].getName());
//		log.debug("이름 :"+upFile[0].getOriginalFilename());
//		log.debug("이름 :"+upFile[1].getName());
//		log.debug("이름 :"+upFile[1].getOriginalFilename());		
			
		
		//파일 저장할 위치
		String path=session.getServletContext().getRealPath("/resources/upload/product/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		//renamed 된 파일명 저장할 곳
		List<FileProduct> files=new ArrayList();				
		
		//파일저장
		//썸네일			
		if(!upFile[0].isEmpty()) {
			String originalFileName=upFile[0].getOriginalFilename(); //원래이름
			String ext=originalFileName.substring(originalFileName.lastIndexOf(".")); //확장자
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*100000+1);
			String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext; //절대 겹칠 수 없는 임의의 이름 만들어주기 
			
			try {
				upFile[0].transferTo(new File(path+renameFile));
				files.add(new FileProduct().builder()
						.originalFileName(originalFileName)
						.renamedFileName(renameFile)
						.thumbnail("Y")
						.build());
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			//추가 사진
			for(int i=1;i<upFile.length;i++) {
				if(!upFile[i].isEmpty()) {
					originalFileName=upFile[i].getOriginalFilename(); 
					ext=originalFileName.substring(originalFileName.lastIndexOf(".")); 
					
					sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					rnd=(int)(Math.random()*100000+1);
					renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
					
					try {
						upFile[i].transferTo(new File(path+renameFile));
						files.add(new FileProduct().builder()
								.originalFileName(originalFileName)
								.renamedFileName(renameFile)
								.thumbnail("N")
								.build());
					}catch(IOException e) {
						e.printStackTrace();
					}
				}		
			}				
			
		}

		Product product=Product.builder().title(p.getTitle())
				.price(p.getPrice())
				.item(p.getItem())
				.grade(p.getGrade())
				.material(p.getMaterial())
				.widthes(p.getWidthes())
				.depthes(p.getDepthes())
				.heights(p.getHeights())
				.color(p.getColor())
				.detail(p.getDetail())
				.files(files)
				.build();
		
		int result=service.insertProduct(product);
		
		//log.debug("result : {}",result);
		//log.debug("product : {}",product);
		//log.debug("files : {}",files);
		
		mv.addObject("msg",result>0?"가구올리기 성공":"가구올리기 실패");
		mv.addObject("loc",result>0?"/admin/furniture.do":"/admin/insert.do");
		mv.setViewName("common/msg");
		
		return mv;
		
	}
}


