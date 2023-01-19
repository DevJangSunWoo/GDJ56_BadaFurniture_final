package com.finalproject.bada;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("mypage.do")
	public String mypageMain() {
		return "mypage/mypageMain";
	}
	
//	관리자 페이지 시작
	//대시보드
	@RequestMapping("/admin/dash.do")
	public String adminDashBoard() {
		return "admin/adminDashBoard";
	}
	//가구 올리기
	@RequestMapping("/admin/insert.do")
	public String insertFurniture() {
		return "admin/insertFurniture";
	}
	//가구 수정하기
	@RequestMapping("/admin/update.do")
	public String updateFurniture() {
		return "admin/updateFurniture";
	}
	//가구 관리
	@RequestMapping("/admin/furniture.do")
	public String manageFurniture() {
		return "admin/manageFurniture";
	}
	//주문 관리
	@RequestMapping("/admin/order.do")
	public String manageOrder() {
		return "admin/manageOrder";
	}
	//내가구팔기 관리
	@RequestMapping("/admin/resell.do")
	public String manageResell() {
		return "admin/manageResell";
	}	
// 관리자페이지 끝 
	

}
