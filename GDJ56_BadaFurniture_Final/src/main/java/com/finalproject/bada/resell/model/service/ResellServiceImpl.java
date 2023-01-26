package com.finalproject.bada.resell.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.resell.model.dao.ResellDao;
import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ResellServiceImpl implements ResellService {

	private ResellDao dao;
	private SqlSessionTemplate session;
	
	@Autowired 
	public ResellServiceImpl(ResellDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<Resell> selectResellList(int memberNo) {
		return dao.selectResellList(session, memberNo);
	}
	
	@Override
	@Transactional
	public void insertResell(Resell resell) {
		log.debug("service.insertResell 진입");
		
		log.debug("insert 전 resellNo : {}", resell.getResellNo());
		log.debug("{}",session);
		int result = dao.insertResell(session, resell);
		log.debug("insert 후 resellNo : {}", resell.getResellNo());
		log.debug("리서트 {}", result);
		if(result>0) {
			result = 0;
			for(FileResell fr : resell.getFiles()) {
				fr.setResellNo(resell.getResellNo());
				result += dao.insertFileResell(session, fr);
			}
			log.debug("result 2 : {}",result);
			if(result < 2) {
				throw new RuntimeException("FileResell 입력 실패");
			}
		} else {
			throw new RuntimeException("Resell 입력 실패");
		}	
	}

	@Override
	public Resell selectResell(int resellNo) {
		return dao.selectResell(session, resellNo);
	}

	@Override
	public int updateResell(Resell resell) {
		return dao.updateResell(session, resell);
	}

}
