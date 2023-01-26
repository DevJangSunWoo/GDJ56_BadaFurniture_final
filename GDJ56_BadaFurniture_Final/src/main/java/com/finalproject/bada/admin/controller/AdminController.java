package com.finalproject.bada.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.admin.model.service.AdminService;
import com.finalproject.bada.common.PageFactory;
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
//	@RequestMapping("/admin/furniture.do")
//	public String manageFurniture() {
//		return "admin/manageProduct";
//	}
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
		//파일 저장할 위치
		String path=session.getServletContext().getRealPath("/resources/upload/product/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		//renamed 된 파일명 저장할 곳
		List<FileProduct> files=new ArrayList();				
		
		//파일저장		
		for(int i=0;i<upFile.length;i++) {
			if(!upFile[i].isEmpty()) {
				String originalFileName=upFile[i].getOriginalFilename(); //원래이름
				String ext=originalFileName.substring(originalFileName.lastIndexOf(".")); //확장자
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*100000+1);
				String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext; //절대 겹칠 수 없는 임의의 이름 만들어주기 
				
				try {
					upFile[i].transferTo(new File(path+renameFile));
					files.add(new FileProduct().builder()
							.originalFileName(originalFileName)
							.renamedFileName(renameFile)
							.thumbnail(i==0?"Y":"N")
							.build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}	
		}

		Product product=Product.builder().title(p.getTitle())
				.price(p.getPrice())
				.item(p.getItem())
				.grade(p.getGrade())
				.material(p.getMaterial())
				.widths(p.getWidths())
				.depths(p.getDepths())
				.heights(p.getHeights())
				.color(p.getColor())
				.detail(p.getDetail())
				.files(files)
				.build();
		
		int result=service.insertProduct(product);
		
		mv.addObject("msg",result>0?"가구올리기 성공":"가구올리기 실패");
		mv.addObject("loc",result>0?"/admin/product.do":"/admin/insert.do");
		mv.setViewName("common/msg");
		
		return mv;
		
		
	}
	
	//가구관리 - 가구조회
	@RequestMapping("/admin/product.do")
	public ModelAndView productList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="10") int numPerpage) {
		
		//List<Product> list=service.productList();
		//log.debug("c {}", cPage);
		//log.debug("numPerpage {}", numPerpage);
		
		mv.addObject("product",service.productListPage(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		
		int totalData=service.productListCount();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData, "product.do"));
		
		
		//가구조회 요약
		List<Map<String,Integer>> sum=service.productSummary();
		//log.debug("{}",sum);		
		mv.addObject("summary",sum);		
		
		mv.setViewName("admin/manageProduct");	
		
		return mv;
	}
	
	//가구관리 - 가구삭제
	@RequestMapping("/admin/deleteProduct.do")
	public ModelAndView deleteProduct(
			@RequestParam("deleteList") List<Integer> productNoList,ModelAndView mv) {
		
		String msg="삭제에 성공했습니다.";
		String loc="/admin/product.do";
		
		for(Integer id : productNoList) {
			int result=service.deleteProduct(id);
			if(result<0) {
				msg="삭제에 실패했습니다.";
				loc="/admin/product.do";
				break;
			}
		}		

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	
	
	
}


