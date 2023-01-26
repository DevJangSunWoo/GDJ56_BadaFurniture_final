package com.finalproject.bada.admin.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.product.model.vo.Product;

public interface AdminService {
	
	//가구 올리기
	int insertProduct(Product product);
	
	//가구관리 - 조회
	List<Product> productList();
	List<Product> productListPage(Map<String,Integer> param);
	int productListCount();
	
	//가구관리 - 요약
	List<Map<String,Integer>> productSummary();
}
