package com.finalproject.bada.member.model.service;

import java.util.Map;

import com.finalproject.bada.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberById(Member m);

	Member selectMemberByEmail(Member m);
	
	int insertMember(Member m);
	
	int updatePassword(Map param);
	
	int updateMember(Member m);
	
	String searchId(Map param);
	
	int deleteMember(int memberNo);
	
}
