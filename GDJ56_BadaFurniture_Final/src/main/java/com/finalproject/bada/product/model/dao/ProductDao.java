package com.finalproject.bada.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.mypage.model.vo.Cart;
import com.finalproject.bada.product.model.vo.Product;

public interface ProductDao {

	Product selectProduct(SqlSessionTemplate session,int productNo);
	
	List<Product> selectProductList(SqlSessionTemplate session, Map map);
	
	List<Product> productList(SqlSessionTemplate session);
	
	Cart selectCartCheck(SqlSessionTemplate session,Map map);
	
	 int selectCartCount(SqlSessionTemplate session,int cartMemberNo);
	 
	 int insertCart(SqlSessionTemplate session,Map map);
	 
}
