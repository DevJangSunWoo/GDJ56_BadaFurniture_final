package com.finalproject.bada.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
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
		
//				loginPage ()  – 사용자 정의 로그인 페이지
//				loginProcessingUrl () – 사용자 이름과 암호를 제출할 URL
//				defaultSuccessUrl () – 성공적인 로그인 후 랜딩 페이지
//				failureUrl () – 로그인 실패 후 방문 페이지
//				logoutUrl () – 사용자 정의 로그 아웃
		
		return http.csrf().disable()
				.formLogin()
					.loginPage("/#demo-modal")
					.usernameParameter("userId")
					.passwordParameter("password")
					.loginProcessingUrl("/login.do")
					.failureForwardUrl("/member/errorPage.do")
//					.successForwardUrl("/")
					.and()
				.authorizeRequests()
					//간보기 패킷 cors에러여부를 확인하는 패킷
					.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
					.antMatchers("/").permitAll()
					.antMatchers("/resources/**").permitAll()
					.antMatchers("/logout.do").permitAll()
					//admin 권한 설정
					.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
					//member 권한 설정
					.antMatchers("/mypage/**").hasAnyAuthority("MEMBER")
					.antMatchers("/mypage.do").hasAnyAuthority("MEMBER")
					.antMatchers("/cart/**").hasAnyAuthority("MEMBER")
					.antMatchers("/alert/**").hasAnyAuthority("MEMBER")
					.antMatchers("/resell/**").hasAnyAuthority("MEMBER")
					.antMatchers("/product/cartBtn.do").hasAnyAuthority("MEMBER")
					.antMatchers("/order/**").hasAnyAuthority("MEMBER")
					.and()
				.logout()
					.logoutUrl("/member/logout.do")
					.logoutSuccessUrl("/")
					.and()
				.authenticationProvider(provider)
				.build();
	}
	
	
}
