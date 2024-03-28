package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.OrganizationChartVO;

public interface OrganizationChartDAO {

	// 사용자 ID를 기반으로 사용자 정보 가져오기
	public OrganizationChartVO getUserById(Integer employeeId) throws Exception;

	// 조직도 전체 목록
	public List<OrganizationChartVO> allEmployees() throws Exception;

	// 즐겨찾기 추가
	public void updateFavors(Integer employee_id, String FAVORS) throws Exception;

	// 즐겨찾기 목록
	public List<OrganizationChartVO> selectEmpFavorsList(Integer employee_id) throws Exception;

	// getFavors
	public String selectEmpFavors(Integer employee_id) throws Exception;

	// 부서 전체 목록
	public List<OrganizationChartVO> getDepartmentList() throws Exception;

	// 즐겨찾기에 추가
	public void addToFavorites(Integer employeeId, String favors) throws Exception;

	// 즐겨찾기에서 제거
	public void removeFromFavorites(Integer employee_id, String userId) throws Exception;

	// 부서 별 조직도 
	public List<OrganizationChartVO> getEmployeesByDept(Integer deptId) throws Exception;

}
