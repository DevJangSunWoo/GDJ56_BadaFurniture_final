package com.finalproject.bada.order.model.service;

import java.util.HashMap;
import java.util.List;

import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;

public interface OrderService {
	
	Product	selectOrderSheet(int productNo);
	
	List<Product> selectOrderSheetProductList(HashMap map);
	
	void insertOrderSheet(HashMap map);
	
	List<OrderSheet> selectOrderComplete(int orderSheetNo);	
	
	 int updateSoldOutState(HashMap map);
	
	
}
