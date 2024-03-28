package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import com.bswill.domain.DepartmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.JobVO;

public interface CommonDAO {
	// 패스워드 가져오기
	public String passwdSelect(int employee_id) throws Exception;
	
	public void passwdUpdate(Map<String, Object> loginInfo) throws Exception;
	
	public EmployeeVO EmpInfoSelect(int employee_id) throws Exception;

	public int currentEmpCountSelect() throws Exception;

	public List<DepartmentVO> deptInfoSelect() throws Exception;

	public List<JobVO> jobInfoSelect() throws Exception;

	public int restEmpCountSelect() throws Exception;
}
