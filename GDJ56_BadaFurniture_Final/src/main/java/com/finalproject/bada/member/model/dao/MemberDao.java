package com.finalproject.bada.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.member.model.vo.Member;

public interface MemberDao {
	
	Member selectMemberById(SqlSessionTemplate session ,Member m);

	Member selectMemberByEmail(SqlSessionTemplate session ,Member m);
	
	int insertMember(SqlSessionTemplate session,Member m);
	
	int updatePassword(SqlSessionTemplate session, Map param);
}
