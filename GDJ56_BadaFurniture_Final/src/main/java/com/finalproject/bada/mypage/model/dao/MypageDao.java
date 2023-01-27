package com.finalproject.bada.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.product.model.vo.Product;

public interface MypageDao {
	List<Product> selectCartProduct(SqlSessionTemplate session, int memberNo);
	
	int deleteCart(SqlSessionTemplate session, Map param);
}
