package com.bswill.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.LicenseVO;
import com.bswill.persistence.LicenseDAO;

@Service
public class LicenseServiceImpl implements LicenseService {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);

	@Inject
	private LicenseDAO ldao;

	@Override
	public void registLicense(LicenseVO lvo) throws Exception {
		logger.debug("registLicense(LicenseVO lvo) 호출");
		
		ldao.insertLicense(lvo);
	}
}
