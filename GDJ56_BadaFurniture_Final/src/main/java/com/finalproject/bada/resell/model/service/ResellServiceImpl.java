package com.finalproject.bada.resell.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.resell.model.dao.ResellDao;
import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;

@Service
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
		
		int result = dao.insertResell(session, resell);
		
		if(result>0) {
			for(FileResell fr : resell.getFiles()) {
				fr.setResellNo(resell.getResellNo());

			}
		}
		
		return result;
	}

}
