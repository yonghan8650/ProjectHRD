package com.bswill.service;

import java.util.Map;

import com.bswill.domain.EmployeeVO;

public interface CommonService {
	public String getPass(int employee_id) throws Exception;
	
	public void changePass(Map<String, Object> loginInfo) throws Exception;
	
	public EmployeeVO getEmpInfo(int employee_id) throws Exception; 
}
