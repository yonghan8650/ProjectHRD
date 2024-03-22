package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import com.bswill.domain.EmployeeVO;

public interface EmployeeDAO {

	public void insertEmp(EmployeeVO evo) throws Exception;

	public int selectEmpCount() throws Exception;

	public List<Map<String, Object>> selectEmpList() throws Exception;

	public Map<String, Object> selectEmp(Integer employee_id) throws Exception;

}
