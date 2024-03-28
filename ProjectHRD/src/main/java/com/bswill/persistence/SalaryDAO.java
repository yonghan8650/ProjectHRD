package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import com.bswill.domain.SalaryCri;
import com.bswill.domain.SalarylistVO;
import com.bswill.domain.SalaryVO;

public interface SalaryDAO {

	public List<Map<String, Object>> salarySearchEmpSelect(SalaryCri cri) throws Exception;
	
	public List<Map<String, Object>> salarySearchMeSelect(SalaryCri cri, Integer emp_id) throws Exception;
	
	public List<Map<String, Object>> salarySearchMoreSelect(SalaryCri cri) throws Exception;
	
	public List<Map<String, Object>> salarySearchMonthlySelect(String yearMonth) throws Exception;
	
	public List<Map<String, Object>> salaryInfoEmpSelect(SalaryCri cri) throws Exception;
	
	public List<Map<String, Object>> salaryInfoMoreSelect(SalaryCri cri) throws Exception;
	
	public List<Map<String, Object>> salaryInfoNewSelect(SalaryCri cri) throws Exception;
	
	public void salaryInfoMoreUpdate(SalaryVO svo) throws Exception;
	
	public List<Map<String, Object>> salaryEnterEmpSelect(SalaryCri cri) throws Exception;
	
	public List<Map<String, Object>> salaryEnterMoreSelect(SalaryCri cri) throws Exception;
	
	public List<Map<String, Object>> salaryEnterSelect(SalaryCri cri) throws Exception;
	
	public void salaryEnterInsert(SalarylistVO slvo) throws Exception;
}
