package com.finalproject.bada.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.product.model.vo.Product;

public interface MypageService {
	
	//Cart
	List<Product> selectCartProduct(int memberNo);
	
	int deleteCart(Map param);
	
	//Alert
	List<Alert> selectAlertList(int memberNo, int cPage, int numPerpage);
	
	int selectAlertCount(int memberNo);
}
