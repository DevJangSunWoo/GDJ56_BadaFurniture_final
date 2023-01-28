package com.finalproject.bada.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.mypage.model.vo.Cart;
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


	@Override
	public Cart selectCartCheck(Map map) {
		// TODO Auto-generated method stub
		return dao.selectCartCheck(session,map);
	}


	@Override
	public int selectCartCount(int cartMemberNo) {
		// TODO Auto-generated method stub
		return dao.selectCartCount(session,cartMemberNo);
	}


	@Override
	@Transactional
	public int insertCart(Map map) {
		// TODO Auto-generated method stub
		return dao.insertCart(session,map);
	}
	
	
	
	
	
	
}
