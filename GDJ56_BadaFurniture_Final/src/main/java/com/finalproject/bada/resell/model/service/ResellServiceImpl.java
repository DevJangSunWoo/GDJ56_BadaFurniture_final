package com.finalproject.bada.resell.model.service;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.common.AlertFactory;
import com.finalproject.bada.member.model.vo.Member;
import com.finalproject.bada.mypage.model.dao.MypageDao;
import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.resell.model.dao.ResellDao;
import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;
import com.finalproject.bada.resell.model.vo.ResellComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ResellServiceImpl implements ResellService {

	private ResellDao dao;
	private SqlSessionTemplate session;
	private MypageDao mypageDao;
	
	@Autowired 
	public ResellServiceImpl(ResellDao dao, SqlSessionTemplate session, MypageDao mypageDao) {
		this.dao = dao;
		this.session = session;
		this.mypageDao = mypageDao;
	} 
	
	@Override
	public List<Resell> selectResellList(int memberNo, int cPage, int numPerpage) {
		return dao.selectResellList(session, memberNo, cPage, numPerpage);
	}
	
	@Override
	@Transactional
	public void insertResell(Resell resell) {
		
		int result = dao.insertResell(session, resell);

		if(result>0) {
			result = 0;
			for(FileResell fr : resell.getFiles()) {
				fr.setResellNo(resell.getResellNo());
				result += dao.insertFileResell(session, fr);
			}
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

	@Override
	public int deleteResell(int resellNo) {
		return dao.deleteResell(session, resellNo);
	}

	@Override
	@Transactional
	public void insertResellComment(ResellComment resellComment, HttpSession httpSession) {
		int result = dao.insertResellComment(session, resellComment);
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member)authentication.getPrincipal();
		if(result>0 && loginMember != null && loginMember.getMemberId().equals("admin")) {
			Resell resell = dao.selectResell(session, resellComment.getResellNo());
			String alertMsg = AlertFactory.getAlertMsg(httpSession.getServletContext().getContextPath(), "resellComment", resell);
			result = 0;
			result = mypageDao.insertAlert(session, Alert.builder().memberNo(resell.getMember().getMemberNo()).detail(alertMsg).build());
			if(result <= 0) {
				throw new RuntimeException("알림 등록 실패");
			}
		} else if(result <= 0) { 
			throw new RuntimeException("댓글 등록 실패");
		}
	}

	@Override
	public int selectResellCount(int memberNo) {
		return dao.selectResellCount(session, memberNo);
	}

}
