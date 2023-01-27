package com.finalproject.bada.product.model.service;

import java.util.List;
import java.util.Map;

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
		this.dao = dao;
		this.session = session;
	}


	@Override
	public Product selectProduct(int productNo) {
		// TODO Auto-generated method stub
		return dao.selectProduct(session, productNo);
	}



	@Override
	public List<Product> selectProductList(Map map) {
		return dao.selectProductList(session, map);
	}

}
