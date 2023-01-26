package com.finalproject.bada.resell.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.resell.model.vo.Resell;

public class ResellDaoImpl implements ResellDao {

	@Override
	public int insertResell(SqlSessionTemplate session, Resell resell) {
		return session.insert("resell.insertResell", resell);
	}

}
