package com.finalproject.bada.product.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.product.model.vo.Product;

public interface ProductService {

	Product selectProduct(int productNo);
	
	List<Product> selectProductList(Map map);
}
