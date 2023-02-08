package com.finalproject.bada.order.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public Product selectOrderSheet(SqlSessionTemplate session, int productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("order.selectOrderSheet", productNo);
	}

	@Override
	public List<Product> selectOrderSheetProductList(SqlSessionTemplate session,HashMap map) {
		// TODO Auto-generated method stub
		return session.selectList("order.selectOrderSheetProductList",map);
	}

	@Override
	public int insertOrderSheet(SqlSessionTemplate session, HashMap map) {
		// TODO Auto-generated method stub
		return session.insert("order.insertOrderSheet", map);
	}

	@Override
	public int insertOrderDetail(SqlSessionTemplate session, HashMap map) {
		// TODO Auto-generated method stub
		return session.insert("order.insertOrderDetail",map);
	}

	@Override
	public List<OrderSheet> selectOrderComplete(SqlSessionTemplate session, int orderSheetNo) {
		// TODO Auto-generated method stub
		return session.selectList("order.selectOrderComplete",orderSheetNo);
	
	}

	@Override
	public int updateSoldOutState(SqlSessionTemplate session, HashMap map) {
		// TODO Auto-generated method stub
		return session.update("order.updateSoldOutState",map);
	}

	@Override
	public int deleteMemberCart(SqlSessionTemplate session, HashMap map) {
		// TODO Auto-generated method stub
		return session.delete("order.deleteMemberCart",map);
	}

	@Override
	public int selectCartCount(SqlSessionTemplate session, HashMap map) {
		// TODO Auto-generated method stub
		return session.selectOne("order.selectCartCount", map);
	}

	@Override
	public List<OrderSheet> selectOrderSheetUndepositedList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("order.selectOrderSheetUndepositedList");
	}

	@Override
	public int updateOrderSheetUndeposited(SqlSessionTemplate session,HashMap param) {
		// TODO Auto-generated method stub
		return session.update("order.updateOrderSheetUndeposited",param);
	}

	@Override
	public int updateOrderDetailRefundState(SqlSessionTemplate session, HashMap param) {
		// TODO Auto-generated method stub
		return session.update("order.updateOrderDetailRefundState", param);
	}

	
	@Override
	public List<OrderDetail> selectOrderDetailCancelCompleted(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("order.selectOrderDetailCancelCompleted");
	}

	@Override
	public int insertRefund(SqlSessionTemplate session, int orderDetailNo) {
		// TODO Auto-generated method stub
		return session.insert("order.insertRefund", orderDetailNo);
	}

	@Override
	public int updateRefundProductSoldOutState(SqlSessionTemplate session, HashMap param) {
		// TODO Auto-generated method stub
		return session.update("order.updateRefundProductSoldOutState", param);
	}

	@Override
	public List<Product> selectProductListShowState(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("order.selectProductListShowState");
	}

	@Override
	public int updateProductShowState(SqlSessionTemplate session, HashMap param) {
		// TODO Auto-generated method stub
		return session.update("order.updateProductShowState", param);
	}

	@Override
	public List<OrderDetail> selectOrderDetailConfirmStateN(SqlSessionTemplate session) {
		return session.selectList("order.selectOrderDetailConfirmStateN");
	}

	@Override
	public int updateOrderDetailConfirmStateNtoY(SqlSessionTemplate session, HashMap param) {
		return session.update("order.updateOrderDetailConfirmStateNtoY", param);
	}

	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
}
