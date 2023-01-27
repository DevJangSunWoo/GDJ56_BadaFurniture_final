package com.finalproject.bada.order.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	
	
	
	
}
