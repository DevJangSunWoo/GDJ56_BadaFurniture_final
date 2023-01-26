package com.finalproject.bada.resell.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;

public interface ResellDao {
	
	List<Resell> selectResellList(SqlSessionTemplate session, int memberNo);

	int insertResell(SqlSessionTemplate session, Resell resell);
	
	int insertFileResell(SqlSessionTemplate session, FileResell fr);
	
	Resell selectResell(SqlSessionTemplate session, int resellNo);
	
	int updateResell(SqlSessionTemplate session, Resell resell);
}
