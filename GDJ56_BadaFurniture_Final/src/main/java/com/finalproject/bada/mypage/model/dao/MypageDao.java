package com.finalproject.bada.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;

public interface MypageDao {
	//Cart
	List<Product> selectCartProduct(SqlSessionTemplate session, int memberNo);
	
	int deleteCart(SqlSessionTemplate session, Map param);
	
	//Alert
	List<Alert> selectAlertList(SqlSessionTemplate session, int memberNo, int cPage, int numPerpage);
	
	int selectAlertCount(SqlSessionTemplate session, int memberNo);
	
	int insertAlert(SqlSessionTemplate session, Alert alert);
	
	String getAlertMsg(String path, String state, Object obj);
	
	int deleteAlert(SqlSessionTemplate session, List<Integer> alertNos);
	
	int updateAlertReadState(SqlSessionTemplate session, int memberNo);
	
	int selectAlertCountReadStateN(SqlSessionTemplate session, int memberNo);
	
	int insertRefund(SqlSessionTemplate session, Refund refund);
	
	int updateOrderDetailRefundState(SqlSessionTemplate session, Map param);
}
