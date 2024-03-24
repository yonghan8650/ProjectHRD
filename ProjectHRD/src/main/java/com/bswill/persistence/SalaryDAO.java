package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalarylistVO;
import com.bswill.domain.SalaryVO;

public interface SalaryDAO {
	
	public List<SalaryVO> salaryListSelect() throws Exception;

	public List<Map<String, Object>> salarySearchEmpSelect(SalaryCriteria cri) throws Exception;
	
	public List<Map<String, Object>> salarySearchMoreSelect(SalaryCriteria cri) throws Exception;
	
	public List<Map<String, Object>> salarySearchMonthlySelect(SalaryCriteria cri) throws Exception;
	
	public List<Map<String, Object>> salaryInfoEmpSelect(SalaryCriteria cri) throws Exception;
	
	public List<Map<String, Object>> salaryInfoMoreSelect(SalaryCriteria cri) throws Exception;
	
	public void salaryInfoMoreUpdate(SalaryVO svo) throws Exception;
	
	public List<Map<String, Object>> salaryEnterEmpSelect(SalaryCriteria cri) throws Exception;
	
	public List<Map<String, Object>> salaryEnterMoreSelect(SalaryCriteria cri) throws Exception;
	
	public void salaryEnterInsert(SalarylistVO slvo) throws Exception;
}
