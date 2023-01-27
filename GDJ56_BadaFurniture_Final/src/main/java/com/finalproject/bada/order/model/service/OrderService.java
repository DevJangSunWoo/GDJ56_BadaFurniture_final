package com.finalproject.bada.order.model.service;

import com.finalproject.bada.product.model.vo.Product;

public interface OrderService {
	
	Product	selectOrderSheet(int productNo);
	
}
