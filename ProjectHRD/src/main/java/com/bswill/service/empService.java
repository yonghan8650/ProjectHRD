package com.bswill.service;

import java.util.List;
import java.util.Map;

import com.bswill.domain.EmployeeVO;

public interface empService {

	public void registEmp(EmployeeVO evo) throws Exception;

	public List<Map<String, Object>> listEmp() throws Exception;

	public Map<String, Object> viewEmp(Integer employee_id) throws Exception;
}
