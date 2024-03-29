package com.bswill.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.SalaryCri;
import com.bswill.domain.SalarylistVO;
import com.bswill.domain.SalaryVO;
import com.bswill.persistence.SalaryDAO;

@Service
public class SalaryServiceImpl implements SalaryService{

	// DAO 객체 주입
	@Inject
	private SalaryDAO sdao;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryServiceImpl.class);

	@Override
	public List<Map<String, Object>> getSalarySearchEmp(SalaryCri cri) throws Exception {
		logger.debug(" getSalarySearchEmp() 실행! ");
		
		return sdao.salarySearchEmpSelect(cri);
	}
	
	@Override
	public List<Map<String, Object>> getSalarySearchMe(SalaryCri cri, Integer emp_id) throws Exception {
		logger.debug(" getSalarySearchEmp() 실행! ");
		
		return sdao.salarySearchMeSelect(cri, emp_id);
	}
	
	@Override
	public List<Map<String, Object>> getSalarySearchMore(SalaryCri cri) throws Exception {
		logger.debug(" getSalarySearchMore() 실행! ");
		
		return sdao.salarySearchMoreSelect(cri);
	}

	@Override
	public List<Map<String, Object>> getSalaryInfoEmp(SalaryCri cri) throws Exception {
		logger.debug(" getsalaryInfoEmp() 실행! ");
		
		return sdao.salaryInfoEmpSelect(cri);
	}
	
	@Override
	public List<Map<String, Object>> getSalaryInfoMore(SalaryCri cri) throws Exception {
		logger.debug(" getSalaryInfoMore() 실행! ");
		
		return sdao.salaryInfoMoreSelect(cri);
	}
	
	@Override
	public List<Map<String, Object>> getSalaryInfoNew(SalaryCri cri) throws Exception {
		logger.debug(" getSalaryInfoMore() 실행! ");
		
		return sdao.salaryInfoNewSelect(cri);
	}

	@Override
	public void updateSalaryInfoMore(SalaryVO svo) throws Exception {
		logger.debug(" updateSalaryInfoMore() 실행! ");
		
		sdao.salaryInfoMoreUpdate(svo);
	}

	@Override
	public List<Map<String, Object>> getSalaryEnterEmp(SalaryCri cri) throws Exception {
		logger.debug(" getSalaryEnterEmp() 실행! ");
		
		return sdao.salaryEnterEmpSelect(cri);
	}

	@Override
	public List<Map<String, Object>> getSalaryEnterMore(SalaryCri cri) throws Exception {
		logger.debug(" getSalaryEnterMore() 실행! ");
		
		return sdao.salaryEnterMoreSelect(cri);
	}
	
	@Override
	public List<Map<String, Object>> getSalaryEnter(SalaryCri cri) throws Exception {
		logger.debug(" getSalaryEnter() 실행! ");
		
		return sdao.salaryEnterSelect(cri);
	}
	
	@Override
	public void insertSalaryEnter(SalarylistVO slvo) throws Exception {
		logger.debug(" insertSalaryEnter() 실행! ");
		
		sdao.salaryEnterInsert(slvo);
	}
}
