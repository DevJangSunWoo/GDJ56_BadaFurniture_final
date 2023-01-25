package com.finalproject.bada.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception {
		
		return http.csrf().disable()
				.formLogin()
					.successForwardUrl("/")
					.and()
				.authorizeRequests()
					.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
				.antMatchers("/**").permitAll()
				.and()
				.build();
	}
	
	
}
