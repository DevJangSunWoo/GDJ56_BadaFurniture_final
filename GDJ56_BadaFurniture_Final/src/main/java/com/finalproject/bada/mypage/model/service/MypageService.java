package com.finalproject.bada.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;

public interface MypageService {
	
	//Cart
	List<Product> selectCartProduct(int memberNo);
	
	int deleteCart(Map param);
	
	//Alert
	List<Alert> selectAlertList(int memberNo, int cPage, int numPerpage);
	
	int selectAlertCount(int memberNo);
	
	int deleteAlert(List<Integer> alertNos);
	
	int updateAlertReadState(int memberNo);
	
	int selectAlertCountReadStateN(int memberNo);
	
	//refund
	void insertRefund(Refund refund);
	//refund
	List<OrderDetail> selectOrderDetailRefundList(int cPage, int numPerpage, Map search);
	int selectOrderDetailRefundListCount(Map search);
}
