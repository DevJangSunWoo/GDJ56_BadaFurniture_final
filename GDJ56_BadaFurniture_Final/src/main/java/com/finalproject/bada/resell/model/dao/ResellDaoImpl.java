package com.finalproject.bada.resell.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;

@Repository
public class ResellDaoImpl implements ResellDao {
	
	@Override
	public List<Resell> selectResellList(SqlSessionTemplate session, int memberNo) {
		return session.selectList("resell.selectResellList",memberNo);
	}
	
	@Override
	public int insertResell(SqlSessionTemplate session, Resell resell) {
		return session.insert("resell.insertResell", resell);
	}

	@Override
	public int insertFileResell(SqlSessionTemplate session, FileResell fr) {
		return session.insert("resell.insertFileResell", fr);
	}

	

}
