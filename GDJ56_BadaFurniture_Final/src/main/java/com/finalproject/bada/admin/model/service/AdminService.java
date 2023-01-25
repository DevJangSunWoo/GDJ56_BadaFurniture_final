package com.finalproject.bada.admin.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.product.model.vo.Product;

public interface AdminService {
	
	int insertProduct(Product product);
	
	List<Product> productList();
	List<Product> productListPage(Map<String,Integer> param);
	int productListCount();
}
