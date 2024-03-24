package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.OrganizationChartVO;
import com.bswill.persistence.OrganizationDAO;

@Service
public class OrganizationServiceImpl implements OrganizationService {
	
	@Inject
	private OrganizationDAO odao;
	
	private static final Logger logger = LoggerFactory.getLogger(OrganizationServiceImpl.class);

	@Override
	public List<OrganizationChartVO> organizationList() throws Exception{
		logger.debug(" organizationList() 실행 ");
		return odao.organizationListSelect();
	}

	@Override
	public void checkFavors(int employee_id) throws Exception {
		logger.debug(" checkFavors(int employee_id) 실행 ");
		odao.checkFavorites(employee_id);
	}
	
	
	
}
