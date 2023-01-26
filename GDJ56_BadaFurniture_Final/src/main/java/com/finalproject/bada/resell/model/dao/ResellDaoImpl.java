package com.finalproject.bada.resell.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.resell.model.vo.Resell;

@Repository
public class ResellDaoImpl implements ResellDao {

	@Override
	public int insertResell(SqlSessionTemplate session, Resell resell) {
		return session.insert("resell.insertResell", resell);
	}

}
