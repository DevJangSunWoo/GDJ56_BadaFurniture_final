package com.finalproject.bada.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectMemberById(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberById", m);
	}

	@Override
	public Member selectMemberByEmail(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberByEmail", m);
	}

}
