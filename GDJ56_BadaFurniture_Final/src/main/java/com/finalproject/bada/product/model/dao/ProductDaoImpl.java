package com.finalproject.bada.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.product.model.vo.Product;


@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public Product selectProduct(SqlSessionTemplate session, int productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectProduct", productNo);
	}

}
