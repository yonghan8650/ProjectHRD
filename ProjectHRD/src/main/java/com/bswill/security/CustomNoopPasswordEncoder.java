package com.bswill.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;

// DB 연결 테스트를 위해서 사용하는 임시 암호화에러 처리객체 (실제 암호화 X)


public class CustomNoopPasswordEncoder implements PasswordEncoder{
	
	private static final Logger logger = LoggerFactory.getLogger(CustomNoopPasswordEncoder.class);
	@Override
	public String encode(CharSequence rawPassword) {
		logger.debug(" encode() : 암호화 처리 ");
		
		// 암호화 처리 동작 ex) 'a' -> 9, 'b' -> 6  +  salt
		
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		logger.debug(" matches() : 암호화된 비밀번호를 비교 ");
		
		return rawPassword.toString().equals(encodedPassword);
	}
	
}
