package com.finalproject.bada.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.mypage.model.dao.MypageDao;
import com.finalproject.bada.product.model.vo.Product;

@Service
public class MypageServiceImpl implements MypageService {
	
	private MypageDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MypageServiceImpl(MypageDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}


	@Override
	public List<Product> selectCartProduct(int memberNo) {
		return dao.selectCartProduct(session, memberNo);
	}

	@Override
	public int deleteCart(Map param) {
		return dao.deleteCart(session, param);
	}

	
	
}
