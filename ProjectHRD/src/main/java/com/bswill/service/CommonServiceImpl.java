package com.bswill.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.DepartmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.JobVO;
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

	@Override
	public EmployeeVO getEmpInfo(int employee_id) throws Exception {
		logger.debug(" getEmpInfo(int employee_id) 실행 ");
		return cdao.EmpInfoSelect(employee_id);
	}

	@Override
	public int getCurrentEmpCnt() throws Exception {
		logger.debug(" getCurrentEmpCnt() 실행 ");		
		return cdao.currentEmpCountSelect();
	}

	@Override
	public List<DepartmentVO> getdeptInfo() throws Exception {
		logger.debug(" getdeptInfo() 실행 ");
		return cdao.deptInfoSelect();
	}

	@Override
	public List<JobVO> getJobInfo() throws Exception {
		logger.debug(" getJobInfo() 실행 ");
		return cdao.jobInfoSelect();
	}
	
	@Override
	public int getRestEmpCnt() throws Exception {
		logger.debug(" getRestEmpCnt() 실행 ");		
		return cdao.restEmpCountSelect();
	}
	
	
	
	
	
	
}
