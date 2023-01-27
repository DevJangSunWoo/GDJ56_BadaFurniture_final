package com.finalproject.bada.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.product.model.vo.Product;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<Product> selectCartProduct(SqlSessionTemplate session, int memberNo) {
		return session.selectList("mypage.selectCartProduct", memberNo);
	}

	@Override
	public int deleteCart(SqlSessionTemplate session, Map param) {
		return session.delete("mypage.deleteCart", param);
	}

}
