package com.finalproject.bada.member.model.service;

import com.finalproject.bada.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberById(Member m);

	Member selectMemberByEmail(Member m);
}
