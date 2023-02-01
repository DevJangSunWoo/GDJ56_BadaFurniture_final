package com.finalproject.bada.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.admin.model.service.AdminService;
import com.finalproject.bada.common.AdminPageFactory;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

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

	//가구 관리 연결
//	@RequestMapping("/admin/furniture.do")
//	public String manageFurniture() {
//		return "admin/manageProduct";
//	}
	
//	//주문 관리 연결
//	@RequestMapping("/admin/order.do")
//	public String manageOrder() {
//		return "admin/manageOrder";
//	}
	
	//배송 관리 연결
	@RequestMapping("/admin/delivery.do")
	public String manageDelivery() {
		return "admin/manageDelivery";
	}
	
	//취소/반품 관리 연결
//	@RequestMapping("/admin/refund.do")
//	public String manageRefund() {
//		return "admin/manageRefund";
//	}
	
//	//내가구팔기 관리 연결
//	@RequestMapping("/admin/resell.do")
//	public String manageResell() {
//		return "admin/manageResell";
//	}		
	
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
				String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
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
			@RequestParam(value="numPerpage", defaultValue="10") int numPerpage
			,@RequestParam(value="searchType", defaultValue="SEARCH_ALL") String searchType
			,@RequestParam(value="searchKeyword", defaultValue="searchAll") String searchKeyword
			) {
		
		//List<Product> list=service.productList();
		//log.debug("cPage {}", cPage);
		//log.debug("numPerpage {}", numPerpage);
		
		//log.debug("searchType {}", searchType);
		//log.debug("searchKeyword {}", searchKeyword);
		
		Map search=new HashMap();
		search.put("searchType", searchType);
		search.put("searchKeyword", searchKeyword);
		
		mv.addObject("product",service.productListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));
		//log.debug("product : {}",service.productListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));		
		
		
		int totalData=service.productListCount(search);
		
		//log.debug("totalData {}", totalData);		
		
		mv.addObject("pageBar",AdminPageFactory.getPage(cPage, numPerpage, totalData, "product.do",searchType,searchKeyword));
		
		mv.addObject("searchType", searchType);
		mv.addObject("searchKeyword", searchKeyword);
		
		
		
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
			@RequestParam("deleteList") List<Integer> productNoList,ModelAndView mv,HttpSession session) {
		
		Map param=new HashMap();
		param.put("productNoList", productNoList);
		
		String msg="삭제에 성공했습니다.";
		String loc="/admin/product.do";
		//log.debug("productNoList : "+productNoList);
				
		String path=session.getServletContext().getRealPath("/resources/upload/product/");
		List<FileProduct> fileList=service.selectFileList(param);
		//log.debug("FILELIST : "+fileList);
		
		for(int i=0;i<fileList.size();i++) {
			String renamedFileName=fileList.get(i).getRenamedFileName();																													                     
			//log.debug("파일명 : "+renamedFileName);
			File file=new File(path+renamedFileName);				
			if(file.exists()){
				file.delete();
			}
		}						
		
		int result=service.deleteProduct(param);
		
		if(result<1) {
			msg="삭제에 실패했습니다.";
			loc="/admin/product.do";
		}
	

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//		
//		String msg="삭제에 성공했습니다.";
//		String loc="/admin/product.do";
//		
//		for(Integer id : productNoList) {
//			
//			String path=session.getServletContext().getRealPath("/resources/upload/product/");
//			
//			//productNo들고 가서 fileProduct List 가져오기	
//			List<FileProduct> fileList=service.selectFileList(id);
//			//log.debug("파일리스트 : {}",fileList);
//			
//			//renamedfilename 가져와서 
//			for(int i=0;i<fileList.size();i++) {
//				String renamedFileName=fileList.get(i).getRenamedFileName();
//				log.debug("파일명 : "+renamedFileName);
//				File file=new File(path+renamedFileName);				
//				if(file.exists()){
//					file.delete();
//					//	System.out.println(renamedFileName+" : 삭제 O");
//				}
//			}						
//			
//			int result=service.deleteProduct(id);
//			if(result<0) {
//				msg="삭제에 실패했습니다.";
//				loc="/admin/product.do";
//				break;
//			}
//		}		
//		
//		mv.addObject("msg",msg);
//		mv.addObject("loc",loc);
//		
//		mv.setViewName("common/msg");
//		
//		return mv;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	}
	
	//가구관리 - 판매상태 변경
	@RequestMapping(value="/admin/updateSoldOutState.do")
	@ResponseBody
	public Map<String,Integer> updateSoldOutState(
			@RequestParam("productNo") int productNo,
			@RequestParam("soldOutState") String soldOutState) {
		Map param=new HashMap();
		param.put("productNo", productNo);
		param.put("soldOutState", soldOutState);	
		
		//log.debug("변경할 상태 : "+soldOutState);
	
		
		int result=service.updateSoldOutState(param);
		Map<String,Integer> result2=new HashMap<String,Integer>();
		result2.put("result", result);
		
		return result2;
		
	}
	
	
	//가구관리 - 공개상태 변경
	@RequestMapping("/admin/updateShowState.do")
	@ResponseBody
	public Map<String,Integer> updateShowState(
			@RequestParam("productNo") int productNo,
			@RequestParam("showState") String showState) {
		Map param=new HashMap();
		param.put("productNo", productNo);
		param.put("showState", showState);						
				
		int result=service.updateShowState(param);
		Map<String,Integer> result2=new HashMap<String,Integer>();
		result2.put("result", result);
		
		return result2;
		
	}	
	
	//가구 관리 - 가구 수정하기 연결
	@RequestMapping("/admin/update.do")
	public ModelAndView updateproduct(
			@RequestParam("productNo") int productNo,ModelAndView mv) {
		
		Product p=service.selectProductByProductNo(productNo);
		
		//log.debug("가구 정보 : {}",p);
		
		mv.addObject("product",p);
		
		mv.setViewName("admin/updateProduct");
		return mv;
	}
	
	//가구관리 - 수정하기 완료
//	@RequestMapping("/admin/updateEnd.do")
//	public String update() {

//	}
	
	//'내가구팔기' - 조회
	@RequestMapping("/admin/resell.do")
	public ModelAndView resellList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="10") int numPerpage
			,@RequestParam(value="searchType", defaultValue="SEARCH_ALL") String searchType
			,@RequestParam(value="searchKeyword", defaultValue="searchAll") String searchKeyword
			) {		

		//log.debug("cPage {}", cPage);
		//log.debug("numPerpage {}", numPerpage);
		
		//log.debug("searchType {}", searchType);
		//log.debug("searchKeyword {}", searchKeyword);
		
		Map search=new HashMap();
		search.put("searchType", searchType);		
		search.put("searchKeyword", searchKeyword);		
		
		
		mv.addObject("resell",service.resellListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));
		//log.debug("resell : {}",service.resellListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));		
		
		int totalData=service.resellListCount(search);
		
		//log.debug("totalData {}", totalData);		
		
		mv.addObject("pageBar",AdminPageFactory.getPage(cPage, numPerpage, totalData, "resell.do",searchType,searchKeyword));
		
		mv.addObject("searchType", searchType);
		mv.addObject("searchKeyword", searchKeyword);
		
		
		
		//내가구팔기 요약
		List<Map<String,Integer>> sum=service.resellSummary();
		//log.debug("{}",sum);		
		mv.addObject("summary",sum);		
		
		mv.setViewName("admin/manageResell");	
		
		return mv;
	}
	
	//'내 가구 팔기 ' 관리 - 진행상태 변경
	@RequestMapping(value="/admin/updateProgressState.do")
	@ResponseBody
	public String updateProgressState(
			@RequestParam("resellNo") int resellNo,
			@RequestParam("progressState") String progressState) {
		Map param=new HashMap();
		param.put("resellNo", resellNo);
		param.put("progressState", progressState);	
		
		//log.debug("변경할 상태 : "+progressState);
	
		
		int result=service.updateProgressState(param);
		
		Gson gson=new Gson();
		JsonObject jsonOb=new JsonObject();
		jsonOb.addProperty("result", result);
		
		String JsonStr=gson.toJson(jsonOb);
		
		return JsonStr;
		
	}
	
	
	
	//'주문관리' - 조회
	@RequestMapping("/admin/order.do")
	public ModelAndView orderList(ModelAndView mv,
		@RequestParam(value="cPage", defaultValue="1") int cPage,
		@RequestParam(value="numPerpage", defaultValue="5") int numPerpage
		,@RequestParam(value="searchType", defaultValue="SEARCH_ALL") String searchType
		,@RequestParam(value="searchKeyword", defaultValue="searchAll") String searchKeyword
		) {		
		//log.debug("cPage {}", cPage);
		//log.debug("numPerpage {}", numPerpage);
		
		

		Map search=new HashMap();
		search.put("searchType", searchType);		
		
		if(searchType.equals("ORDER_SHEET_ENROLL_DATE")) {	
			//주문일자 들어오는 값 :2023-01-31 ~ 2023-01-31
			
			String[] keys=searchKeyword.split("~");
			
			String key1=keys[0].trim();
			String key2=keys[1].trim();
			
			//log.debug("keys :{}",key1);
			//log.debug("keys :{}",key2);				
			
			search.put("searchKeyword1", key1);			
			search.put("searchKeyword2", key2);		
			
			//log.debug("searchType {}", searchType);
			//log.debug("searchKeyword1 {}", key1);
			//log.debug("searchKeyword2 {}", key2);
			
		}else {
			search.put("searchKeyword", searchKeyword);	
			
			//log.debug("searchType {}", searchType);
			//log.debug("searchKeyword {}", searchKeyword);
			
		}		
		
		List<OrderSheet> orderSheets = service.orderListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search);
//		if(orderSheets!=null) {
//			orderSheets.stream().forEach(v->log.debug("오더시트 : {}",v));
//		}
		
		
		mv.addObject("order",service.orderListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));
		//log.debug("order : {}",service.orderListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));		
		//log.debug("order : {}",service.orderListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search).size());		
		
		
		int totalData=service.orderListCount(search);
		
		//log.debug("totalData {}", totalData);		
		
		mv.addObject("pageBar",AdminPageFactory.getPage(cPage, numPerpage, totalData, "order.do",searchType,searchKeyword));
		
		mv.addObject("searchType", searchType);
		mv.addObject("searchKeyword", searchKeyword);
		
		
		
		//내가구팔기 요약
		List<Map<String,Integer>> sum=service.orderSummary();
		//log.debug("{}",sum);		
		mv.addObject("summary",sum);		
//		
		mv.setViewName("admin/manageOrder");	
		
		return mv;
	}
	
	
	//'주문관리' - 결제상태 변경하기
	@RequestMapping(value="/admin/updatePaymentState.do")
	@ResponseBody
	public Map<String,String> updatePaymentState(
			@RequestParam("orderSheetNo") int orderSheetNo,
			@RequestParam("paymentState") String paymentState,
			@RequestParam("productNoArr") int[] productNoArr) {
		
		log.debug("가구번호들 {}",productNoArr);
		
		
		//주문서 결제상태 변경
		Map param=new HashMap();
		param.put("orderSheetNo", orderSheetNo);
		param.put("paymentState", paymentState);	
		param.put("productNoArr", productNoArr);
		//log.debug("변경할 상태 : "+paymentState);
		
		
		Map result=new HashMap();	
		
		try {
			service.updatePaymentState(param);			
			result.put("msg", ("'"+(String)param.get("paymentState"))+"'"+" 상태로 변경했습니다.");
		}catch(RuntimeException e) {
			e.printStackTrace();
			result.put("msg", "결제상태 변경에 실패했습니다.");
		}		
		
		return result;
		
	}	
	
	
	//'취소반품관리' - 조회
	@RequestMapping("/admin/refund.do")
	public ModelAndView refundList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="10") int numPerpage
			,@RequestParam(value="searchType", defaultValue="SEARCH_ALL") String searchType
			,@RequestParam(value="searchKeyword", defaultValue="searchAll") String searchKeyword
			) {		

		//log.debug("cPage {}", cPage);
		//log.debug("numPerpage {}", numPerpage);
		
		//log.debug("searchType {}", searchType);
		//log.debug("searchKeyword {}", searchKeyword);
		
		Map search=new HashMap();
		search.put("searchType", searchType);		
		search.put("searchKeyword", searchKeyword);		
		
		
		mv.addObject("refund",service.refundListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));
		//log.debug("resell : {}",service.resellListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));		
		
		int totalData=service.refundListCount(search);
		
		//log.debug("totalData {}", totalData);		
		
		mv.addObject("pageBar",AdminPageFactory.getPage(cPage, numPerpage, totalData, "refund.do",searchType,searchKeyword));
		
		mv.addObject("searchType", searchType);
		mv.addObject("searchKeyword", searchKeyword);
		
		
		
		//취소환불 요약
		List<Map<String,Integer>> sum=service.refundSummary();
		//log.debug("{}",sum);		
		mv.addObject("summary",sum);		
		
		mv.setViewName("admin/manageRefund");	
		
		return mv;
	}
	
	//'취소반품관리' - 취소상태 변경하기
	@RequestMapping(value="/admin/updateRefundState.do")
	@ResponseBody
	public Map updateRefundState(
			@RequestParam("orderDetailNo") int orderDetailNo,
			@RequestParam("refundState") String refundState) {		
		
		Map param=new HashMap();
		param.put("orderDetailNo", orderDetailNo);
		param.put("refundState", refundState);	
		//log.debug("변경할 상태 : "+paymentState);
		
		Map result=new HashMap();	
		
		try {
			service.updateRefundState(param);			
			result.put("msg", ("'"+(String)param.get("refundState"))+"'"+" 상태로 변경했습니다.");
		}catch(RuntimeException e) {
			e.printStackTrace();
			result.put("msg", "취소/반품상태 변경에 실패했습니다.");
		}		
		
		return result;
		
	}	
	
	@RequestMapping(value="/admin/viewRefundDetail.do")
	@ResponseBody
	public Refund viewRefundDetail(
			@RequestParam("orderDetailNo") int orderDetailNo ) {
		
		Refund refund=service.viewRefundDetail(orderDetailNo);
		log.debug("안녕 환불 :{}",orderDetailNo+"|"+refund);
		
		return refund;
	}
	
}


