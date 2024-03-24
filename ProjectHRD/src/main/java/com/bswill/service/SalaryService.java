package com.bswill.service;

import java.util.List;
import java.util.Map;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalarylistVO;
import com.bswill.domain.SalaryVO;

public interface SalaryService {
	
	// 급여 목록 조회
	public List<SalaryVO> getSalaryList() throws Exception;
	
	// 급여 조회 급여 목록  조회
	public List<Map<String, Object>> getSalarySearchEmp(SalaryCriteria cri) throws Exception;
	
	// 급여 조회 급여 명세서  조회
	public List<Map<String, Object>> getSalarySearchMore(SalaryCriteria cri) throws Exception;
	
	// 월별 급여 조회
	public List<Map<String, Object>> getSalarySearchMonthly(SalaryCriteria cri) throws Exception;
	
	// 급상여기본정보 기본정보 조회 (사원정보)
	public List<Map<String, Object>> getSalaryInfoEmp(SalaryCriteria cri) throws Exception;
	
	// 급상여기본정보 상세정보 조회
	public List<Map<String, Object>> getSalaryInfoMore(SalaryCriteria cri) throws Exception;
	
	// 급상여기본정보 상세정보 수정
	public void updateSalaryInfoMore(SalaryVO svo) throws Exception;
	
	// 급여입력 기본정보 조회
	public List<Map<String, Object>> getSalaryEnterEmp(SalaryCriteria cri) throws Exception;
	
	// 급여입력 급여정보 조회
	public List<Map<String, Object>> getSalaryEnterMore(SalaryCriteria cri) throws Exception;
	
	// 급여입력 급여정보 입력
	public void insertSalaryEnter(SalarylistVO slvo) throws Exception;
}
