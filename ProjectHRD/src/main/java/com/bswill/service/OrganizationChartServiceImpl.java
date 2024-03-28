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
	public OrganizationChartVO getUserById(Integer employeeId) throws Exception {
		logger.debug(" getUserById() 호출 ");
		return odao.getUserById(employeeId);
	}

	@Override
	public List<OrganizationChartVO> orgList() throws Exception {
		logger.debug("orgList() 호출");
		return odao.allEmployees();
	}

	@Override
	public void modifyFavors(Integer employee_id, String FAVORS) throws Exception {
		logger.debug("orgList() 호출");

		odao.updateFavors(employee_id, FAVORS);
	}

	@Override
	public List<OrganizationChartVO> getEmpFavorsList(Integer employee_id) throws Exception {
		logger.debug("getEmpFavorsList(int employee_id) 호출");

		return odao.selectEmpFavorsList(employee_id);
	}

	@Override
	public String getEmpFavors(Integer employee_id) throws Exception {
		logger.debug("getEmpFavors(Integer employee_id) 호출");

		return odao.selectEmpFavors(employee_id);
	}

	@Override
	public List<OrganizationChartVO> getDepartmentList() throws Exception {
		logger.debug(" getDepartmentList() 호출 ");
		return odao.getDepartmentList();
	}

	@Override
	public void removeFromFavorites(Integer employee_id, String userId) throws Exception {
		logger.debug(" removeFromFavorites() 호출");
		odao.removeFromFavorites(employee_id, userId);
	}

	@Override
	public List<OrganizationChartVO> getEmployeesByDept(Integer deptId) throws Exception {
		logger.debug(" getEmployeesByDept() 호출");
		return odao.getEmployeesByDept(deptId);
	}

}