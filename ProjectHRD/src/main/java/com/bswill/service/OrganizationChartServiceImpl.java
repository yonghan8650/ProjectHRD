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
	public List<OrganizationChartVO> getDepartmentList() throws Exception {
		logger.debug(" getDepartmentList() 호출 ");
	    return odao.getDepartmentList();
	}

	@Override
	public List<OrganizationChartVO> orgFavor() throws Exception {
		logger.debug(" orgFavor() 호출 ");
		return odao.favoriteEmployees();
	}

	@Override
	public void addToFavorites(int employee_id) throws Exception {
		logger.debug(" addToFavorites() 호출");
        odao.addToFavorites(employee_id);
	}

	@Override
	public void removeFromFavorites(int employee_id) throws Exception {
		logger.debug(" removeFromFavorites() 호출");
        odao.removeFromFavorites(employee_id);
		
	}

	@Override
    public List<OrganizationChartVO> getEmployeesByDept(int deptId) throws Exception {
		logger.debug(" getEmployeesByDept() 호출");
        return odao.getEmployeesByDept(deptId);
    }
}