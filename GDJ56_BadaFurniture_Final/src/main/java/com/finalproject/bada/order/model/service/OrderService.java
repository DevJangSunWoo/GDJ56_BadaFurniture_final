package com.finalproject.bada.order.model.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;

public interface OrderService {

	Product selectOrderSheet(int productNo);

	List<Product> selectOrderSheetProductList(HashMap map);

	void insertOrderSheet(HashMap map);

	List<OrderSheet> selectOrderComplete(int orderSheetNo);

	// int updateSoldOutState(HashMap map);

	List<OrderSheet> selectOrderSheetUndepositedList();

	void updateUndeposited(String contextPath);

	List<OrderDetail> selectOrderDetailCancelCompleted();

}
