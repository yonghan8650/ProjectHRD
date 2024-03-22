package com.bswill.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalaryListVO;
import com.bswill.domain.SalaryVO;
import com.bswill.persistence.SalaryDAO;

@Service
public class SalaryServiceImpl implements SalaryService{

	// DAO 객체 주입
	@Inject
	private SalaryDAO sdao;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryServiceImpl.class);
	
	@Override
	public List<SalaryVO> getSalaryList() throws Exception {
		logger.debug(" getSalaryList() 실행! ");
		
		return sdao.salaryListSelect();
	}

	@Override
	public List<Map<String, Object>> getSalarySearch(SalaryCriteria cri) throws Exception {
		logger.debug(" getSalarySearch() 실행! ");
		
		return sdao.salarySearchSelect(cri);
	}

	@Override
	public List<Map<String, Object>> getSalarySearchMonthly(SalaryCriteria cri) throws Exception {
		logger.debug(" getSalarySearchMonthly() 실행! ");
		
		return sdao.salarySearchMonthlySelect(cri);
	}

	@Override
	public List<Map<String, Object>> getSalaryInfoEmp(SalaryCriteria cri) throws Exception {
		logger.debug(" getsalaryInfoEmp() 실행! ");
		
		return sdao.salaryInfoEmpSelect(cri);
	}
	
	@Override
	public List<Map<String, Object>> getSalaryInfoMore(SalaryCriteria cri) throws Exception {
		logger.debug(" getSalaryInfoMore() 실행! ");
		
		return sdao.salaryInfoMoreSelect(cri);
	}

	@Override
	public void updateSalaryInfoMore(SalaryVO svo) throws Exception {
		logger.debug(" updateSalaryInfoMore() 실행! ");
		
		sdao.salaryInfoMoreUpdate(svo);
		
	}
	
	
}
