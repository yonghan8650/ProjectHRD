package com.bswill.service;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.persistence.CommonDAO;


@Service
public class CommonServiceImpl implements CommonService {
	@Inject
	private CommonDAO cdao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Override
	public String getPass(int employee_id) throws Exception {
		logger.debug(" getPass(int employee_id)실행 ");
		return cdao.passwdSelect(employee_id);
	}

	@Override
	public void changePass(Map<String, Object> loginInfo) throws Exception {
		logger.debug("changePass(Map<String, Object> loginInfo) 실행 ");
		cdao.passwdUpdate(loginInfo);
	}
	
	
	
	
}
