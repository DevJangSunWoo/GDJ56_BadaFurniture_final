package com.finalproject.bada.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.product.model.vo.Product;

public interface ProductDao {

	Product selectProduct(SqlSessionTemplate session,int productNo);
	
	
}
