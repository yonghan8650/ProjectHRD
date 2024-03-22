package com.bswill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/common/*")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@RequestMapping(value = "/accessErr", method = RequestMethod.GET)
	public void accessDenied(Authentication auth) {
		logger.info(" accessDenied() 호출 ");
		logger.info(" 접근 권한없는 접근 발생 ");
		logger.info(" auth : " + auth);
	}

	// http://localhost:8088/common/customLogin
	@RequestMapping(value = "/customLogin", method = RequestMethod.GET)
	public void customLogin() {
		logger.debug(" customLogin() 호출 ");
	}

	// 커스텀 로그아웃 페이지 /customLogout
	@RequestMapping(value = "/customLogout", method = RequestMethod.GET)
	public void customLogout() {
		logger.debug(" customLogout() 호출 ");
		logger.debug(" 로그아웃 ");
	}
	
	// 로그인 후 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPage() {
		logger.debug(" 메인페이지 ");
	}
	

}