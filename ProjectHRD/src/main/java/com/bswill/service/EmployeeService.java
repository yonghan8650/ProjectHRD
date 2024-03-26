package com.bswill.service;

import java.util.List;
import java.util.Map;

import com.bswill.domain.EmployeeVO;
import com.bswill.domain.NotificationVO;

public interface EmployeeService {

	public int countEmpNo(Integer year) throws Exception;

	public void registEmp(EmployeeVO evo) throws Exception;

	public List<Map<String, Object>> listEmp() throws Exception;

	public Map<String, Object> viewEmp(Integer employee_id) throws Exception;

	public void notifyModification(NotificationVO nvo) throws Exception;

	public void modifyEmpTelAndEmail(Integer employee_id, String emp_tel, String emp_mail) throws Exception;
}
