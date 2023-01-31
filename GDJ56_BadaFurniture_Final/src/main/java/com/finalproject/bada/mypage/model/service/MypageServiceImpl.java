package com.finalproject.bada.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.mypage.model.dao.MypageDao;
import com.finalproject.bada.mypage.model.vo.Alert;
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


	@Override
	public List<Alert> selectAlertList(int memberNo, int cPage, int numPerpage) {
		return dao.selectAlertList(session, memberNo, cPage, numPerpage);
	}


	@Override
	public int selectAlertCount(int memberNo) {
		return dao.selectAlertCount(session, memberNo);
	}


	@Override
	public int deleteAlert(List<Integer> alertNos) {
		return dao.deleteAlert(session, alertNos);
	}


	@Override
	public int updateAlertReadState(int memberNo) {
		return dao.updateAlertReadState(session, memberNo);
	}
	
	@Override
	public int selectAlertCountReadStateN(int memberNo) {
		return dao.selectAlertCountReadStateN(session, memberNo);
	}
	
}
