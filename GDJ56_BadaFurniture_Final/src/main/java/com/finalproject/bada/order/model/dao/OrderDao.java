package com.finalproject.bada.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.product.model.vo.Product;

public interface OrderDao {
	
	Product selectOrderSheet(SqlSessionTemplate session,int productNo);
	 
}
