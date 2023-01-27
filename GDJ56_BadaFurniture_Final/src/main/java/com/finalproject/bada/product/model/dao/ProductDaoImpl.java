package com.finalproject.bada.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.product.model.vo.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public Product selectProduct(SqlSessionTemplate session, int productNo) {
		return session.selectOne("product.selectProduct", productNo);
	}

	@Override
	public List<Product> selectProductList(SqlSessionTemplate session, Map map) {
		return session.selectList("product.selectProductList", map);
	}

}
