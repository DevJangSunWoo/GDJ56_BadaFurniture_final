package com.finalproject.bada.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.member.model.dao.MemberDao;
import com.finalproject.bada.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MemberServiceImpl(MemberDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public Member selectMemberById(Member m) {
		return dao.selectMemberById(session,m);
	}

	@Override
	public Member selectMemberByEmail(Member m) {
		return dao.selectMemberByEmail(session,m);
	}

	@Override
	public int insertMember(Member m) {
		return dao.insertMember(session,m);
	}

}
