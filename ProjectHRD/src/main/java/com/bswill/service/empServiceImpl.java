package com.bswill.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.EmployeeVO;
import com.bswill.persistence.empDAO;

@Service
public class empServiceImpl implements empService {

	private static final Logger logger = LoggerFactory.getLogger(empServiceImpl.class);

	@Inject
	private empDAO edao;

	@Override
	public void registEmp(EmployeeVO evo) throws Exception {
		logger.debug("registEmp(empVO evo) 호출");

		edao.insertEmp(evo);
		
		logger.debug("신입사원 등록 완료");
	}

}
