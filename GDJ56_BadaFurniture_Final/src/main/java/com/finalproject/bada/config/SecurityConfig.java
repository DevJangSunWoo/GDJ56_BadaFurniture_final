package com.finalproject.bada.config;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	private BadaProvider provider;
	
	@Autowired
	public SecurityConfig(BadaProvider provider) {
		super();
		this.provider = provider;
	}

	@Bean
	public SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception {
		
		return http.csrf().disable()
				.formLogin()
//					.successForwardUrl("/")
					.and()
				.authorizeRequests()
					//간보기 패킷 cors에러여부를 확인하는 패킷
					.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
					.antMatchers("/resources/**").permitAll()
					.antMatchers("/logout.do").permitAll()
					//admin 권한 설정
					.antMatchers("/admin/**").hasAnyRole("ADMIN")
					.antMatchers("/mypage/**").hasAnyAuthority("MEMBER")
					.antMatchers("/mypage.do").hasAnyAuthority("MEMBER")
					.antMatchers("/").permitAll()
//					.antMatchers("/**").permitAll()
					.and()
				.logout()
					.logoutUrl("/logout.do")
					.and()
				.authenticationProvider(provider)
				.build();
	}
	
	
}
