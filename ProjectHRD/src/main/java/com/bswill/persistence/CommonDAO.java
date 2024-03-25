package com.bswill.persistence;

import java.util.Map;

import com.bswill.domain.EmployeeVO;

public interface CommonDAO {
	// 패스워드 가져오기
	public String passwdSelect(int employee_id) throws Exception;
	
	public void passwdUpdate(Map<String, Object> loginInfo) throws Exception;
	
	public EmployeeVO EmpInfoSelect(int employee_id) throws Exception;
}
