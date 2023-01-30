package com.finalproject.bada.member.model.dao;

import java.util.Map;

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

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember",m);
	}

	@Override
	public int updatePassword(SqlSessionTemplate session, Map param) {
		return session.update("member.updatePassword", param);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, Member m) {
		return session.update("member.updateMember", m);
	}

	@Override
	public String searchId(SqlSessionTemplate session, Map param) {
		return session.selectOne("member.searchId", param);
	}

}
