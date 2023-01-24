package com.finalproject.bada.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.bada.admin.service.AdminService;

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
	
	
	//관리자 페이지 메인 - 대시보드
	@RequestMapping("/admin")
	public String adminDashBoard() {
		return "admin/adminDashBoard";
	}
	//가구 올리기
	@RequestMapping("/admin/insert.do")
	public String insertFurniture() {
		return "admin/insertProduct";
	}
	//가구 수정하기
	@RequestMapping("/admin/update.do")
	public String updateFurniture() {
		return "admin/updateProduct";
	}
	//가구 관리
	@RequestMapping("/admin/furniture.do")
	public String manageFurniture() {
		return "admin/manageProduct";
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
