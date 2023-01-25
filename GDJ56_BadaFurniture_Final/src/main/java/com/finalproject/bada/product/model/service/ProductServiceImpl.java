package com.finalproject.bada.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.product.model.dao.ProductDao;
import com.finalproject.bada.product.model.vo.Product;



@Service
public class ProductServiceImpl implements ProductService {
	
	private ProductDao dao;
	private SqlSessionTemplate session;
	
	
	
	
	@Autowired
	public ProductServiceImpl(ProductDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}



	@Override
	public Product selectProduct(int productNo) {
		// TODO Auto-generated method stub
		return dao.selectProduct(session, productNo);
	}

}
