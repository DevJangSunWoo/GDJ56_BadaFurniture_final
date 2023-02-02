package com.finalproject.bada.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.finalproject.bada.member.model.dao.MemberDao;
import com.finalproject.bada.member.model.service.MemberService;
import com.finalproject.bada.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class BadaProvider implements AuthenticationProvider{

	private MemberService service;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Autowired
	public BadaProvider(MemberService service, BCryptPasswordEncoder encoder) {
		this.service = service;
		this.encoder = encoder;
	}
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String memberId = authentication.getName(); //입력받은 아이디
		String password = (String)authentication.getCredentials(); //입력받은 패스워드
		
		Member loginMember = service.selectMemberById(Member.builder().memberId(memberId).build());
		if(loginMember==null || !encoder.matches(password, loginMember.getPassword())) {
			//아이디가 존재하지 않거나, 비밀번호가 틀린 경우 발생하는 exception 
			throw new BadCredentialsException("로그인 실패");
		}
		log.debug("loginMember: {}",loginMember);
		
//		- principal : 아이디
//		- credential : 비밀번호
//		- Spring Security에서 인증 처리
//			1. username(principal)과 password(credential)를 조합해서 UsernamePasswordAuthenticationToken 인스턴스를 만듭니다.
//			2. 이 토큰(UsernamePasswordAuthenticationToken)은 검증을 위해 AuthenticationManager의 인스턴스로 전달됩니다.
//			3. AuthenticationManager는 인증에 성공하면 Authentication 인스턴스를 리턴합니다.
//			4. 이 authentication을 SecurityContextHolder.getContext().setAuthentication(...)를 set 해줍니다.
//		- getAuthorities() : 계정이 가지고 있는 권한 목록을 리턴 (리턴값 : Collection<? extends GrantedAuthority> )
		return new UsernamePasswordAuthenticationToken(loginMember, loginMember.getPassword(), loginMember.getAuthorities());
	}


	@Override
	public boolean supports(Class<?> authentication) {
//		class.isAssignableFrom : 특정 Class가 어떤 클래스/인터페이스를 상속/구현했는지 체크
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
