package com.bswill.service;

import java.util.List;
import java.util.Map;

import com.bswill.domain.DepartmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.JobVO;

public interface CommonService {
	public String getPass(int employee_id) throws Exception;
	
	public void changePass(Map<String, Object> loginInfo) throws Exception;
	
	public EmployeeVO getEmpInfo(int employee_id) throws Exception;

	public int getCurrentEmpCnt() throws Exception;

	public List<DepartmentVO> getdeptInfo() throws Exception;

	public List<JobVO> getJobInfo() throws Exception;

	public int getRestEmpCnt() throws Exception;
}
