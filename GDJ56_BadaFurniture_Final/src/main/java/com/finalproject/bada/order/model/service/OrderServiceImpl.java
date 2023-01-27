package com.finalproject.bada.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.order.model.dao.OrderDao;
import com.finalproject.bada.product.model.vo.Product;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao dao;
	private SqlSessionTemplate session;
	public OrderServiceImpl(OrderDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	@Override
	public Product selectOrderSheet(int productNo) {
		// TODO Auto-generated method stub
		
		return dao.selectOrderSheet(session,productNo);
	}
	
	
	
	
	
	
	
	
}
