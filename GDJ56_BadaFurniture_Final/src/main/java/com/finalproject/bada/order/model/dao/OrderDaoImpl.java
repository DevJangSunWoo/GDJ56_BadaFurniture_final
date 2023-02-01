package com.finalproject.bada.order.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	
	
	
	
	
	
	
	
	
}
