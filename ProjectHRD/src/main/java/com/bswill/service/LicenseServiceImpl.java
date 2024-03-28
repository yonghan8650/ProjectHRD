package com.bswill.service;

import java.util.List;

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

	@Override
	public List<LicenseVO> viewEmpLicense(Integer employee_id) throws Exception {
		logger.debug("viewEmpLicense(Integer employee_id) 호출");

		return ldao.selectEmpLicense(employee_id);
	}

	@Override
	public void addEmpLicense(LicenseVO lvo) throws Exception {
		logger.debug("addEmpLicense(LicenseVO lvo) 호출");

		ldao.insertEmpLicense(lvo);
	}

	@Override
	public void subEmpLicense(LicenseVO lvo) throws Exception {
		logger.debug("subEmpLicense(LicenseVO lvo) 호출");

		ldao.deleteEmpLicense(lvo);
	}
}
