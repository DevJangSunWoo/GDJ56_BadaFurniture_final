package com.finalproject.bada.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.mypage.model.vo.Cart;
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
	
	@Override
	public List<Product> productList(SqlSessionTemplate session, Map<String, Integer> page) {
		return session.selectList("product.productList", null, new RowBounds((page.get("cPage")-1) * page.get("numPerpage"), page.get("numPerpage")));
	}

	@Override
	public int selectProductCount(SqlSessionTemplate session) {
		return session.selectOne("product.selectProductCount");
	}
	
	@Override
	public Cart selectCartCheck(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectCartCheck",map);
	}

	@Override
	public int selectCartCount(SqlSessionTemplate session, int cartMemberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectCartCount", cartMemberNo);
	}

	@Override
	public int insertCart(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.insert("product.insertCart", map);
	}

	


	
	
	
}
