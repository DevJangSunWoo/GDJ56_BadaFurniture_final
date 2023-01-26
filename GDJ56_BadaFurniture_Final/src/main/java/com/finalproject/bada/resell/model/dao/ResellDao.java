package com.finalproject.bada.resell.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.resell.model.vo.Resell;

public interface ResellDao {

	int insertResell(SqlSessionTemplate session, Resell resell);
	
}
