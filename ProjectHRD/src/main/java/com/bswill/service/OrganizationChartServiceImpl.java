package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.OrganizationChartVO;
import com.bswill.persistence.OrganizationChartDAO;

@Service
public class OrganizationChartServiceImpl implements OrganizationChartService {
	
	@Inject
	private OrganizationChartDAO odao;
	
	private static final Logger logger = LoggerFactory.getLogger(OrganizationChartServiceImpl.class);

	@Override
	public List<OrganizationChartVO> orgList() throws Exception {
		logger.debug(" orgList() 호출 ");
		return odao.allEmployees();
	}

	@Override
	public List<OrganizationChartVO> orgDept(int DEPTID) throws Exception {
		logger.debug(" orgDept(int DEPTID) 호출 ");
		return odao.departmentEmployees(DEPTID);
	}

	@Override
	public List<OrganizationChartVO> orgFavor() throws Exception {
		logger.debug(" orgFavor() 호출 ");
		return odao.favoriteEmployees();
	}

	
	
	
	
}
