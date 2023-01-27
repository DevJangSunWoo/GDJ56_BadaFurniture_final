package com.finalproject.bada.mypage.model.service;

import java.util.List;

import com.finalproject.bada.product.model.vo.Product;

public interface MypageService {

	List<Product> selectCartProduct(int memberNo);
	
	
}
