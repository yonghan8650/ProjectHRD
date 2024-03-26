package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import com.bswill.domain.EmployeeVO;
import com.bswill.domain.NotificationVO;

public interface EmployeeDAO {

	public void insertEmp(EmployeeVO evo) throws Exception;

	public int selectEmpCount(Integer year) throws Exception;

	public List<Map<String, Object>> selectEmpList() throws Exception;

	public Map<String, Object> selectEmp(Integer employee_id) throws Exception;

	public void insertNotiEmp(NotificationVO nvo) throws Exception;

	public void updateEmpTelAndEmail(Integer employee_id, String emp_tel, String emp_mail) throws Exception;

}
