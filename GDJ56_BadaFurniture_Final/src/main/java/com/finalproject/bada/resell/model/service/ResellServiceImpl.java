package com.finalproject.bada.resell.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.finalproject.bada.resell.model.dao.ResellDao;
import com.finalproject.bada.resell.model.vo.Resell;

public class ResellServiceImpl implements ResellService {

	private ResellDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ResellServiceImpl(ResellDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public int insertResell(Resell resell) {
		// TODO Auto-generated method stub
		return 0;
	}

}
