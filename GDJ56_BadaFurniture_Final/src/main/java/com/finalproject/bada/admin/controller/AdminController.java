package com.finalproject.bada.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
		
	
	//대시보드
	@RequestMapping("/admin")
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

}
