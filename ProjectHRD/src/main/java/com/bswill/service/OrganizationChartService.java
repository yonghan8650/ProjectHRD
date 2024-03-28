package com.bswill.service;

import java.util.List;

import com.bswill.domain.OrganizationChartVO;

public interface OrganizationChartService {

	// 사용자 ID를 기반으로 사용자 정보 가져오기
	public OrganizationChartVO getUserById(Integer employeeId) throws Exception;

	// 조직도 전체 목록 동작
	public List<OrganizationChartVO> orgList() throws Exception;

	// 즐겨찾기 수정
	public void modifyFavors(Integer employee_id, String FAVORS) throws Exception;

	// 즐겨찾기 목록
	public List<OrganizationChartVO> getEmpFavorsList(Integer employee_id) throws Exception;

	// getFAVORS
	public String getEmpFavors(Integer employee_id) throws Exception;

	// 전체 부서 목록    
	public List<OrganizationChartVO> getDepartmentList() throws Exception;

	// 즐겨찾기 해제
	public void removeFromFavorites(Integer employee_id, String userId) throws Exception;

	// 부서별 조직도
	public List<OrganizationChartVO> getEmployeesByDept(Integer deptId) throws Exception;

}
