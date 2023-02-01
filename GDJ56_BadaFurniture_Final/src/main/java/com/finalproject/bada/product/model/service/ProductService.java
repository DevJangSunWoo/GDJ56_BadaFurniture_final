package com.finalproject.bada.product.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.mypage.model.vo.Cart;
import com.finalproject.bada.product.model.vo.Product;

public interface ProductService {

	Product selectProduct(int productNo);
	
	List<Product> selectProductList(Map map, Map<String, Integer> page);
	
	int selectProductListCount(Map map);
	
	List<Product> productList(Map<String, Integer> page);
	
	int selectProductCount();
	
	
	 Cart selectCartCheck(Map map);
	 int selectCartCount(int cartMemberNo);	
	 int insertCart(Map map);
	 
	 
}
