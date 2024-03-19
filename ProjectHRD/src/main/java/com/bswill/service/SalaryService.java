package com.bswill.service;

import java.util.List;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalaryListVO;
import com.bswill.domain.SalaryVO;

public interface SalaryService {
	
	// 급여 목록 조회
	public List<SalaryVO> getSalaryList() throws Exception;
	
	// 급여년월 급여 조회
	public List<SalaryListVO> getSalarySeach(SalaryCriteria cri) throws Exception;
}
