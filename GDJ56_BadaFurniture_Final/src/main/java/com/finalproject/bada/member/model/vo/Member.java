package com.finalproject.bada.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member implements UserDetails{
	
	private int memberNo;
	private String memberId;
	private String email;
	private String password;
	private String memberName;
	private String phone;
	private String postCode;
	private String address;
	private String detailAddress;
	private String bankName;
	private String accountCode;
	private Date memberEnrollDate;
	private Date memberEditDate;
	
	
	//시큐리티 
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//SimpleGrantedAuthority : Granted Authority를 implement 한 클래스
		List<SimpleGrantedAuthority> auth = new ArrayList();
		
		//admin 과 기본유저에 따른 권한 설정
		if(memberId.equals("admin")) {
			auth.add(new SimpleGrantedAuthority("ADMIN"));
		}else {
			auth.add(new SimpleGrantedAuthority("MEMBER"));
		}
		
		return auth;
	}
	
	@Override
	public String getUsername() {
		return memberId;
	}
	
//	 *계정 만료 여부
//    - true : 만료 안됨
//    - false : 만료
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
//	* 계정 잠김 여부
//  - true : 잠기지않음
//  - false : 잠김
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
//	 * 비밀번호 만료 여부
//  - true : 만료 안됨
//  - false : 만료
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
//	* 사용자 활성화 여부
//  - true : 활성화
//  - false : 비활성화
	@Override
	public boolean isEnabled() {
		return true;
	}
}
